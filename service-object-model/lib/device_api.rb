require_relative 'services/notes_by_name_service'

class DeviceAPI

  def notes_by_name_service
    NotesByNameService.new
  end

end
