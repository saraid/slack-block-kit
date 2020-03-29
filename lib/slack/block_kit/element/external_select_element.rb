# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ExternalSelectElement < SelectElement
        attr_reader :initial_option, :min_query_length

        def initial_option=(obj)
          raise TypeError, 'initial_option must be a Option Object' unless obj.is_a?(CompositionObjects::Option)

          @initial_option = obj
        end

        def min_query_length=(length)
          raise TypeError, 'min_query_length must be an integer' unless length.respond_to?(:to_int)

          @min_query_length = length.to_i
        end

        def to_h
          super.merge(
            initial_option: initial_option&.to_h,
            min_query_length: min_query_length || 3
          ).reject { |_, v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
        end
      end
    end
  end
end
