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

device = :RaspberryPi
device = :RaspberryPiRevision2

# ------------------------------------------------------------------------------

# HWPIN 7 on any device == SW PIN 4
blink(pin: 7, device: device)

blink(pin: 4, device: device, mapping: :software)
