class VideosController < ApplicationController

	def index
		@videos = Video.search(params[:keyword]).order('created_at DESC').where(public: true)
	end

	def show
		if(Video.find(params[:id]).public || (user_signed_in? && current_user.id == Video.find(params[:id]).user_id)) 
			@video = Video.find(params[:id]) 
		else
			redirect_to root_path
		end
	end

	def new		
		@video = Video.new
	end

	def edit
		if(current_user.id == Video.find(params[:id]).user_id) 
			@video = Video.find(params[:id]) 
		else
			redirect_to root_path
		end
	end	

	def create
		@user = User.find(current_user)
		@video = @user.videos.create(video_params)
		if @video.save
			redirect_to @video
		else
			render 'new'
		end
	end	

	def update
		@video = Video.find(params[:id])
		if @video.update(video_params)
			redirect_to @video
		else
			render 'edit'
		end
	end

	def destroy
		@video = Video.find(params[:id])
		@video.destroy

		redirect_to videos_path
	end

	def my_videos
		@user = User.find(current_user)
		@videos = @user.videos.order('created_at DESC')		
		render 'my_videos'
	end

	private
	def video_params
		params.require(:video).permit(:title, :url, :text, :public)
	end
end
