class Entry < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  validates :content, presence: true, length: { in: 8..140 }
  validates :user, :story, presence: true 
end
