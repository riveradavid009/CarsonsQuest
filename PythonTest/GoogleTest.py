#import gflags
import httplib2

from oauth2client import tools
from apiclient.discovery import build
from oauth2client.file import Storage
from oauth2client.client import OAuth2WebServerFlow
from oauth2client.tools import run

flags = tools.argparser.parse_args(args=[])
#FLAGS = gflags.FLAGS

# Set up a Flow object to be used if we need to authenticate. This
# sample uses OAuth 2.0, and we set up the OAuth2WebServerFlow with
# the information it needs to authenticate. Note that it is called
# the Web Server Flow, but it can also handle the flow for native
# applications
# The client_id and client_secret can be found in Google Developers Console
FLOW = OAuth2WebServerFlow(
    client_id='188821364515-nrl25j934h8m2at8hh6q0p4dh067fjck.apps.googleusercontent.com',
    client_secret='AiBAY4U6IUs_ezQyVw7i790t',
    scope='https://www.googleapis.com/auth/calendar',
    user_agent='LDCLOUD Webhooks/1.0')

# To disable the local server feature, uncomment the following line:
#flags.auth_local_webserver = False

# If the Credentials don't exist or are invalid, run through the native client
# flow. The Storage object will ensure that if successful the good
# Credentials will get written back to a file.
storage = Storage('calendar.dat')
credentials = storage.get()
#credentials = tools.run_flow(FLOW, storage, flags)
if credentials is None or credentials.invalid == True:
  credentials = tools.run_flow(FLOW, storage, flags)

# Create an httplib2.Http object to handle our HTTP requests and authorize it
# with our good Credentials.
http = httplib2.Http()
http = credentials.authorize(http)

# Build a service object for interacting with the API. Visit
# the Google Developers Console
# to get a developerKey for your own application.
service = build(serviceName='calendar', version='v3', http=http,developerKey='YOUR_DEVELOPER_KEY')

event = {
  'summary': 'Appointment',
  'location': 'Somewhere',
  'start': {
    'dateTime': '2015-02-19T10:00:00.000-07:00',
    'timeZone': 'America/Los_Angeles'
  },
  'end': {
    'dateTime': '2015-02-19T10:25:00.000-07:00',
    'timeZone': 'America/Los_Angeles'
  },
  'attendees': [
    {
      "optional": False,
   	  "responseStatus": "needsAction",
      "email": "rivera.david009@gmail.com"
    },
  ],
}

events = service.events().list(calendarId='invites-noreply@liquidanalytics.com').execute()
print events



