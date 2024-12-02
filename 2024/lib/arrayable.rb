module Arrayable
  def within_bounds?(twod_arr, r, c)
    r.between?(0, twod_arr.size - 1) && c.between?(0, twod_arr[0].size - 1)
  end
end
