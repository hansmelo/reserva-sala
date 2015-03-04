class CalendarPresenter < SimpleDelegator

  def row_table_calendar(week_day, day, hour, current_user)
    room = room_reservation(day, hour)
    if room.present?
      helpers.content_tag :td, room_reservation_label(room, current_user)
    else
      helpers.content_tag :td,
        helpers.link_to("Disponível", '#'), 
        class: "room_resevation wday-#{week_day} hour-#{hour}",
        data: { day: day, hour: hour }
    end
  end

  private
  def helpers
    ApplicationController.helpers
  end

  def room_reservation(day, hour)
    Room.includes(:user).where("day = ? AND hour = ?", day, hour).first
  end

  def room_reservation_label(room, current_user)
    if room.user == current_user
      helpers.link_to("Reservado por #{room.user.email}",
        "#",
        data: { id: room.id },
        class: "room_reservation_cancelable label label-success").html_safe
     else
      helpers.content_tag(:span,
        "Reservado por #{room.user.email}",
         class: "label label-warning").html_safe
     end
  end
end