# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ChannelsSelectElement < SelectElement
        attr_reader :initial_channel, :response_url_enabled
        attr_writer :initial_channel

        def self.[](hash)
          new.tap do |object|
            object.initial_channel = hash[:initial_channel] if hash.key?(:initial_channel)
            object.response_url_enabled! if hash.key?(:response_url_enabled)

            object.placeholder = hash.fetch(:placeholder)
            object.confirm = hash[:confirm] if hash.key?(:confirm)
            object.max_selected_items = hash[:max_selected_items] if hash.key?(:max_selected_items)

            object.action_id = hash[:action_id] if hash.key?(:action_id)
            raise ArgumentError, 'invalid MultiStaticSelectElement' unless object.valid?
          end
        end

        def response_url_enabled!
          @response_url_enabled = true
        end

        def to_h
          super.merge(
            initial_channel: initial_channel,
            response_url_enabled: response_url_enabled
          ).reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
