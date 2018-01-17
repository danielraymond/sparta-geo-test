require 'httparty'
require 'json'

class AllDevicesService
  include HTTParty

  attr_accessor :devices

  base_uri 'http://localhost:9292'

  def get_devices
    @devices = JSON.parse(self.class.get("/devices").body)
  end

  def get_devices_data
    @devices
  end

  def get_all_names
    names = []
    @devices.each do |device|
      names << device['name']
    end
    names
  end

  def get_all_values
    values = []
    @devices.each do |device|
      values << device['value']
    end
    values
  end

  def get_all_notes
    notes = []
    @devices.each do |device|
      notes << device['notes']
    end
    notes
  end

end
