class Article < ActiveRecord::Base
	belongs_to :dashborad
	has_many :comments,dependent: :destroy
	validates :title, presence: true,
					  length: { minimum: 5 }


	STATUS = {:draft => 0, :public => 1, :limited => 2 }

	def draft

		#self.status = STATUS[:reading]
	end
end
