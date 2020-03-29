# frozen_string_literal: true

module Slack
  module BlockKit
    module Refinements
      module HashCompact
        refine Hash do
          def compact
            reject { |_, v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
          end
        end
      end
    end
  end
end
