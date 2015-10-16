module Ruboty
  module CanIBorrow
    module Actions
      class Borrow < Base

        def try_borrow
          unless borrowed?
            borrow
            message.reply("#{item}を貸し出し状態にします。")
            true
          else
            message.reply("#{item}は#{borrow_history[:borrowed_at]}に#{borrow_history[:user]}さんに貸し出されています。")
            false
          end
        end

        def booking
          booking_list.push from_name unless booking_list.include? from_name
        end

        def rotate_booking_list
          borrow booking_list.first
          rotate
        end

        def cancel_booking
          booking_list.delete from_name
        end

        private

        def rotate
          leger[item][:booking_list] = booking_list.shift
        end

        def borrow(name = from_name)
          item = leager[item] || {
            booking_list: []
          }
          leager[item] = item.merge({
            user: name,
            borrowed_at: Date.today
          })
        end
      end
    end
  end
end
