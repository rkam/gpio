# NOTE: this script (and gem) requires RUBY_VERSION >= '2.0'
#       (so, if there's a syntax error, that's why)

$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require "gpio"

def blink(params)
  pin = GPIO::OutputPin.new(params)

  pin.on
  puts "Pin #{pin.software_pin} (HW pin #{pin.hardware_pin}) is #{pin.state ? "on" : "off"}"

  sleep 1

  pin.off
  puts "Pin #{pin.software_pin} (HW pin #{pin.hardware_pin}) is #{pin.state ? "on" : "off"}"

  pin.device.unexport! pin.software_pin
end

# ------------------------------------------------------------------------------

device = :RaspberryPi           # A,  B - Revision1
device = :RaspberryPiRevision2  # A,  B - Revision2
device = :RaspberryPi40Pin      # A+, B+, 2, Zero, 3

# ------------------------------------------------------------------------------

# HWPIN 7 on any device == SW PIN 4
blink(pin: 7, device: device)

blink(pin: 4, device: device, mapping: :software)
