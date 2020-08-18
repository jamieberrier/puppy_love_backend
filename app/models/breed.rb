class Breed < ApplicationRecord
  has_many :posts, dependent: :destroy

  PETFINDER_API_KEY = ENV['petfinder_api_key']
  PETFINDER_API_SECRET = ENV['petfinder_api_secret']

  def self.request_token
    url = URI('https://api.petfinder.com/v2/oauth2/token')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['content-type'] = 'application/x-www-form-urlencoded'
    request.body = "grant_type=client_credentials&client_id=#{PETFINDER_API_KEY}&client_secret=#{PETFINDER_API_SECRET}"

    response = http.request(request)
    j_resp = JSON.parse response.read_body

    { token_type: j_resp['token_type'], token: j_resp['access_token'], expires: j_resp['expires_in'] }
  end
end
