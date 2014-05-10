require 'spec_helper'

describe ScrumYo::Activity do
  it 'does stuff' do
    VCR.use_cassette('activity') do
      ScrumYo::Activity.new
    end
  end
end
