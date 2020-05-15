require 'rails_helper'
describe GamegenresController, type:'controller' do
#https://github.com/gmit-sweng-20/ca5-bdd-tdd-cycle2-DarrenRegan/blob/master/rottenpotatoes/spec/controllers/movies_controller_spec.rb

    describe 'GET index' do

        it 'should render the index template' do
        get :index
        expect(response).to render_template('index')
        end
    end
end #END

   #   describe '#navigation' do
#        context "loading new genre view" do
 #           it "should direct to adding a game genre" do
 #               get :new
#                expect(@response).to render_template("new")
#            end
 #       end
#    end

    #context "When no genre exists" do
      #it "should redirect to the home page" do
        #@results = "No Genres with this Difficulty"
       # allow(Gamegenre).to receive(:get_other_genres).and_return(@results)
      #  post :find_difficulty, {:difficulty => {:Difficulty =>'3'}}
     #   # Redirects to home page
    #    expect(assigns(:gamegenre)).to eq(@results)
   #     expect(@response).should redirect_to gamegenres_path
  #    end
 #   end
#end

# context "When specified genre has no title" do
#      it "should redirect to the home page" do
#
 #       @fake_genre = double({title: 'TPFPS', difficulty: 3 , description: ''})
#
 #       allow(Gamegenre).to receive(:find).and_return(@fake_genre)
 #       post :search_genres, {:id => 3}
 #       # Redirects to home page, shows error msg
  #      expect(flash[:notice]).to eq("'TPFPS' has no title info")
  #      expect(@response).should redirect_to gamegenres_path
  #    end
 #   end