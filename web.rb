require 'sinatra'

get '/' do
  temp_file = Tempfile.new(['APNProfileGenerator','.mobileconfig'])
  temp_file.chmod(0644)

  temp_file.open
  temp_file.puts(params[:apnprofile])
  temp_file.close

  send_file(temp_file.path, filename: 'APNProfileGenerator.mobileconfig')

end
