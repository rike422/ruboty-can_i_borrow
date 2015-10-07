module Ruboty
  module Handlers
    class CanIBorrow < Base
      on /borrow to ?(?<item>.+)?/, name: 'borrow', description: 'TODO: write your description'
      on /return to ?(?<item>.+)?/, name: 'return', description: 'TODO: write your description'

      def borrow(message)
        Ruboty::CanIBorrow::Actions::Borrow.new(message).call
      end

      def return(message)
        Ruboty::CanIBorrow::Actions::Return.new(message).call
      end
    end
  end
end
