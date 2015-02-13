
import requests as req
from flask import Flask,request
import json
app = Flask(__name__)
num = 0

@app.route("/",methods=['GET', 'POST'])
def hello():
    global num
    print(request)
    #token=request.form['token']
    text=request.form['text']
    print(text,'%2B%2B')
    if '%2B%2B' in text or '++' in text:
        print('here')
        name = text.replace('%2B%2B','')
        name = name.replace('++','')
        name = name.replace(' ','')
        print(name)
        liked_times = like(name)
        print('>>>>',liked_times)
        payload={'text':name+' has '+str(liked_times)+' likes'}
        print(json.dumps(payload))
        send_to_slack(payload)
    elif text[0]=='[' and text[-1]==']':
        event=text[1:-1]
        print(event)
        team_event(event)

        payload={'text':'event added: '+event}

        send_to_slack(payload)

def send_to_slack(payload):
    headers = {'content-type': 'application/json'}
    res=req.post('https://hooks.slack.com/services/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',data=json.dumps(payload),headers=headers)
    print(res)
    return res

def team_event(text):
    headers = {'content-type': 'application/x-www-form-urlencoded'}
    res=req.post('http://localhost:3000/api/events/new',data='event%5Bmessage%5D='+text,headers=headers)
    return res

def like(user_name):
    res=req.get('http://localhost:3000/api/users/like?user_name='+user_name)
    return res.json()['like']


@app.route("/test")
def test():
    return 'test123'

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=8000)
