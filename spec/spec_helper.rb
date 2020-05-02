EPSILON = 0.00001

RSpec::Matchers.define :eq_epsilon do |expected|
  match do |actual|
    actual.values.zip(expected.values).all? do
      |a, e|
      are_all_values_within_epsilon?(a, e)
    end
  end
end

def are_all_values_within_epsilon?(actual_values, expected_values)
  actual_values.zip(expected_values).all? do
    |a, e|
    (a - e).abs < EPSILON
  end
end
