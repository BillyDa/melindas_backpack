class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def outfit(conditions)
    @items << 'pants'
    @items << 'shirt'
    if conditions == 'rainy'
      @items << 'umbrella'
    elsif conditions == 'cold'
      @items << 'jacket'
    end

  end

  # Ensure gym shoes are added to backpack if it's a gym day
  def shoes(day_of_week)
    if day_of_week == 'monday' || day_of_week == 'thursday'
      @items << 'gym shoes'
    end
  end

  def meals(day_of_week)
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    else
      @items << 'snacks'
    end
  end


  def prepare
    # set up local variables used by rest of prepare method
    conditions = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]
    
    outfit(conditions)
    shoes(day_of_week)
    meals(day_of_week)
  end

  def packing_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end
end
