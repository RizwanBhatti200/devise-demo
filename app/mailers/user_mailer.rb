class UserMailer < ApplicationMailer
    default :from =>  "rqbtest01@gmail.com"
    #Ex:- :default =>''

    def thank_you_mail(user)

        @user = user
        mail(:to => @user.email, :subject => "Registered")
    end
    
end
