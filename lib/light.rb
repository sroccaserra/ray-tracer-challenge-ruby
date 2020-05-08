class PointLight
  attr_reader :position, :intensity

  def initialize(position, intensity)
    @position = position
    @intensity = intensity
  end

  def direction_to(p)
    (@position - p).normalize
  end
end
