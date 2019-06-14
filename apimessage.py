# apimessage.py

# Let's get this party started!
import falcon
import json

# Falcon follows the REST architectural style, meaning (among
# other things) that you think in terms of resources and state
# transitions, which map to HTTP verbs.
class ApiMessages(object):

    def on_post(self, req, resp,application,service,country):
        body = req.stream.read()
        print(body)
        statement = json.loads(body)
        print(statement['age'])

        resp.status = falcon.HTTP_200  # This is the default status
        resp.body = ('OkPost')


    def on_get(self, req, resp):
        """Handles GET requests"""
        print("get ok")
        resp.status = falcon.HTTP_200  # This is the default status
        resp.body = ('OkGet')


# falcon.API instances are callable WSGI apps
app = falcon.API()

# Resources are represented by long-lived class instances
api_message = ApiMessages()

# things will handle all requests to the '/things' URL path
app.add_route('/api_message', api_message)
app.add_route("/api_message/{application}/{service}/{country}", api_message)
