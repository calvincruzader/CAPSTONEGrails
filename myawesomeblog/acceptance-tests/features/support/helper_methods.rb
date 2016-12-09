def reverse_order? arr
  arr.each_cons(2).all?{|more_recent_date, less_recent_date|
    DateTime.parse(more_recent_date.text) >= DateTime.parse(less_recent_date.text)}
end
