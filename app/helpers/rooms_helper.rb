module RoomsHelper
  def search_rooms
    if params[:name_search].present? && params[:name_search].length.positive?
      Room.public_rooms.where
          .not(id: current_user.joined_rooms.pluck(:id))
          .where('name LIKE ?', "%#{params[:name_search]}%")
          .order(name: :asc)
    else
      []
    end
  end

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

  def markdown(text)
    options = {
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      quote: true
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    sanitize(markdown.render(text))
  end
end
