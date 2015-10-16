module Ruboty
  module Handlers
    class CanIBorrow < Base
      on /borrow to ?(?<item>.+)?/, name: 'borrow', description: 'TODO: write your description'
      on /return to ?(?<item>.+)?/, name: 'return', description: 'TODO: write your description'
      on 'list borrowed', name: 'borrowed_histories', description: 'show borrowed histories'

      def borrow(message)
        Ruboty::CanIBorrow::Actions::Borrow.new(message).call
      end

      def return(message)
        Ruboty::CanIBorrow::Actions::Return.new(message).call
      end

      def borrowed_histories(message)
        Ruboty::CanIBorrow::Actions::BorrowedHistories.new(message).call
      end
    end
  end
end
