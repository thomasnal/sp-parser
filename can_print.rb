#
# Common print functionality for the reports
#
module CanPrint

  def print
    items.each do |path, count|
      puts "#{path} #{count} #{@line_suffix}"
    end
  end

end
