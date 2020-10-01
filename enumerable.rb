# rubocop:disable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Style/CaseEquality
module Enumerable
    def my_each
        return enum_for unless block_given?

        y = 0
        while y < length
            yield(self[y])
            y += 1
        end
        self
    end

    def my_each_with_index
        return enum_for unless block_given?
    
        x = 0
        while x < length
          yield(self[x], x)
          x += 1
        end
        self
    end    

    def my_select
        return enum_for unless block_given?
    
        new_array = []
        my_each do |x|
          new_array.push(x) if yield(x)
        end
        new_array
    end

    def my_all?(*args)
        result = true
        
        my_each do |x|
          if block_given?
            result = false if yield(x) == false
          elsif !block_given? && !args.empty? && !args[0].is_a?(Regexp)
            my_each { |y| result = false unless args[0] === y }
          elsif args[0].is_a?(Regexp)
            my_each { |y| result = false unless y.match(args[0]) }
          elsif !block_given? && args.empty?
            result = false if x.nil? || x == false
          end
        end
        result
    end

end
# rubocop:enable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Style/CaseEquality
