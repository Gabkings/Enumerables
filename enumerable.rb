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

end
# rubocop:enable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Style/CaseEquality
