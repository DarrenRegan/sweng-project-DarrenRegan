class Gamegenre < ActiveRecord::Base
    def self.get_other_genres(difficulty)
        @difficulty = Gamegenre.where(difficulty:difficulty)
        if @difficulty.blank?
        return "No Genre with this difficulty"
        else
        return @difficulty
        end
    end

    def self.same_genre title
    Gamegenre.where(:title => title)
    end

    def self.search(search)
        if search
            gamegenre = Gamegenre.find_by(title: search)
            if gamegenre 
                self.where(id: gamegenre)
            else
                Gamegenre.all
            end
        else
            Gamegenre.all
        end
    end
end
