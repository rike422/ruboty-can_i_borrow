module Ruboty
  module Handlers
    class CanIBorrow < Base
      on /borrow to ?(?<item>.+)?/, name: 'borrow', description: 'TODO: write your description'
      on /booking ?(?<item>.+)?/, name: 'borrow', description: 'TODO: write your description'
      on /borrow or booking ?(?<item>.+)?/, name: 'borrow_or_booking', description: 'TODO: write your description'
      on /return to ?(?<item>.+)?/, name: 'return', description: 'TODO: write your description'

      def borrow(message)
        borrow = Ruboty::CanIBorrow::Actions::Borrow.new(message)
        borrow.try_borrow
      end

      def borrow_or_booking(message)
        borrow = Ruboty::CanIBorrow::Actions::Borrow.new(message)
        borrow.booking unless borrow.try_borrow
      end

      def return(message)
        Ruboty::CanIBorrow::Actions::Return.new(message).call
        Ruboty::CanIBorrow::Actions::Borrow.new(message).rotate_booking_list
      end

      def borrowed_histories(message)
        Ruboty::CanIBorrow::Actions::BorrowedHistories.new(message).call
      end

      def booking(message)
        Ruboty::CanIBorrow::Actions::Borrow.new(message).booking
      end

      def cancel_booking(message)
        Ruboty::CanIBorrow::Actions::Borrow.new(message).cancel_booking
      end
    end
  end
end
