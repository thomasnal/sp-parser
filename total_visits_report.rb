require './can_print'


#
# Report that counts visits from all IP addresses including repeated ones
#
class TotalVisitsReport

  include CanPrint
  

  def initialize visits=[]
    @visits = visits
    @visit_string = 'visits'
  end


  private


  def visits_counts
    counts = @visits.inject(Hash.new(0)) do |counts, visit| 
      counts[visit[:path]] += 1
      counts
    end

    counts.sort_by { |k, v| -v }
  end

end
