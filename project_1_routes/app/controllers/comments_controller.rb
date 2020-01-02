class CommentsController < ApplicationController
    def index
      # debugger
      if params[:author_id]
          render json: Comment.where(author_id: params[:author_id])
      elsif params[:artwork_id]
          render json: Comment.where(artwork_id: params[:artwork_id])
      else
        render json: Comment.all
      end
    end

    def create
      comment = Comment.new(comment_params)

      if comment.save
        render json: comment 
      else
        render json: comment.errors.full_messages, status: 422
      end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    private 
    
    def comment_params
      params.require(:comment).permit(:author_id, :artwork_id, :body)
    end

end