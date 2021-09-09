class TicketMailerPreview < ActionMailer::Preview
  def confirm_email
    TicketMailer.confirm_email(user: User.first)
  end

  def cancel_email
    TicketMailer.cancel_email(user: User.first)
  end
end
