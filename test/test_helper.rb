require "minitest/autorun"
require "pry"

ENV["ENV"] = "test"

class Minitest::Test
  # Write tests like Rails
  def self.test(name, &block)
    test_name = "test_#{name.gsub(/\s+/, "_")}".to_sym
    defined = method_defined? test_name
    raise "#{test_name} is already defined in #{self}" if defined
    if block_given?
      define_method(test_name, &block)
    else
      define_method(
        test_name
      ) { flunk "No implementation provided for #{name}" }
    end
  end
end
