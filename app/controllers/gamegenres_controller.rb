class GamegenresController < ApplicationController
  before_action :set_gamegenre, only: [:show, :edit, :update, :destroy]

  # GET /gamegenres
  # GET /gamegenres.json
  def index
    @gamegenres = Gamegenre.all
  end

  # GET /gamegenres/1
  # GET /gamegenres/1.json
  def show
  end

  # GET /gamegenres/new
  def new
    @gamegenre = Gamegenre.new
  end

  # GET /gamegenres/1/edit
  def edit
  end

  # POST /gamegenres
  # POST /gamegenres.json
  def create
    @gamegenre = Gamegenre.new(gamegenre_params)

    respond_to do |format|
      if @gamegenre.save
        format.html { redirect_to @gamegenre, notice: 'Gamegenre was successfully created.' }
        format.json { render :show, status: :created, location: @gamegenre }
      else
        format.html { render :new }
        format.json { render json: @gamegenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamegenres/1
  # PATCH/PUT /gamegenres/1.json
  def update
    respond_to do |format|
      if @gamegenre.update(gamegenre_params)
        format.html { redirect_to @gamegenre, notice: 'Gamegenre was successfully updated.' }
        format.json { render :show, status: :ok, location: @gamegenre }
      else
        format.html { render :edit }
        format.json { render json: @gamegenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamegenres/1
  # DELETE /gamegenres/1.json
  def destroy
    @gamegenre.destroy
    respond_to do |format|
      format.html { redirect_to gamegenres_url, notice: 'Gamegenre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamegenre
      @gamegenre = Gamegenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gamegenre_params
      params.require(:gamegenre).permit(:title, :difficulty, :description)
    end
end
