require './can_print'
require 'set'


#
# Report that counts only vists from only unique IP addresses
#
class UniqueVisitsReport

  include CanPrint


  def initialize visits=[]
    @visits = visits
    @visit_string = 'unique views'
  end


  private


  def visits_counts
    init_hash = Hash.new { |h, k| h[k] = Set.new }

    counts = @visits.inject(init_hash) do |counts, visit|
      counts[visit[:path]] << visit[:ip]
      counts
    end

    counts.map { |k, v| [k, v.length] }.sort_by { |k, v| -v }
  end

end
