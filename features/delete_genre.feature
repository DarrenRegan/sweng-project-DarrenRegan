# feature/delete_genre.feature

Feature: Delete a genre from list

    As person interested in different games
    I want to be able to delete a genre from the list
    So i can control how many items are on the list

Background: gamegenres correctly added to the database

    Given the following gamegenres exist:
    | title        | difficulty | description                                                    |
    | Fighting     | 10         | Focus on action on combat                                      |

    And I am on the Game Genres home page
    Then 1 seed gamegenres should exist

Scenario: User can delete a genre
    When I go to the homepage
    And I follow "Destroy"
    Then I should see "Gamegenre was successfully destroyed."

