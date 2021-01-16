require './lib/date_cleaner'

class Cypher
  include DateCleaner

  def date
    date_conversion(Date.today)
  end
end