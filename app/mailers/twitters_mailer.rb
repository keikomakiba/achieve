class TwittersMailer < ApplicationMailer
    def twitter_mail(twitter)
    @twitter = twitter
    mail to: @twitter.user.email, subject: "ブログを投稿しました"    
    end
end
