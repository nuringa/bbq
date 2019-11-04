class EventUpdateInformerJob < ApplicationJob
  queue_as :default

  def perform(class_name, subject)
    event = subject.event
    mailer_method = EventMailer.method(class_name)

    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [subject.user.try(:email)]).uniq

    all_emails.each do |mail|
      mailer_method.call(event, subject, mail).deliver_later
    end
  end
end
