class Category < ActiveRecord::Base
  has_many :program
  belongs_to :user
end
