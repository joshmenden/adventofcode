module Numericable
  def numeric?(val)
    val.match?(/\A\d+\z/)
  end

  def extract_continugous_digits(str, single_digit: false, exclude_negative: false)
    regex = if single_digit
      exclude_negative ? /\d/ : /-?\d/
    else
      exclude_negative ? /\d+/ : /-?\d+/
    end

    str.scan(regex).map(&:to_i)
  end
end
