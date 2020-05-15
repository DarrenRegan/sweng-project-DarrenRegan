class Gamegenre < ActiveRecord::Base
    def self.get_other_genres(difficulty)
        @difficulty = Gamegenre.where(difficulty:difficulty)
        if @difficulty.blank?
        return "No Genre with this difficulty"
        else
        return @difficulty
        end
    end
end
