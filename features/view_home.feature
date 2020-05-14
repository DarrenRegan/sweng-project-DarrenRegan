# feature/view_home.feature

Feature: Display list of genres with a Difficulty and Description

    As person interested in different games
    I want to see a list of game genres
    So i can try out new game genres

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

Scenario: User sees game genres
    When I go to the homepage
    Then I should see "Fighting" "FPS"