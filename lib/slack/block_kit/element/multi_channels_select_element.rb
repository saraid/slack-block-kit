# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class MultiChannelsSelectElement < ChannelsSelectElement
        undef_method :initial_channel=
        attr_reader :initial_channels, :max_selected_items

        def self.[](hash)
          new.tap do |object|
            hash[:initial_channels].each(&object.initial_channels.method(:<<)) if hash.key?(:initial_channels)

            object.placeholder = hash.fetch(:placeholder)
            object.confirm = hash[:confirm] if hash.key?(:confirm)
            object.max_selected_items = hash[:max_selected_items] if hash.key?(:max_selected_items)

            object.action_id = hash[:action_id] if hash.key?(:action_id)
            raise ArgumentError, 'invalid MultiChannelsSelectElement' unless object.valid?
          end
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
          ).reject { |_, v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
        end
      end
    end
  end
end
