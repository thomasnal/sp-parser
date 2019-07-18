require './visits_log'
require 'set'


class UniqueVisits

  attr_reader :visits_log


  def initialize visits_log
    @visits_log = visits_log
  end


  def items
    @items ||= visits_counts
  end


  private


  def visits_counts
    init_hash = Hash.new { |h, k| h[k] = Set.new }

    visits = visits_log.each_with_object(init_hash) do |path, ip, uniques|
      uniques[path] << ip
    end
      
    visits.each do |path, ips|
      visits[path] = ips.length
    end
  end

end
