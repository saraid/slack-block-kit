# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ConversationsSelectElement < SelectElement
        attr_reader :initial_conversation, :response_url_enabled, :filter
        attr_writer :initial_conversation

        def self.[](hash)
          new.tap do |object|
            if hash.key?(:initial_conversation)
              object.initial_conversation = hash[:initial_conversation]
            end
            object.response_url_enabled! if hash.key?(:response_url_enabled)
            object.filter = hash[:filter] if hash.key?(:filter)

            object.placeholder = hash.fetch(:placeholder)
            object.confirm = hash[:confirm] if hash.key?(:confirm)

            object.action_id = hash[:action_id] if hash.key?(:action_id)
          end
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
          ).reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
