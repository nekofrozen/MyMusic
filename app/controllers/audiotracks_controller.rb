class AudiotracksController < ApplicationController
  before_action :set_audiotrack, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    if params[:name]
      @audiotracks = Audiotrack.where('name LIKE ?', "%#{params[:name]}%")
    else
      @audiotracks = Audiotrack.all
    end
  end

  def show
  end

  def new
    @audiotrack = Audiotrack.new
  end

  def edit
  end

  def create
    @audiotrack = Audiotrack.new(audiotrack_params)

    respond_to do |format|
      if @audiotrack.save
        format.html { redirect_to @audiotrack, notice: 'Audio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @audiotrack.update(audiotrack_params)
        format.html { redirect_to @audiotrack, notice: 'Audiotrack was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @audiotrack.destroy
    respond_to do |format|
      format.html { redirect_to audiotracks_url, notice: 'Audiotrack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_audiotrack
      @audiotrack = Audiotrack.find(params[:id])
    end

  def audiotrack_params
      params.require(:audiotrack).permit(:name, :image, :music)
    end
end
