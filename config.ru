require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require_relative './controllers/devices_controller.rb'
require_relative './models/device.rb'

run DevicesController
