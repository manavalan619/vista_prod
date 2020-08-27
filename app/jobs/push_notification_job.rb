class PushNotificationJob < ApplicationJob
  queue_as :default

  def perform(notification)
    @notification = notification

    @notification.user.devices.each do |device|
      create_ios_notification(device) if device.ios?
      create_android_notification(device) if device.android?
    end
  end

  private

  def notification_type
    @notification.human_type
  end

  def ios_notification_data
    { type: notification_type, object_id: @notification.object_id }
  end

  def android_notification_data
    { message: notification_title }
  end

  def create_ios_notification(device)
    n = Rpush::Apns::Notification.new
    n.app = Rpush::Apnsp8::App.find_by(name: 'ios_member_app')
    n.device_token = device.token
    n.alert = notification_title
    n.data = ios_notification_data
    n.save!
  end

  def create_android_notification(device)
    n = Rpush::Gcm::Notification.new
    n.app = Rpush::Gcm::App.find_by(name: 'android_member_app')
    n.registration_ids = [device.token]
    n.data = android_notification_data
    n.priority = 'high' # Optional, can be either 'normal' or 'high'
    n.save!
  end

  def notification_title
    name = @notification.object.name
    I18n.t("notifications.#{notification_type}.title", name: name)
  end
end
