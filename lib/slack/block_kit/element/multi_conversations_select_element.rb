# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class MultiConversationsSelectElement < ConversationsSelectElement
        undef_method :initial_conversation=
        attr_reader :initial_conversations, :max_selected_items

        def self.[](hash)
          new.tap do |object|
            hash[:initial_conversations].each(&object.initial_conversations.method(:<<)) if hash.key?(:initial_conversations)

            object.placeholder = hash.fetch(:placeholder)
            object.confirm = hash[:confirm] if hash.key?(:confirm)
            object.max_selected_items = hash[:max_selected_items] if hash.key?(:max_selected_items)

            object.action_id = hash[:action_id] if hash.key?(:action_id)
            raise ArgumentError, 'invalid MultiConversationsSelectElement' unless object.valid?
          end
        end

        def initialize
          super
          @initial_conversations = []
        end

        def max_selected_items=(num)
          raise TypeError, 'max_selected_items must be an integer' unless num.respond_to?(:to_int)

          @max_selected_items = num.to_i
        end

        def to_h
          super.merge(
            initial_conversations: initial_conversations&.to_h,
            max_selected_items: max_selected_items || 1
          ).reject { |_, v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
        end
      end
    end
  end
end
