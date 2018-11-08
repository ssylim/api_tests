Feature:  API

  @post_get
  Scenario: api get
    Given I want to get the user
    When I send an api request
    Then the response code should be successful

  @post
  Scenario: Test API Post
    Given a user with first name firstname and last name lastname
    And I want to post the created user
    When I send an api request
    Then the user is added

  @post_put
  Scenario: Test user added post and get
    Given I want to update a user
    When I send an api request
    Then the user is updated

  @post_get_with_parameters
  Scenario: Get with parameters
    Given I want to get 3 pages with 4 users per page
    When I send an api request
    Then the response displays 3 pages with 4 users per page

  @delete
  Scenario: Delete user
    Given I want to delete a user
    When I send an api request
    Then the user is deleted

  @register_user
  Scenario Outline: Register user
    Given I want to register a user with email <email> and password <password>
    When I send an api request
    Then error message <error_message> is returned
    Examples:
      | email             | password  | error_message             |
      |                   | password1 | Missing email or username |
      | email@address.com |           | Missing password          |
