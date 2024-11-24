# frozen_string_literal: true

module Enumerable
  # Your code goes here
  def my_all?
    my_each { |elem| return false unless yield(elem) }

    true
  end

  def my_any?
    my_each { |elem| return true if yield(elem) }

    false
  end

  def my_none?
    my_each { |elem| return false if yield(elem) }

    true
  end

  def my_count
    count = 0
    if block_given?
      my_each { |elem| count += 1 if yield(elem) }
    else
      my_each { |_| count += 1 }
    end

    count
  end

  def my_each_with_index
    (0...my_count).to_a.my_each do |i|
      yield(at(i), i)
    end

    self
  end

  def my_select
    result = []

    my_each { |elem| result << elem if yield(elem) }

    result
  end

  def my_map
    result = []

    my_each { |elem| result << yield(elem) }

    result
  end

  def my_inject(initial_value)
    value = initial_value

    my_each { |elem| value = yield(value, elem) }

    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in (0...length) # rubocop:disable Style/For
      yield(at(i))
    end

    self
  end
end
