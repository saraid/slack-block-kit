# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ExternalSelectElement < SelectElement
        using Refinements::HashCompact
        attr_reader :initial_option, :min_query_length

        def self.populate(hash, object)
          object.initial_option = hash[:initial_option] if hash.key?(:initial_option)
          object.min_query_length = hash[:min_query_length] if hash.key?(:min_query_length)

          super(hash, object)
        end

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
          ).compact
        end
      end
    end
  end
end
