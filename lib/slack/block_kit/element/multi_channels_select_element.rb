# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class MultiChannelsSelectElement < ChannelsSelectElement
        using Refinements::HashCompact
        undef_method :initial_channel=
        attr_reader :initial_channels, :max_selected_items

        def self.populate(hash, object)
          hash[:initial_channels].each(&object.initial_channels.method(:<<)) if hash.key?(:initial_channels)
          object.max_selected_items = hash[:max_selected_items] if hash.key?(:max_selected_items)

          super(hash, object)
        end

        def initialize
          super
          @initial_channels = []
        end

        def max_selected_items=(num)
          raise TypeError, 'max_selected_items must be an integer' unless num.respond_to?(:to_int)

          @max_selected_items = num.to_i
        end

        def to_h
          super.merge(
            initial_channels: initial_channels&.to_h,
            max_selected_items: max_selected_items || 1
          ).compact
        end
      end
    end
  end
end
