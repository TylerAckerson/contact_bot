import os

SLACK_BOT_ID = os.environ.get('SLACK_BOT_ID')
SLACK_BOT_TOKEN = os.environ.get('SLACK_BOT_TOKEN')
SLACK_CHANNEL = os.environ.get('SLACK_CHANNEL')
SLACK_BOT_NAME ='contact_bot'
SLACK_AT_BOT = "<@" + SLACK_BOT_ID + ">:"

TWILIO_ACCOUNT_SID = os.environ['TWILIO_ACCOUNT_SID']
TWILIO_API_KEY = os.environ['TWILIO_API_KEY']
TWILIO_API_SECRET = os.environ['TWILIO_API_SECRET']
TWILIO_SERVICE_SID = os.environ['TWILIO_IPM_SERVICE_SID']
TWILIO_AUTH_TOKEN = os.environ['TWILIO_AUTH_TOKEN']