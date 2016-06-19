class TrainsMailer < ApplicationMailer
  def cauntion_train(user)    
    cur_user = User.find(user)
    @user = cur_user  
    mail(to: cur_user.email, subject: 'Внимание! Изменилось имя поезда')
  end
end