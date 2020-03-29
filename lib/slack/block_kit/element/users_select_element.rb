# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class UsersSelectElement < SelectElement
        attr_accessor :initial_user

        def to_h
          super.merge(
            initial_user: initial_user
          ).reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
