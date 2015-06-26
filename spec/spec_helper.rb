$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dolla'

require 'webmock/rspec'

WebMock.disable_net_connect!(:allow => "codeclimate.com")