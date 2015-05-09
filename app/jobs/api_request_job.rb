class ApiRequestJob < ActiveJob::Base
  queue_as :default

  def perform(user_id, paste_body)
    Paste.create!(user_id: user_id, body: paste_body)
  end
end
