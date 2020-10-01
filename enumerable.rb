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
end
# rubocop:enable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Style/CaseEquality
