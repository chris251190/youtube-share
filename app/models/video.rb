class Video < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
    validates :url, presence: true, length: { minimum: 5 }
end
