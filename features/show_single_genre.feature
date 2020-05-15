# feature/show_single_genre.feature

Feature: Display a specific genre listed

    As person interested in different games
    I want click on a specific genre
    So that i can read the description easier

Background: gamegenres correctly added to the database

    Given the following gamegenres exist:
    | title        | difficulty | description                                                    |
    | Fighting     | 10         | Focus on action on combat                                      |

    And I am on the Game Genres home page
    Then 1 seed gamegenres should exist

Scenario: User can navigate to show a genre
    When I go to the homepage
    And I follow "Show"
    Then I should see "Show Game Genre"
