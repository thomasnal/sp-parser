#
# Common print functionality for the reports
#
module CanPrint

  def print
    visits_counts.each do |path, count|
      puts "#{path} #{count} #{@visit_string}"
    end
  end

end
