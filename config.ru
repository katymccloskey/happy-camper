# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
config.assets.compile = true
config.assets.precompile =  ['*.js', '*.css', '*.css.erb']

run Rails.application
