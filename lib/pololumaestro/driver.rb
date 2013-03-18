require "serialport"

module PololuMaestro

  #
  # Pololu Mini Maestro Driver
  # http://www.pololu.com/catalog/product/1352
  # http://www.pololu.com/docs/pdf/0J40/maestro.pdf
  #
  # Pinout: Pg. 10
  # Protocol: Pg. 37
  #
  class Driver
    def initialize(port)
      @port = SerialPort.open(port)
    end

    def close
      @port.close
    end

    def write(*bytes)
      @port.write(bytes.map(&:chr).join)
    end

    def low(n)
      n & 0x7F
    end

    def high(n)
      (n >> 7) & 0x7F
    end

    def go_home
      write(0xA2)
    end

    def set_target(channel, target)
      write 0x84, channel, low(target), high(target)
    end

    def set_speed(channel, speed)
      write 0x87, channel, low(speed), high(speed)
    end
  end
end
