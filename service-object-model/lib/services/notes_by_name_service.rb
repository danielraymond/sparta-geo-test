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

  def get_notes
    @notes['notes']
  end

end
