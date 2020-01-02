class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    all_artworks = user.shared_artworks + user.artworks
    # debugger
    # artworks = Artwork.find_by(artist_id: params[:artist_id])
    render json: all_artworks
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    # debugger
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    
    if artwork.update(artwork_params)
        render json: artwork
    else 
        render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    artwork.destroy 
    render json: artwork
  end
  
  private

  def artwork_params
    params.require(:art).permit(:title, :image_url, :artist_id)
  end

end