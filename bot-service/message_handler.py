from telebot import types
from telebot.types import WebAppInfo

from models import UrlConnection
from telegram_sender import sender


@sender.bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
    markup = types.ReplyKeyboardMarkup(row_width=2)
    itembtn1 = types.KeyboardButton('Lets administrate!', web_app=WebAppInfo('https://pg-telegram.web.app/'))
    user_id = message.from_user.id
    chat_id = message.chat.id
    try:
        # надо найти юзера по user_id
        # добавить ему chat_id
        # если юзера нет, добавить и chat_id и user_id
        user = UrlConnection.query.filter_by(tg_user_id=user_id).one()
        print(user)
        user.tg_chat_id = chat_id
    except Exception:
        new_user = UrlConnection(tg_user_id=user_id, tg_chat_id=chat_id)
        UrlConnection.add(new_user)
    markup.add(itembtn1)
    sender.send_message("Привет, я помогу позаботиться о вашей базе, пока вы отдыхаете", message.chat.id, markup=markup)


sender.bot.infinity_polling()
