require './can_print'


#
# Report that counts only vists from only unique IP addresses
#
class UniqueVisitsReport

  include CanPrint


  def initialize visits
    @visits = visits
    @line_suffix = 'unique views'
  end


  private


  def items
    @visits.items.sort_by { |k, v| -v }
  end

end
