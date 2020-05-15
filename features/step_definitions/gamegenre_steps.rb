Given /the following gamegenres exist/ do |gamegenre_table|
  gamegenre_table.hashes.each do |gamegenre|
    Gamegenre.create gamegenre
  end
end

Then /(.*) seed gamegenres should exist/ do | n_seeds |
  Gamegenre.count.should be n_seeds.to_i
end 

Then("I should see {string} {string}") do |string, string2|
  expect(page).to have_content("Fighting")
  expect(page).to have_content("FPS")
end

When("I fill in {string} with {int}") do |string, int|
  fill_in 'Difficulty', with: 2
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Then("should see {string}") do |string|
  page.should have_link(link, :href => url)
end

Then("I i should see {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end


