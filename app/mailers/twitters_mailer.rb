class TwittersMailer < ApplicationMailer
    def twitter_mail(twitter)
    @twitter = twitter
    
    mail to: "keikomakiba@gmail.com", subject: "ブログを投稿しました"    
    end
end
