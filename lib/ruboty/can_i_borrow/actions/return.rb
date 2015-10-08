module Ruboty
  module CanIBorrow
    module Actions
      class Return < Base
        def call
          return message.reply("#{message[:item]}は借しだされていません。") if borrow_history.nil?

          if borrower?
            return_item
            message.reply("#{item}を返却済みにします。ありがとうございました。")
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
