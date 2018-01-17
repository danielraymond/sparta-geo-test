require 'spec_helper'

describe AllDevicesService do

  before(:all) do
    @devices_data = DeviceAPI.new.get_all_devices
    @devices_data.get_devices
  end

  it "should return an array" do
    expect(@devices_data.get_devices_data).to be_kind_of(Array)
  end

  it "should return an array of hashes" do
    @devices_data.get_devices_data.each do |device|
      expect(device).to be_kind_of(Hash)
    end
  end

  it "should return an array with 31 elements" do
    expect(@devices_data.get_devices_data.length).to eq(31)
  end

  it "should have hashes that each have 3 elements" do
    @devices_data.get_devices_data.each do |device|
      expect(device.length).to eq(3)
    end
  end

  it "should have names in the hashes that are strings" do
    @devices_data.get_all_names.each do |name|
      expect(name).to be_kind_of(String)
    end
  end

  it "should have values in the hashes that are strings" do
    @devices_data.get_all_values.each do |name|
      expect(name).to be_kind_of(String)
    end
  end

  it "should have notes in the hashes that are strings" do
    @devices_data.get_all_notes.each do |name|
      expect(name).to be_kind_of(String)
    end
  end

  it "should have a name in the first hash in the array equal to hub_ethernet_cosy" do
    expect(@devices_data.get_all_names.first).to eq('hub_ethernet_cosy')
  end

  it "should have a value in the first hash in the array equal to 0" do
    expect(@devices_data.get_all_values.first).to eq('0')
  end

  it "should have notes in the first hash in the array equal to Cosy hub, Ethernet microcontroller" do
    expect(@devices_data.get_all_notes.first).to eq('Cosy hub, Ethernet microcontroller')
  end

  it "should have a name in the last hash in the array equal to invalid" do
    expect(@devices_data.get_all_names.last).to eq('invalid')
  end

  it "should have a value in the last hash in the array equal to 255" do
    expect(@devices_data.get_all_values.last).to eq('255')
  end

  it "should have notes in the last hash in the array equal to Don't assign this to a device!" do
    expect(@devices_data.get_all_notes.last).to eq('Don\'t assign this to a device!')
  end

end
