require 'date'

module DateCleaner

  def date_conversion(date)
    year = (date).year.to_s
    year.slice!(0,2)
    month_day = date.to_s
    month_day.delete!('-')
    month_day.slice!(0,4)
    date = String.new(month_day + year)
    date
  end
end