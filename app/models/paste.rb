class Paste < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  enum language: [:plaintext, :python, :ruby, :haml, :perl, :php, :scala, :groovy,
    :go, :gradle, :html, :lasso, :css, :scss, :less, :stylus, :markdown, :asciidoc,
    :django, :twig]

  scope :unexpired, -> { where('expires_at IS NULL OR expires_at > ?', Time.now) }

  validates :language, inclusion: { in: Paste.languages.keys }
  validates :user_id, presence: true
  validates :name, length: { maximum: 128 }
  validates :body, presence: true, length: { in: 3..512 }
  validate :expires_at_is_in_the_future, unless: "expires_at.nil?"

  def user_email
    self.user.email
  end

  private

  def expires_at_is_in_the_future
    if expires_at < Date.today
      errors.add(:expires_at, "Expire date must be in the future.")
    end
  end
end
