class UserMailer < ApplicationMailer
     default from: 'from@example.com'

    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        # attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
        mail(to: user.email, subject: 'Welcome to My Awesome Site') 
    end

    # def reminder_email(user)
    #     @user = user
    #     @url = ''
    #     mail(to: user.email, subject: 'Welcome to My Awesome Site') 
    # end
end
