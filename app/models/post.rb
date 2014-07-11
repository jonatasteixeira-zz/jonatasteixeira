class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments


  validates :title, :presence => true, :length => { :in => 5..30 }
  validates :body, :presence => true, :length => { :in => 20..5000 }
  validates :user_id, :presence => true


  
end
