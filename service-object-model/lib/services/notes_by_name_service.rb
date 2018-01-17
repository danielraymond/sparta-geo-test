require 'httparty'
require 'json'

class NotesByNameService
  include HTTParty

  base_uri 'http://localhost:9292'

  def get_notes_data(name)
    @notes = JSON.parse(self.class.get("/devices/#{name}").body)
  end

  def get_data
    @notes
  end

  def get_device
    @notes['device']
  end

  def get_notes
    get_device['notes']
  end

  def get_value
    get_device['value']
  end

  def get_name
    get_device['name']
  end

end
