module PololuMaestro
  class Servo
    attr_accessor :min_angle, :max_angle, :min_ms, :max_ms

    def initialize(driver, channel)
      @driver = driver
      @channel = channel
    end

    def set_angle(angle)
      raise RuntimeError.new("Angle too low") if angle < @min_angle
      raise RuntimeError.new("Angle too high") if angle > @max_angle

      ratio = (angle - @min_angle).to_f / (@max_angle - @min_angle)
      pos = @min_ms + (ratio * (@max_ms - @min_ms))

      @driver.set_target(@channel, pos.to_i * 4)
    end

    def set_speed(speed)
      @driver.set_speed(@channel, speed)
    end
  end
end
