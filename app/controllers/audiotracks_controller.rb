class AudiotracksController < ApplicationController
  before_action :set_audiotrack, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  # GET /audiotracks
  # GET /audiotracks.json
  def index
    if params[:name]
      @audiotracks = Audiotrack.where('name LIKE ?', "%#{params[:name]}%")
    else
      @audiotracks = Audiotrack.all
    end
  end

  # GET /audiotracks/1
  # GET /audiotracks/1.json
  def show
  end

  # GET /audiotracks/new
  def new
    @audiotrack = Audiotrack.new
  end

  # GET /audiotracks/1/edit
  def edit
  end

  # POST /audiotracks
  # POST /audiotracks.json
  def create
    @audiotrack = Audiotrack.new(audiotrack_params)

    respond_to do |format|
      if @audiotrack.save
        format.html { redirect_to @audiotrack, notice: 'Audio was successfully created.' }
        format.json { render :show, status: :created, location: @audiotrack }
      else
        format.html { render :new }
        format.json { render json: @audiotrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audiotracks/1
  # PATCH/PUT /audiotracks/1.json
  def update
    respond_to do |format|
      if @audiotrack.update(audiotrack_params)
        format.html { redirect_to @audiotrack, notice: 'Audiotrack was successfully updated.' }
        format.json { render :show, status: :ok, location: @audiotrack }
      else
        format.html { render :edit }
        format.json { render json: @audiotrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audiotracks/1
  # DELETE /audiotracks/1.json
  def destroy
    @audiotrack.destroy
    respond_to do |format|
      format.html { redirect_to audiotracks_url, notice: 'Audiotrack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audiotrack
      @audiotrack = Audiotrack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def audiotrack_params
      params.require(:audiotrack).permit(:name, :image, :music)
    end
end
