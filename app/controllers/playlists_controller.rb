class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = current_user.playlists.all
  end

  def show
    # @playlist = Playlist.find(params[:id])
    # @playlist = @playlist.playlist_song_ids
    # @playlistsong =  PlaylistSong.find(@playlist).audiotrack_id
    # @audiotrack = audiotrack.find(@playlistsong)

    @playlist = @playlist.playlist_songs


    # @playlist_song = @playlist.audiotrack_id
    # @audiotracks = Audiotrack.joins(:playlist_songs).
    #     where(playlist_songs: {playlist: @playlists.joins(:audiotrack) })

    # @playlists = Playlist.joins(:playlist_songs).includes(:audiotracks)

  end

  def new
    @playlist = current_user.playlists.new
  end

  def edit
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)
    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
    end
  end

  def add_audiotrack_to_playlist
    @playlist = current_user.playlists.find params[:id]
    @audiotrack = audiotracks.find params[:name]
  end
  def add
    @playlist = current_user.playlists.find params[:id]
    @audiotrack = @audiotracks.find params[:id]
  end
  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:name, :description, :image, :current_audio)
    end

    # def playlist_attributes
    #   params.require(:playlist).permit(:name, :description, :image)
    # end
end