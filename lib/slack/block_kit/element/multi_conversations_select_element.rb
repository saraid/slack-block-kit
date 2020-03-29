# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class MultiConversationsSelectElement < ConversationsSelectElement
        using Refinements::HashCompact
        undef_method :initial_conversation=
        attr_reader :initial_conversations, :max_selected_items

        def self.populate(hash, object)
          hash[:initial_conversations].each(&object.initial_conversations.method(:<<)) if hash.key?(:initial_conversations)
          object.max_selected_items = hash[:max_selected_items] if hash.key?(:max_selected_items)

          super(hash, object)
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
          ).compact
        end
      end
    end
  end
end
