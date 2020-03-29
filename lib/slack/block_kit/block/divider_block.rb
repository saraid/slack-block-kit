# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class DividerBlock < Block
        def self.[](hash = {})
          new.tap { |obj| populate(hash, obj) }
        end

        def to_h
          super.compact
        end
      end
    end
  end
end
