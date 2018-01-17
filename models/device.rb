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

end
