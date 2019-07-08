#
# Parses log file and provides it as [{path: , ip:}]
#
class VisitsLog

  def initialize file_name=nil
    raise ArgumentError.new('Missing filename') if file_name.nil?
    @file_name = file_name
  end


  def items
    @visits ||= read_visits
  end


  private


  def read_visits
    File.foreach(@file_name).map do |line|
      line_items = line.split ' '
      { path: line_items[0], ip: line_items[1] }
    end
  end

end
