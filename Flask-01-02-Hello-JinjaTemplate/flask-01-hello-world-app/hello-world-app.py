from flask import Flask 
app = Flask(__name__)

@app.route('/')
def head():
     return 'Hello world Flask'

@app.route('/second')
def second():
     return 'This is the second page'

@app.route('/third')
def third():
     return 'This is the third page'

@app.route('/fourth/<string:id>') #http://127.0.0.1:5000/fourth/kadirstringiniburaya%20yazdim
def forth(id):
     return f'Id of this page is {id}'


if __name__ == '__main__':
     app.run(host= '0.0.0.0', port=80) # for ec2 instance
     # app.run(debug=True) # for localhost
     