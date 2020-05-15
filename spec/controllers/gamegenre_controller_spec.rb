require 'rails_helper'

describe GamegenresController, type:'controller' do
#https://github.com/gmit-sweng-20/ca5-bdd-tdd-cycle2-DarrenRegan/blob/master/rottenpotatoes/spec/controllers/movies_controller_spec.rb
#https://relishapp.com/rspec/rspec-rails/v/2-1/docs/controller-specs/render-views
    describe 'GET index' do

        it 'should render the index template' do
        get :index
        expect(response).to render_template('index')
        end
    end
#(:gamegenre).permit(:title, :difficulty, :description)
    describe 'POST Create Genre' do
        it 'creates a new genre' do
        expect {post :create, gamegenre: { title: "Tester", :difficulty => 4, :description => "Testing Stuff"}
        }.to change { Gamegenre.count }.by(1)
        end
    end

# GET /gamegenres/1
    describe 'GET show' do
    it 'should find the genre' do
        @gamegenre = Gamegenre.create(:id => 1, :title => "Fighting", difficulty: 2, description: "Focus on action on combat")
        get :show, {:id =>  @gamegenre.id}
        expect(Gamegenre.find("1")).to eq(@gamegenre)
        end
    end

  # DELETE /gamegenres/1
  # DELETE /gamegenres/1.json
    describe 'DELETE Destroy' do

        it 'deletes a genre' do
            @gamegenre = Gamegenre.create(title: "Fighting", difficulty: 2, description: "Focus on action on combat")

            expect { delete :destroy, id: 1}.to change(Gamegenre, :count).by(-1)
        end

        it 'should redirect to the genre page after deleting' do
            @gamegenre = Gamegenre.create(title: "Fighting", difficulty: 2, description: "Focus on action on combat")

            delete :destroy, id: 1
            expect(response).to redirect_to("/gamegenres")
        end
     end

  # PATCH/PUT /gamegenres/1
  # PATCH/PUT /gamegenres/1.json
    describe 'PUT update' do
        it 'updates an existing genre' do
            @gamegenre = Gamegenre.create(title: "Fighting", difficulty: 2, description: "Focus on action on combat")

            allow(Gamegenre).to receive(:find).with('1').and_return(@gamegenre)
            allow(Gamegenre).to receive(:update_attributes).with(:gamegenre)

            get :update, {:id => '1', :gamegenre => {:name =>"Fighting"}}
            expect(@gamegenre.title).to eql('Fighting')

            expect(response).to redirect_to gamegenre_path(@gamegenre)
        end
    end

  # GET /gamegenres/1/edit
    describe 'GET edit' do
        it 'should find the genre' do
            @gamegenre = Gamegenre.create(title: "Fighting", difficulty: 2, description: "Focus on action on combat")
            allow(Gamegenre).to receive(:find).with('1').and_return(@gamegenre)
            get :edit, {:id => @gamegenre.id}

        end
        it 'should render the edit template' do
            @gamegenre = Gamegenre.create(:id => 1, :title => "Fighting", difficulty: 2, description: "Focus on action on combat")
            allow(Gamegenre).to receive(:find).with('1').and_return(@gamegenre)
            get :edit, {:id => @gamegenre.id}
            expect(response).to render_template('edit')
        end
    end

    describe '#navigation' do
        context "loading new genre view" do
            it "should direct to adding a game genre" do
                get :new
                expect(@response).to render_template("new")
            end
        end
    end

    describe '#search' do
        context "When specified genre has no info" do
            it "should redirect to the genre page" do
                @gamegenre = double("Genre", :id => 1, :title => "", difficulty: 2, description: "Focus on action on combat")
            
                allow(Gamegenre).to receive(:same_genre).and_return(@gamegenre)

                allow(Gamegenre).to receive(:find).and_return(@gamegenre)
                get :search_genres, {:id => 1}
        
                expect(response).to redirect_to ("/gamegenres")
            end
        end
    end
#@gamegenre = double("Genre", :id => 1, :title => "Fighting", :difficulty => 2, :description => "Focus on action on combat")
     describe "search for genre" do
        context "When genre is entered in" do
            it "should find genre with the same title" do
                @gamegenre = double("Genre", :id => 1, :title => "Fighting", :difficulty => 2, :description => "Focus on action on combat")
                allow(Gamegenre).to receive(:same_genre).and_return(@gamegenre)

                allow(Gamegenre).to receive(:find).and_return(@gamegenre)
                get :search, {:search => "FPS"}

                expect(response).to render_template('search')
            end
        end
        context "When genre is not entered" do
            it "should redirect back to genre page" do
                @gamegenre = double("Genre", :id => 1, :title => "Fighting", :difficulty => 2, :description => "Focus on action on combat")
                allow(Gamegenre).to receive(:same_genre).and_return(@gamegenre)

                allow(Gamegenre).to receive(:find).and_return(@gamegenre)
                get :search, {:title => ''}

                expect(response).to redirect_to ("/gamegenres")
            end
        end
    end 
    

end #END
