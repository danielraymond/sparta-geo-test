require 'nokogiri'

class Device

  attr_accessor :device_name

  # method to run when an instance of this class is created to parse xml
  def initialize
    @device_name = Nokogiri::XML(File.open('./mini-schema.xml'))
  end

  # method to get the names of the devices from the xml and put them in an array
  def get_device_names

    device_names = []

    @device_name.xpath('//device').each do |device|
      device_names << device.children[1].text
    end

    device_names

  end

  # method to get the notes for the devices from the xml and put them in an array
  def get_device_notes

    device_notes = []

    @device_name.xpath('//device').each do |device|
      device_notes << device.children[5].text
    end

    device_notes

  end

  # method to get the values for the devices from the xml and put them in an array
  def get_device_values

    device_values = []

    @device_name.xpath('//device').each do |device|
      device_values << device.children[3].text
    end

    device_values

  end

  # method to be called from controller to get notes for a device name provided in the request
  def get_notes_by_device_name(name)
    names = get_device_names
    notes = get_device_notes

    for i in 0..(names.length - 1)
      if names[i] == name
        return notes[i]
      end
    end

  end

  # method to be called from controller to get values for a device name provided in the request
  def get_value_by_device_name(name)
    names = get_device_names
    values = get_device_values

    for i in 0..(names.length - 1)
      if names[i] == name
        return values[i]
      end
    end

  end

  # method to get all the devices from the xml and put them in a 2D array
  def get_all_devices
    names = get_device_names
    values = get_device_values
    notes = get_device_notes
    devices = []

    for i in 0..(names.length - 1) do
      device = []
      device << names[i]
      device << values[i]
      device << notes[i]
      devices << device
    end

    devices

  end

  # method to create a hash from the devices array
  def create_hash_from_all_devices
    json = []
    devices = get_all_devices
    devices.each do |device|
      hash = {:name => device[0], :value => device[1], :notes => device[2]}
      json.push(hash)
    end
    json
  end

end
