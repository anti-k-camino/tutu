class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end
  def drop_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Выотказались от билета')
  end
end
