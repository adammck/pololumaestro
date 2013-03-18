require "pololumaestro"
include PololuMaestro

driver = Driver.new("/dev/cu.usbmodem00051001")
channels = [0, 1]

servos = channels.map do |channel|
  Servo.new(driver, channel)
end

servos.each do |servo|
  servo.min_angle = -45
  servo.max_angle = 45
  servo.min_ms = 800
  servo.max_ms = 2200
  servo.set_speed(1000)
end

ARGV.each do |arg|
  servos.each do |servo|
    servo.set_angle(arg.to_i)
  end

  sleep 0.2
end

driver.close
