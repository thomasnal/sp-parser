require './visits_log'


class TotalVisits

  attr_reader :visits_log


  def initialize visits_log
    @visits_log = visits_log
  end


  def items
    @items ||= visits_counts
  end


  private


  def visits_counts
    visits_log.each_with_object(Hash.new(0)) do |path, ip, totals|
      totals[path] += 1
    end
  end

end
