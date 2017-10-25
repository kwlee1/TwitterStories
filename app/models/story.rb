class Story < ActiveRecord::Base
  belongs_to :user
  has_many :entries 
  validates :title, presence: true 
  validates :content, presence: true, length: { in: 8..140 }
end
