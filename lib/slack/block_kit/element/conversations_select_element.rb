# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ConversationsSelectElement < SelectElement
        using Refinements::HashCompact
        attr_reader :initial_conversation, :response_url_enabled, :filter
        attr_writer :initial_conversation

        def self.populate(hash, object)
          if hash.key?(:initial_conversation)
            object.initial_conversation = hash[:initial_conversation]
          end
          object.response_url_enabled! if hash.key?(:response_url_enabled)
          object.filter = hash[:filter] if hash.key?(:filter)

          super(hash, object)
        end

        def response_url_enabled!
          @response_url_enabled = true
        end

        def filter=(obj)
          unless obj.is_a?(CompositionObjects::Filter)
            raise TypeError, 'confirm must be a Filter Object'
          end

          @filter = obj
        end

        def to_h
          super.merge(
            initial_conversation: initial_conversation,
            response_url_enabled: response_url_enabled,
            filter: filter&.to_h
          ).compact
        end
      end
    end
  end
end
