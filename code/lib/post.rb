class Post < ActiveRecord::Base

  belongs_to :user
  # Is the same as:
  # def user
  #   User.find_by(id: user_id)
  # end

  has_many :comments, dependent: :destroy

end
