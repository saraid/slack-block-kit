# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class MultiStaticSelectElement < StaticSelectElement
        undef_method :initial_option=
        attr_reader :initial_options, :max_selected_items

        def self.[](hash)
          new.tap do |object|
            hash[:options].each(&object.options.method(:<<)) if hash.key?(:options)
            hash[:option_groups].each(&object.option_groups.method(:<<)) if hash.key?(:option_groups)
            hash[:initial_options].each(&object.initial_options.method(:<<)) if hash.key?(:initial_options)

            object.placeholder = hash.fetch(:placeholder)
            object.confirm = hash[:confirm] if hash.key?(:confirm)
            object.max_selected_items = hash[:max_selected_items] if hash.key?(:max_selected_items)

            object.action_id = hash[:action_id] if hash.key?(:action_id)
            raise ArgumentError, 'invalid MultiStaticSelectElement' unless object.valid?
          end
        end

        def initialize
          super
          @initial_options = TypeRestrictedArray.new(CompositionObjects::Option)
        end

        def max_selected_items=(num)
          raise TypeError, 'max_selected_items must be an integer' unless num.respond_to?(:to_int)

          @max_selected_items = num.to_i
        end

        def to_h
          super.merge(
            initial_options: initial_options&.to_h,
            max_selected_items: max_selected_items || 1
          ).reject { |_, v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
        end
      end
    end
  end
end
