module GPIO
  module RaspberryPi40Pin
    extend Device

    VALIDATE_FILE  = "/sys/class/gpio/gpiochip0/label"
    VALIDATE_VALUE = "bcm2708_gpio"

    MAPPING        = :hardware

    BASE_PATH      = '/sys/class/gpio/'
    EXPORT_PATH    = "#{BASE_PATH}export"
    UNEXPORT_PATH  = "#{BASE_PATH}unexport"
    PIN_PREFIX     = "gpio"
    DIRECTION_FILE = "direction"
    VALUE_FILE     = "value"

    HARDWARE_PINS = [ 3,5,7, 8,10,11,12,13,15,16,17,19,21,22,23,24,26, 5, 6,12,13,19,16,26,20,21 ]
    SOFTWARE_PINS = [ 2,3,4,14,15,17,18,27,22,23,24,10, 9,25,11, 8, 7,29,31,32,33,35,36,37,38,40 ]
    # version 1 diff: 0 1               21                             -  -  -  -  -  -  -  -  -
    # version 2 diff:                                                  -  -  -  -  -  -  -  -  -

    # For reference - Unused
    P5_HARDWARE_PINS = [  3,  4,  5,  6 ]
    P5_SOFTWARE_PINS = [ 28, 29, 30, 31 ]

    # create: /sys/class/gpio/export   N
    # delete: /sys/class/gpio/unexport N
    #
    # pin_path:       /sys/class/gpio/gpioN/
    # direction_path: /sys/class/gpio/gpioN/direction
    # value_path:     /sys/class/gpio/gpioN/value
  end
end
