require 'rails_helper'
#https://github.com/gmit-sweng-20/ca5-bdd-tdd-cycle2-DarrenRegan/blob/master/rottenpotatoes/spec/models/movie_spec.rb
describe Gamegenre do
  describe "#similar" do
    it "should find game genres with similar difficulty" do
        Gamegenre.create(title: "Puzzle", difficulty: 5, description: "Requires player to solve a problem to advance")
        Gamegenre.create(title: "FPS", difficulty: 5, description: "Use weapons to engage in action, from the characters viewpoint")
        results = Gamegenre.get_other_genres(5)
        expect(results[0].title).to eq('Puzzle')
        expect(results[1].title).to eq('FPS')
    end
    it "should not find games genres with different difficulty" do
        Gamegenre.create(title: "Fighting", difficulty: 2, description: "Focus on action on combat")
        Gamegenre.create(title: "Puzzle", difficulty: 5, description: "Requires player to solve a problem to advance")
        Gamegenre.create(title: "FPS", difficulty: 5, description: "Use weapons to engage in action, from the characters viewpoint")
        Gamegenre.create(title: "Roguelikes", difficulty: 8, description: "	Difficult Dungeon Crawler with random level generations")
        results = Gamegenre.get_other_genres(5)
        expect(results[0].title).not_to eq('Fighting')
        expect(results[1].title).not_to eq('Roguelikes')
        expect(results[0].title).not_to eq('Fighting')
        expect(results[1].title).not_to eq('Roguelikes')
    end
        it "should retrieve nothing if there is no other genres with this difficulty" do        
        results = Gamegenre.get_other_genres(3)
        expect(results).to eq('No Genre with this difficulty')
    end
  end
end