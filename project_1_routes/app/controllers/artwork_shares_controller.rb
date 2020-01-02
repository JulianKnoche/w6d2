class ArtworkSharesController < ApplicationController
  def create
    shares = ArtworkShare.new(artwork_share_params)

    if shares.save
      render json: shares 
    else 
      render json: shares.errors.full_messages, status: 422
    end
    
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy
    render json: artwork_share
  end

  private 

  def artwork_share_params
    params.require(:shares).permit(:viewer_id, :artwork_id)
  end
end