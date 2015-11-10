module Error
  # Raise this error when percentage values are outside of the limits [0.0,100.0]
  # or when the value is not a float number.
  class InvalidPercentageValueError < StandardError; end
end
