class Program < ActiveRecord::Base
  belongs_to :user
  has_one :category
end
