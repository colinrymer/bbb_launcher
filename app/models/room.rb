class Room < ActiveRecord::Base
  attr_accessible :moderator_pw, :name, :recorded, :viewer_pw, :welcome
end
