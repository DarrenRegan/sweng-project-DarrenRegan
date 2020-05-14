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