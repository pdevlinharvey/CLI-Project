class Opening
  attr_accessor :name, :move_order, :color

  def initialize(name, move_order, color)
    @name = name
    @move_order = move_order
    @color = color
  end

  def to_s
    "#{@name} is played by #{color}: #{@move_order}"
  end
end
