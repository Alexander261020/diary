class LinkClickedJob < ApplicationJob
  queue_as :default

  def perform(chapter)
    chapter.count_clicks += 1
    chapter.save
  end
end
