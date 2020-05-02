EPSILON = 0.00001

RSpec::Matchers.define :eq_epsilon do |expected|
  match do |actual|
    (actual - expected).magnitude < EPSILON
  end
end
