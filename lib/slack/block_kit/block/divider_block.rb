# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class DividerBlock < Block
        using Refinements::HashCompact
        def to_h
          super.compact
        end
      end
    end
  end
end
