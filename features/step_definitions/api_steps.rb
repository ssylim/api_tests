Given(/^I want to get the user$/) do
  @request = 'get'
end

When /^I send an api request$/ do
  case @request.downcase
    when 'get'
      @response = send_get(TestConfig['host'], '/api/users')
    when 'post'
      @response = send_post(TestConfig['host'], '/api/users', @body)
    when 'put'
      @response = send_put(TestConfig['host'], '/api/users/1', @body)
    when 'get_with_parameters'
      @response = send_get_with_parameters(TestConfig['host'], '/api/user', @parameters)
    when 'delete'
      @response = send_delete(TestConfig['host'], '/api/users/2')
    when 'register'
      @response = send_post(TestConfig['host'], '/api/register', @body)
  end
end

Then(/^the response code should be successful$/) do
  expect(@response.code).to eq '200'
  expect(@response.message).to eq 'OK'
end

Given(/^a user with first name (.*) and last name (.*)/) do |first_name, last_name|
  @user = User.new
  @user.first_name = first_name
  @user.last_name = last_name
end

And(/^I want to post the created user$/) do
  @request = 'post'
  @body = @user.to_json
end


Then(/^the user is added$/) do
  expect(@response.code).to eq('201')
end

Given /^I want to update a user$/ do
  @request = 'put'
  @user = User.new if @user.nil?
  @user.first_name = 'Lambo'
  @user.last_name = 'Bovino'
  @body = @user.to_json
end

Then /^the user is updated$/ do
  expect(@response.code).to eq('200')
  response = JSON.parse(@response.body)
end

And /^I want to get (.*) pages with (.*) users per page$/ do |page, per_page|
  @request = 'get_with_parameters'
  @parameters = 'page='+page+'&per_page='+per_page
end

Then /^the response displays (.*) pages with (.*) users per page$/ do |pages, per_page|
  response = JSON.parse(@response.body)
  expect(response['page'].to_i).to eq(pages.to_i)
  expect(response['per_page'].to_i).to eq(per_page.to_i)
end

Given /^I want to delete a user$/ do
  @request = 'delete'
end

Then /^the user is deleted$/ do
  expect(@response.code).to eq('204')
  expect(@response.message).to eq('No Content')
end

Given /^I want to register a user with email (.*) and password (.*)$/ do |email, password|
  @request = 'register'
  @register_user = UserCredentials.new
  @register_user.email = email
  @register_user.password = password
  @body = JSON.generate(@register_user)
end

Then /^error message (.*) is returned$/ do |response|
  body = JSON.parse(@response.body)
  expect(body['error']).to eq response
end