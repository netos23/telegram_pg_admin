from telebot import types
from telebot.types import WebAppInfo

from telegram_sender import sender


@sender.bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
    markup = types.ReplyKeyboardMarkup(row_width=2)
    itembtn1 = types.KeyboardButton('Lets administrate!', web_app=WebAppInfo('https://pg-telegram.web.app/'))
    markup.add(itembtn1)
    sender.send_message("Превет, я помогу позаботиться о вашей базе, пока вы отдыхаете", message.chat.id, markup=markup)


sender.bot.infinity_polling()
