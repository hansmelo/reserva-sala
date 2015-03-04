module CalendarHelper
	WORK_DAYS = [:Segunda, :Terça, :Quarta, :Quinta, :Sexta]
	WORK_HOURS = (6..23).to_a

	def work_days
	  Hash[WORK_DAYS.zip work_days_week]
	end

	def work_hours
	  WORK_HOURS
	end

	def weekday(wday)
      content_tag(:div, wday).html_safe
 	end
	
	def work_days_week
	  (DateTime.now.beginning_of_week..DateTime.now.end_of_week-2).to_a
	end
end
