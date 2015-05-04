class Paste < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  enum language: [:plaintext, :python, :ruby, :haml, :perl, :php, :scala, :groovy,
    :go, :gradle, :html, :lasso, :css, :scss, :less, :stylus, :markdown, :asciidoc,
    :django, :twig]

  scope :unexpired, -> { where('expires_at IS NULL OR expires_at > ?', Time.now) }
end
