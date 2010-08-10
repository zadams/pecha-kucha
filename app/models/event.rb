class Event < ActiveRecord::Base
  has_many :presentations
  
  def formatted_date
    date.strftime("%A %m/%d/%Y %I:%M%p")
  end
end