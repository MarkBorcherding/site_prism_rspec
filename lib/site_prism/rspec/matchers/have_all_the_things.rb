module SitePrism
  module RSpec
    module Matchers
      class HaveAllTheThings
        def matches?(actual)
          @actual  = actual
          missing_items.length == 0
        end

        def failure_message
          "Expected #{actual.class} to have #{expected_items.join ', '}, but didn't find #{missing_items.join ', '}."
        end

        protected

        def expected_items
          actual.class.mapped_items
        end

        def missing_items
          expected_items.reject { |element| actual.send "has_#{element}?" }
        end

        def actual
          @actual
        end

      end

      def have_all_the_things
        HaveAllTheThings.new
      end
    end
  end
end