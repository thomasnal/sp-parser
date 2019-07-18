#
# Parses log file and provides it as [{path: , ip:}]
#
class VisitsLog

  def initialize file_name
    raise ArgumentError.new('Missing filename') if file_name.nil?

    @file_name = file_name
  end


  def items
    File.foreach @file_name
  end


  def each_with_object object
    items.each do |line|
      line_items = line.split ' '
      yield line_items[0], line_items[1], object
    end

    object
  end

end
