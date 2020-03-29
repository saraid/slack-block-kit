# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ChannelsSelectElement < SelectElement
        attr_reader :initial_channel, :response_url_enabled
        attr_writer :initial_channel

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
