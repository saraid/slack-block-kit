# frozen_string_literal: true

module Slack
  module BlockKit
    module CompositionObjects
      class Filter
        attr_reader :include, :exclude_external_shared_channels, :exclude_bot_users

        def self.[](hash)
          new.tap do |object|
            hash[:include].each(&object.include.method(:<<))
            object.exclude_external_shared_channels! if hash[:exclude_external_shared_channels]
            object.exclude_bot_users! if hash[:exclude_bot_users]
          end
        end

        def initialize
          @include = TypeRestrictedArray.new(String)
        end

        def exclude_external_shared_channels!
          @exclude_external_shared_channels = true
        end

        def exclude_bot_users!
          @exclude_bot_users = true
        end

        def to_h
          { include: self.include,
            exclude_external_shared_channels: exclude_external_shared_channels,
            exclude_bot_users: exclude_bot_users }.select { |_, v| v }
        end
      end
    end
  end
end
