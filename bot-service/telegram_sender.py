import telebot


class TelegramSender:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(TelegramSender, cls).__new__(cls)
        return cls._instance

    def __init__(self):
        self.bot = telebot.TeleBot('6981773924:AAFZiL4CI4kneo4qJllbMka4WqdqY23T1Ro')

    # 293466331

    # our -4035313120
    def send_message(self, message, chat_id='293466331'):
        try:
            self.bot.send_message(chat_id, message)
        except Exception as e:
            print(e)

    def send_dict_message(self, title, dict_message, chat_id='293466331'):
        message = title + "\n"
        for k, v in dict_message.items():
            message += k + ": " + str(v) + "\n"
        self.send_message(message, chat_id=chat_id)
