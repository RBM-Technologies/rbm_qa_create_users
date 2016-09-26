
module ValueHelpers
  def value_for(element)
    case element
    when 'Administrator'
      2
    when 'District Manager'
      3
    when 'RBM Admin'
      1
    when 'Real Estate'
      7
    when 'Report/Read_Only'
      5
    when 'Report/Read_Only TPR Role'
      8
    when 'Store Manager'
      4
    else
      raise ArgumentError, "Role '#{element}' is not defined. Please add a mapping in #{__FILE__}."
    end
  end
end

World ValueHelpers
