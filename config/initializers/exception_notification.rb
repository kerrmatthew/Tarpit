require 'exception_notifier'

Tarpit::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => "Tarpit",
    :sender_address => "tarpit_errors@tarpit_errors",
    :exception_recipients => 'matthew.kerr@me.com'