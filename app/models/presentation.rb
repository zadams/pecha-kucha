class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_attached_file :slide_deck
  has_attached_file :video
end
