# frozen_string_literal: true

module Slack
  module Messages
    module Blocks
      class TypeRestrictedArray < Array
        undef_method :concat, :[]= # Surely never necessary lol

        def initialize(*classes)
          @classes = classes
        end

        def <<(item)
          unless @classes.any? { |cls| item.is_a?(cls) }
            raise TypeError, "#{self.class} only accepts #{@classes}"
          end

          super(item)
        end
      end
    end
  end
end
