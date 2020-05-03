Intersection = Struct.new(:t, :object)

def hit(intersections)
  intersections
    .filter { |i| i.t >= 0 }
    .min_by(&:t)
end
