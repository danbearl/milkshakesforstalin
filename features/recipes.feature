Feature: Recipes
  Background:
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in

  Scenario: I create a new recipe
    Given I am on the home page
    When I follow "New Recipe"
    And I fill in the following:
      | recipe_name                          | sausage hash                             |
      | Description                          | a delicious hash of sausage and potatoes |
      | Quantity                             | 1                                        |
      | recipe_ingredients_attributes_0_name | sausage                                  |
      | Preparation                          | chopped                                  |
      | Instructions                         | cook until done                          |
    And I press "Create Recipe"
    Then I should see "Recipe successfully created."
    And I should see 1 recipe in the database
    And I should see 1 ingredient in the database

  Scenario: I can view an existing recipe
    Given the following recipe:
      | name         | sausage hash                             |
      | description  | a delicious hash of sausage and potatoes |
      | instructions | cook until done                          |
    And the following ingredients:
      | quantity | name    | preparation |
      | 1 lb     | sausage | chopped     |
      | 1 large  | potato  | shredded    |
    And those ingredients belong to that recipe
    And I am on the home page
    When I follow "Recipes"
    And I follow "sausage hash"
    Then I should see "1 lb sausage chopped"
    And I should see "1 large potato shredded"
    And I should see "a delicious hash of sausage and potatoes"
    And I should see "cook until done"

  Scenario: I edit an existing recipe
    Given the following recipe:
      | name         | sausage hash                             |
      | description  | a delicious hash of sausage and potatoes |
      | instructions | cook until done                          |
    And the following ingredient:
      | quantity    | 1       |
      | name        | sausage |
      | preparation | chopped |
    And that ingredient belongs to that recipe
    And I am on that recipe's page
    When I follow "Edit"
    And I fill in the following
      | Quantity     | 1 lb                             |
      | Instructions | fry in a medium pan until crispy |
    And I press "Update Recipe"
    Then I should see "Recipe successfully updated."
    And I should see "1 lb"
    And I should see "fry in a medium pan until crispy"
      

  Scenario: I delete an existing recipe
    Given the following recipe:
      | name         | sausage hash                             |
      | description  | a delicious hash of sausage and potatoes |
      | instructions | cook until done                          |
    And the following ingredients:
      | quantity | name    | preparation |
      | 1 lb     | sausage | chopped     |
      | 1 large  | potato  | shredded    |
    And those ingredients belong to that recipe
    And I am on that recipe's page
    When I follow "Delete"
    Then I should see "Recipe successfully deleted."
    And I should see 0 recipes in the database
    And I should see 0 ingredients in the database

