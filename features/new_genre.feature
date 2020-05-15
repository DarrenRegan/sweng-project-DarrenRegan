# feature/new_genre.feature

Feature: Add a new genre to list

    As person interested in different games
    I want to add genres to list
    So that i can add more genres

Background: gamegenres correctly added to the database

    Given the following gamegenres exist:
    | title        | difficulty | description                                                    |
    | Fighting     | 10         | Focus on action on combat                                      |
    | Puzzle       | 5          | Requires player to solve a problem to advance                  |
    | FPS          | 5          | Use weapons to engage in action, from the characters viewpoint |
    | Roguelikes   | 8          | Difficult Dungeon Crawler with random level generations        |
    | Sandbox      | 1          | Open-world free form game                                      |
    | RTS          | 10         | Strategy game, collect resources and maintain an army          |
    | MMORPG       | 4          | Thousands of players in a world with a similar objective       |

    And I am on the Game Genres home page
    Then 7 seed gamegenres should exist

Scenario: User can navigate to new Gamegenre
    When I go to the homepage
    And I follow "New Gamegenre"
    Then I should see "New Gamegenre"

Scenario: User can add a Genre
    Given I am on the newgenres page
    And I fill in "Title" with "Battleroyal"
    And I fill in "difficulty" with 5
    Then I fill in "Description" with "arenagame"
    And I press "Create Gamegenre"
    Then I should see "Gamegenre was successfully created."