class CalendarController < ApplicationController
	before_filter :authenticate_user!
	def index
		@calendar = CalendarPresenter.new("")
	end
end
