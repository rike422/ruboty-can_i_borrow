module Ruboty
  module CanIBorrow
    module Actions
      class Borrow < Base
        def call
          unless borrowed?
            borrow
            message.reply("#{item}を貸し出し状態にします。")
          else
            message.reply("#{item}は#{borrow_history[:borrowed_at]}に#{borrow_history[:user]}さんに貸し出されています。")
          end
        end

        private

        def borrow
          leager[item] = {
            item: item,
            user: message.from_name,
            borrowed_at: Date.today
          }
        end
      end
    end
  end
end
