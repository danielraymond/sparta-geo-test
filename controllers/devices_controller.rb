class DevicesController < Sinatra::Base

  # setting root of directory
  set :root, File.join(File.dirname(__FILE__), '..')

  # makes it so that if changes are made the server does not need to be restarted to apply them
  configure :development do
    register Sinatra::Reloader
  end

  get '/devices/:name' do

    # sets content type to be json
    content_type :json

    # taking the name of the device from the request
    device_name = params[:name]

    # creating an instance of the device model and calling a method
    @device_notes = Device.new
    @notes = @device_notes.get_notes_by_device_name(device_name)

    # setting the returned data from the model to be a value of a hash
    hash = {:notes => @notes}

    # converting the hash to json
    hash.to_json

  end

end
