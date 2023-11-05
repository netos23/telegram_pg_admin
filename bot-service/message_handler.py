from telegram_sender import sender


@sender.bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
    sender.send_message("Привет, я помогу позаботиться о вашей базе, пока вы отдыхаете", message.chat.id, )


sender.bot.infinity_polling()
