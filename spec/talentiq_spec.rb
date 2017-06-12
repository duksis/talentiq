require 'spec_helper'

RSpec.describe TalentIQ do
  it 'has a version number' do
    expect(TalentIQ::VERSION).not_to be nil
  end

  subject(:client) { TalentIQ.new(api_key: "APIKEY")}

  it 'does find the test exapmple from documentation' do
    VCR.use_cassette('larry') do
      response = client.call(
        name: 'Larry Page',
        email: 'larry.page@gmail.com',
        location: 'San Francisco Bay Area',
        company: 'Google',
        school: 'Stanford University',
        profile: 'https://www.linkedin.com/in/tlytle'
      )
      expect(response['message']).to eq('Success')
    end
  end
end
