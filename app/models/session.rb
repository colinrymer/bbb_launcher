class Session < ActiveRecord::Base
  attr_accessible :moderators, :name, :recorded, :start_time, :viewers
end
