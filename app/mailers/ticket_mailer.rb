# frozen_string_literal: true

class TicketMailer < ApplicationMailer
  def confirm_email(user)
    @user = user
    mail(to: User.first.email, subject: 'Monte Cinema: Your tickets are confirmed!')
  end

  def cancel_email(user)
    @user = user
    mail(to: User.first.email, subject: 'Monte Cinema: Your reservation has been cancelled because of lack of payment.')
  end
end
