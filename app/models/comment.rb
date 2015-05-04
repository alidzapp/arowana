class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :paste

  validates :user_id, :paste_id, presence: true
  validates :body, presence: true, length: { in: 3..512 }

  def user_email
    self.user.email
  end
end
