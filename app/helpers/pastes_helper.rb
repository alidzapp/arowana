module PastesHelper
  def paste_expires_in(paste)
    current_datetime = Proc.new { Time.now }.call

    distance_of_time_in_words(current_datetime, paste.expires_at)
  end
end
