require 'spec_helper'

describe DeviceAPI do

  before(:all) do
    @notes_data = DeviceAPI.new.notes_by_name_service
    @notes_data.get_notes_data('ct')
  end

  it "should return a hash" do
    expect(@notes_data.get_data).to be_kind_of(Hash)
  end

  it "should have a notes key that has a value that is a string" do
    expect(@notes_data.get_notes).to be_kind_of(String)
  end

end
