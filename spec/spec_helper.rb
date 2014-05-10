require 'bundler/setup'
Bundler.setup

require 'vcr'
require 'pry-debugger'
require 'scrum_yo'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'

  config.before(:each) do
    Netrc.stub!(:read).and_return('api.github.com' => ['mscoutermarsh', 'test'])
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.default_cassette_options = { record: :once }
end
