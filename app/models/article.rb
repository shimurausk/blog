class Article < ActiveRecord::Base
	belongs_to :dashborad
	has_many :comments,dependent: :destroy
	has_many :taggings
  has_many :tags,through: :taggings
  has_many :article_categories
  has_many :categories,through: :article_categories
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :category,presence: true
  #mount_uploader :avatar, ImageUploader
  STATUS = {:draft => 0, :public => 1, :limited => 2 }

  paginates_per 5
  
  def self.tagged_with(name)
  	Tag.find_by_name!(name).articles
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end 

  def tag_list
  	tags.map(&:name).join(", ")
  end

  def tag_list=(names)
  	self.tags = names.split(",").map do |n|
  		Tag.where(name: n.strip).first_or_create!
  	end	
  end

	def draft

		#self.status = STATUS[:reading]
	end
end
