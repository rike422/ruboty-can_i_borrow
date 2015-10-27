module Ruboty
  module CanIBorrow
    NAME_SPACE = 'CAN_I_BORROW'

    module Actions
      class Base < Ruboty::Actions::Base
        def leager
          message.robot.brain.data[Ruboty::CanIBorrow::NAME_SPACE] ||= {}
        end

        def booking_list
          leger[item][:booking_list] ||= []
        end


        def borrowed?
          !borrow_history.nil?
        end

        def borrower?
          borrow_history[:user] == message.from_name
        end

        def borrow_history
          leager[item]
        end

        def item
          message[:item]
        end

        def from_name
          message.from_name
        end
      end
    end
  end
end
