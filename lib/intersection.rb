Intersection = Struct.new(:t, :object)

def hit_from_intersections(intersections)
  intersections
    .filter { |i| i.t >= 0 }
    .min_by(&:t)
end
