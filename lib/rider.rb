class Rider
  attr_reader :id, :speed, :x, :y

  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
