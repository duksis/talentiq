require 'talentiq/version'
require 'uri'
require 'net/http'
require 'json'

class TalentIQ

  # documentation under:
  ## http://docs.talentiq.co
  #
  ## https://api.talentiq.co/v3/person?api_key=YOUR-API-KEY&name=larry+page&email=larry.page%40google.com&required=emails.address

  API_BASE = 'https://api.talentiq.co/v3'.freeze

  def initialize(api_key: )
    @api_key = api_key
  end

  def call(params)
    uri = URI.parse(url_for(params))

    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  private

  attr_reader :api_key

  def default_params
    { api_key: api_key }
  end

  def person_path
    "#{API_BASE}/person"
  end

  def url_for(params)
    [
      person_path,
      URI.encode_www_form(default_params.merge(params))
    ].join('?')
  end
end
