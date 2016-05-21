module GPIO
	class Pin
		attr_reader :pin, :mode, :device, :hardware_pin, :software_pin, :file
		def initialize(params) #(pin, mode, device=:RaspberryPi)
			@device = GPIO.const_get(params[:device]||:RaspberryPi)
			#FIXME: changing the mapping writes warning msg about updating a constant
			@device.const_set :MAPPING, params[:mapping] if params[:mapping]

			@pin = params[:pin].to_i

			@hardware_pin, @software_pin = device.get_pin_mappings(pin)

			@mode = params[:mode].to_s
			raise "Mode should be :in, :out, :bi, :pwm." unless ['in','out'].include? @mode

			device.initialize_pin(software_pin, @mode)
			@mode ||= get_direction
			@file = @device.pin_file(software_pin, mode) rescue nil
		end

		def read
			file ? (file.rewind and file.getc == "1") : device.read(software_pin)
		end
		def state
			read
		end
	end
end
