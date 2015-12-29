class Video < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
    validates :url, presence: true, length: { minimum: 5 }
end
