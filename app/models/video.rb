class Video < ActiveRecord::Base
    belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
    validates :url, presence: true, length: { minimum: 5 }

	#scope ist wie eine Methode - by default returns all if false
    scope :search, ->(keyword){ where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }

    before_save :set_keywords

    protected
    def set_keywords
      self.keywords = [title, text].map(&:downcase).join(' ')
    end
end
