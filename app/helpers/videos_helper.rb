module VideosHelper

	def youtube_embed(youtube_url)
		if youtube_url[/youtu\.be\/([^\?]*)/]
			youtube_id = $1
		else    	
    		youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
    		youtube_id = $5
		end	

	%Q{<iframe class="iframe-resize" title="YouTube video player" width="100%" height="390px" src="https://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
	end


	def get_random_video_from_public
		Video.all.where(public: true).order("Random()").first(5)		
	end

end
