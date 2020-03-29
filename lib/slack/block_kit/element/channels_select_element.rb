# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ChannelsSelectElement < SelectElement
        using Refinements::HashCompact
        attr_reader :initial_channel, :response_url_enabled
        attr_writer :initial_channel

        def self.populate(hash, object)
          object.initial_channel = hash[:initial_channel] if hash.key?(:initial_channel)
          object.response_url_enabled! if hash.key?(:response_url_enabled)

          super(hash, object)
        end

        def response_url_enabled!
          @response_url_enabled = true
        end

        def to_h
          super.merge(
            initial_channel: initial_channel,
            response_url_enabled: response_url_enabled
          ).compact
        end
      end
    end
  end
end
