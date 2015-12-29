class VideosController < ApplicationController

 http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		@videos = Video.all.order('created_at DESC')
	end

	def show
		@video = Video.find(params[:id])
	end

	def new		
		@video = Video.new
	end

	def edit
		@video = Video.find(params[:id])
	end	

	def create
		@video = Video.new(video_params)
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

	private
	def video_params
		params.require(:video).permit(:title, :url, :text)
	end
end
