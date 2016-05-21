Gem::Specification.new do |s|
  s.name        = 'gpio'
  s.version     = '0.0.8'
  s.date        = '2016-05-20'
  s.homepage    = 'https://github.com/rkam/gpio'
  s.summary     = "a ruby gem and repository to contribute gpio code for devices such as Raspberry Pi to read sensors and control outputs."
  s.description = "gpio allows for devices such as raspberry pi or systems with 1wire usb adapters to speak to the system's input/output pins."
  s.authors     = ['Christopher Klapp', 'Sven Kraeuter', 'Ric Kamicar']
  s.email       = 'rkamicar@gmail.com'
  s.files       = Dir.glob("{lib}/**/*") + %w(README.md changelog)
end
