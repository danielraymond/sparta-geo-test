require_relative 'services/notes_by_name_service'
require_relative 'services/all_devices_service'

class DeviceAPI

  def notes_by_name_service
    NotesByNameService.new
  end

  def get_all_devices
    AllDevicesService.new
  end

end
