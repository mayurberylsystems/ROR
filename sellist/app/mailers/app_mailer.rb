class AppMailer < ApplicationMailer
  default from: 'beryl.testing123@gmail.com'
  layout 'mailer'

  def recommended_app_notification(id)
    @app = RecommendedApp.find(id)
    @user = @app.user
  	mail to: 's.sitzer@pcdynamicsit.com', bcc: 'khushbu.goyal@berylsystems.com', subject: "#{@user.full_name} Recommended New App to Integrate"
  end
end
