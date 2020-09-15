module ApplicationHelper
  def flash_message_class(level)
    case level.to_s
      when 'notice'
        'is-success'
      when 'success'
        'is-success'
      when 'info'
        'is-info'
      when 'error'
        'is-danger'
      when 'alert'
        'is-danger'
      when 'danger'
        'is-danger'
    end
  end

  def notifications_count
    counter = 0
    dog_ids = current_user.dogs.map(&:id)

    counter = Favorite.where(dog_id: dog_ids).where(viewed: false).count if dog_ids.length > 0

    counter
  end
end
