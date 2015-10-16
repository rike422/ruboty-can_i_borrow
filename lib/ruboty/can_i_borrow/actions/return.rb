module Ruboty
  module CanIBorrow
    module Actions
      class Return < Base
        def try_return
          return message.reply("#{message[:item]}は借しだされていません。") if borrow_history.nil?

          if borrower?
            return_item
            message.reply("#{item}を返却済みにします。ありがとうございました。")
            return if booking_list.empty?
            message.reply("#{item}は#{booking_list.first}さんに渡してください。")
          else
            message.reply("#{item}は#{borrow_history[:user]}さんによって借りられています。")
          end
        end

        private

        def return_item
          leager[item] = nil
        end
      end
    end
  end
end
