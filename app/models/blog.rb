class Blog < ApplicationRecord
  validates_presence_of :name, :user_id
end
