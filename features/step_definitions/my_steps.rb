Given(/^I want to get the user$/) do
  @request = 'get'
end

When(/^I send a (.*) request$/) do |request_type|
  case request_type.downcase
    when 'get'
      send_get(TestConfig['host'], '/api/users')
  end
end

Then(/^the response code should be successful$/) do
  expect(@response.code).to eq '200'
  expect(@response.message).to eq 'OK'
end