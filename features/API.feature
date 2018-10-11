Feature:  API

  @api
  Scenario: api get
    Given I want to get the user
    When I send a GET request
    Then the response code should be successful