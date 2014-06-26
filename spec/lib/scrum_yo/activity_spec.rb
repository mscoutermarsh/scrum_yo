require 'spec_helper'

describe ScrumYo::Activity do
  subject { ScrumYo::Activity.new }

  it 'retrieves users github activity' do
    VCR.use_cassette('activity') do
      expect(subject.github_activity.length).to eq 22
    end
  end
end
