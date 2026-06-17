class AlphanumericDocument < DigitChecksum::BaseDocument
  set_verify_digits_weights first:  %w(5 4 3 2 9 8 7 6 5 4 3 2),
                            second: %w(6 5 4 3 2 9 8 7 6 5 4 3 2)

  set_division_modulo 11

  set_char_value_proc ->(char) { char.upcase.ord - 48 }

  set_clear_number_regexp %r{[^A-Za-z0-9]}

  set_format_regexp %r{([A-Z0-9]{2})[-.]?([A-Z0-9]{3})[-.]?([A-Z0-9]{3})[\/]?([A-Z0-9]{4})[-.]?(\d{2})}i

  set_pretty_format_mask %(%s.%s.%s/%s-%s)

  set_generator_numbers (0..9).to_a + ('A'..'Z').to_a
end
