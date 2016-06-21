class TrainsMailer < ApplicationMailer
  def cauntion_train(number, user)
    cur_user = User.find(user)
    @user = cur_user
    @number = number
    mail(to: cur_user.email, subject: 'Внимание! Изменилось имя поезда')
  end
end
