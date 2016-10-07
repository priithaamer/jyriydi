# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")

require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  
  # Use `rake config' to see complete project settings.
  app.name = 'Jüri Üdi'
  
  app.identifier = 'com.priithaamer.jyriydi'
  
  app.icons = ['Icon-60.png', 'Icon-60@2x.png', 'Icon-76.png', 'Icon-76@2x.png']
  
  app.frameworks = ['CoreBluetooth', 'CoreLocation', 'SystemConfiguration']
  
  app.pods do
    pod 'EstimoteSDK'
  end
end
