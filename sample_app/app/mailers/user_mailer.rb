class UserMailer < ActionMailer::Base
  default :from => 'Barters Rus <barters@bartersrus.com>'

  def barter_posted(barter)
    mail(:to => barter.email, :subject => 'Barter Posted') do |format|
      format.text
    end
  end

  def barter_response(barter, original_barter)
    mail(:to => barter.email, :subject => 'Barter Response') do |format|
      format.text
    end
  end

end
