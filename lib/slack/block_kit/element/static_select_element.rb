# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class StaticSelectElement < SelectElement
        using Refinements::HashCompact
        attr_reader :options, :option_groups, :initial_option

        def self.populate(hash, object)
          hash[:options].each(&object.options.method(:<<)) if hash.key?(:options)
          hash[:option_groups].each(&object.option_groups.method(:<<)) if hash.key?(:option_groups)
          object.initial_option = hash[:initial_option] if hash.key?(:initial_option)

          super(hash, object)
        end

        def initialize
          @options = TypeRestrictedArray.new(CompositionObjects::Option)
          @option_groups = TypeRestrictedArray.new(CompositionObjects::OptionGroup)
        end

        # Either options or option_groups must exist and be non-empty.
        def valid?
          if @options.nil? || @options.empty? then !@option_groups.empty?
          else !@options&.empty?
          end
        end

        def initial_option=(obj)
          raise TypeError, 'text must be a Option Object' unless obj.is_a?(CompositionObjects::Option)

          @initial_option = obj
        end

        def to_h
          super.merge(
            options: options.map(&:to_h),
            option_groups: option_groups.map(&:to_h),
            initial_option: initial_option&.to_h
          ).compact
        end
      end
    end
  end
end
