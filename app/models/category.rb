class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :programs
  belongs_to :user
end
