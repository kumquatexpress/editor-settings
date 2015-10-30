#!/usr/bin/ruby
require 'rbconfig'
require 'shellwords'

subl_config_dir = case RbConfig::CONFIG['host_os']
  when /mswin|windows/i
      "#{ENV['APPDATA']}\\Sublime\ Text\ 3/Packages/User"
  when /darwin/i
      "#{ENV['HOME']}/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"
  else
      "#{ENV['HOME']}/.config/sublime-text-3/Packages/User"
  end

current_dir = %x[pwd].strip

Dir["*.sublime*"].each do |filename|
  %x[ln -sf #{File.join(current_dir, filename).shellescape} #{subl_config_dir.shellescape}/#{File.basename(filename).shellescape}]
end
