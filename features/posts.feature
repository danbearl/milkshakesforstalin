Feature: Post
  Background: User is signed in
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in

  Scenario: I see multiple posts on the posts index page
    Given the following posts:
      | title       | body             |
      | First Post  | First Post Body  |
      | Second Post | Second Post Body |
    And I am on the posts index page
    Then I should see "First Post"
    And I should see "Second Post"

  Scenario: I can view a full post from the posts index
    Given the following post:
      | title | Something              |
      | body  | Some text for the body |
    And I am on the posts index page
    When I follow "Something"
    Then I should see "Some text for the body"

  Scenario: I create a new post
    Given I am on the home page
    When I follow "New Post"
    And I fill in the following:
      | Title | New post           |
      | Body  | This is a new post |
    And I press "Create Post"
    Then I should see "Post successfully created."
    And I should see "New post"
    And I should see 1 post in the database

  Scenario: I update an existing post
    Given the following post:
      | title | Something              |
      | body  | Some text for the body |
    And I am on that post's page
    When I follow "Edit"
    And I fill in the following:
      | Body | Some new text |
    And I press "Update Post"
    Then I should see "Post successfully updated."
    And I should see "Some new text"

  Scenario: I delete a post
    Given the following post:
      | title | Something              |
      | body  | Some text for the body |
    And I am on that post's page
    When I follow "Delete"
    Then I should see "Post successfully deleted."
    And I should not see "Something"
    And I should see 0 posts in the database
