require 'rails_helper'

describe 'Room Reservation' do

	scenario "user can make a reserve", js: true do
	  user = create(:user)
      signin(user.email, user.password)
      expect(page).to have_content("Reserva")
      find(".wday-Segunda.hour-9").click_link("Disponível")

      expect(page).to have_content("Reservado por #{user.email}")
	end

	scenario "user a can remove a reserve", js: true do 
	  user = create(:user)
	  room = create(:room, user: user)
	  signin(user.email, user.password)
	  expect(page).to have_content("Reservado por #{user.email}")
	  click_link "Reservado por #{user.email}"
      page.driver.browser.switch_to.alert.accept
	  expect(page).not_to have_content("Reservado por #{user.email}")
	end

	scenario "shows reserves of another user", js: true  do
	  user = create(:user)
	  room = create(:room, user: user)
	  signin(user.email, user.password)

	  expect(page).to have_content("Reservado por #{user.email}")
	end
end