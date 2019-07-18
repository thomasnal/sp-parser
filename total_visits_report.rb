require './can_print'

#
# Report that counts visits from all IP addresses including repeated ones
#
class TotalVisitsReport

  include CanPrint


  def initialize visits
    @visits = visits
    @line_suffix = 'visits'
  end


  private


  def items
    @visits.items.sort_by { |k, v| -v }
  end

end
