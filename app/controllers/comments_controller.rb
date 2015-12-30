class CommentsController < ApplicationController
	
	def create
		@video = Video.find(params[:video_id])
		@comment = @video.comments.create(comment_params)
		redirect_to video_path(@video)
	end

	def destroy
		@video = Video.find(params[:video_id])
		@comment = @video.comments.find(params[:id])
		@comment.destroy
		redirect_to video_path(@video)
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end

end
