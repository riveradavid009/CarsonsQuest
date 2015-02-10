import httplib2

from oauth2client import tools
from apiclient.discovery import build
from oauth2client.file import Storage
from oauth2client.client import OAuth2WebServerFlow
from oauth2client.tools import run

flags = tools.argparser.parse_args(args=[])


# Set up a Flow object to be used if we need to authenticate. This
# sample uses OAuth 2.0, and we set up the OAuth2WebServerFlow with
# the information it needs to authenticate. Note that it is called
# the Web Server Flow, but it can also handle the flow for native
# applications
# The client_id and client_secret can be found in Google Developers Console
FLOW = OAuth2WebServerFlow(
    client_id='530561913153-9f18cg1d3s7dllna1vtidgkca3sh755a.apps.googleusercontent.com',
    client_secret='0rr4VgW2uGb1gMyzx6TGRmhU',
    scope='https://www.googleapis.com/auth/calendar',
    user_agent='CalDavTest/0.1')

# To disable the local server feature, uncomment the following line:
#flags.auth_local_webserver = False

# If the Credentials don't exist or are invalid, run through the native client
# flow. The Storage object will ensure that if successful the good
# Credentials will get written back to a file.
storage = Storage('calendar.dat')
credentials = storage.get()
#credentials = tools.run_flow(FLOW, storage, flags)
if credentials is None or credentials.invalid == True:
  credentials = run(FLOW, storage)

# Create an httplib2.Http object to handle our HTTP requests and authorize it
# with our good Credentials.
http = httplib2.Http()
http = credentials.authorize(http)

# Build a service object for interacting with the API. Visit
# the Google Developers Console
# to get a developerKey for your own application.
service = build(serviceName='calendar', version='v3', http=http,developerKey='YOUR_DEVELOPER_KEY')

eventId = 'qae19p46cd8arc2mkiejfag1g4'
event = service.events().get(calendarId='primary', eventId=eventId).execute()

print event['attendees']