require 'webmock/rspec'
require 'simplecov'

WebMock.disable_net_connect!(allow_localhost: true)
#WebMock.allow_net_connect!(allow_localhost: true)
SimpleCov.start 'rails'

def user
  @user ||= create(:user)
end
