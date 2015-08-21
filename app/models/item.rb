class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  validates_presence_of :name, :price, :category, :description, :user_id

end
