module Ruboty
  module CanIBorrow
    module Actions
      class BorrowedHistories < Base
        def call
          if borrow_histories.empty?
            message.reply("現在、誰も借りていません。")
          else
            message.reply(build_message_borrow_histries)
          end
        end

        def build_message_borrow_histries
          borrow_histories.map do |item, borrow_history|
            "#{borrow_history[:user]}さんが、#{borrow_history[:borrowed_at]}に#{item}を借りています。"
          end.join("\n")
        end

        def borrow_histories
          leager.select { |k, v| v.nil? }
        end
      end
    end
  end
end
