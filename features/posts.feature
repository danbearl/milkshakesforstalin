Feature: Post
  Background: User is signed in
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in

  Scenario: I create a new post
    Given I am on the home page
    When I follow "New Post"
    And I fill in the following:
      | Title | New post           |
      | Body  | This is a new post |
    And I press "Create Post"
    Then I should see "Post successfully created."
    And I should see "New post"
