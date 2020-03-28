# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class DividerBlock < Block
        def self.[](hash = nil)
          new.tap do |object|
            object.block_id = hash[:block_id] if hash&.key?(:block_id)
          end
        end

        def to_h
          super.reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
