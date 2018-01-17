require 'spec_helper'

describe NotesByNameService do

  before(:all) do
    @notes_data = DeviceAPI.new.notes_by_name_service
    @notes_data.get_notes_data('ct')
  end

  it "should return a hash" do
    expect(@notes_data.get_data).to be_kind_of(Hash)
  end

  it "should have a name key that has a value that is a string" do
    expect(@notes_data.get_name).to be_kind_of(String)
  end

  it "should have a name key that has a value that is the correct name" do
    expect(@notes_data.get_name).to eq('ct')
  end

  it "should have a values key that has a value that is a string" do
    expect(@notes_data.get_value).to be_kind_of(String)
  end

  it "should have a values key that has a value equal to the correct value" do
    expect(@notes_data.get_value).to eq('6')
  end

  it "should have a notes key that has a value that is a string" do
    expect(@notes_data.get_notes).to be_kind_of(String)
  end

  it "should return the correct notes information for the given name" do
    expect(@notes_data.get_notes).to eq('Legacy Legato CT transmitter')
  end

end
