require 'rails_helper'

describe CalendarPresenter do
	let(:presenter) { "presenter" }

	describe "row_table_calendar without room" do
		allow(presenter).to receiver(room_reservation).and_return(false)
		expected = "qualquer coisa"

		expected(presenter.row_table_calendar("wday", "day", "user")).to expected
	end
end