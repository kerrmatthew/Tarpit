require 'exception_notifier'

Tarpit::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => "Tarpit",
    :sender_address => "errors@wud-web.com",
    :exception_recipients => 'kerr.matthew@gmail.com'