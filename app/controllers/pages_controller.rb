class PagesController < ApplicationController
  after_action :set_status
  before_action :recent_messages, only: [:home]
  def home
    recent_messages
  end

  private
  def set_status
    current_user&.update!(status: User.statuses[:offline])
  end

  def recent_messages
    public_rooms = Room.public_rooms

    @messages = Message.where(room: public_rooms).order(created_at: :desc).limit(15)
  end
end
