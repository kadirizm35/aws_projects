from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def head():
    return render_template('index.html', number1= 5, number2= 11)

@app.route('/mult')
def number():
    x=5
    y=11
    return render_template('body.html', value1=x, value2=y, mult=x*y)



if __name__== "__main__":
     app.run(host= '0.0.0.0', port=80)  # for ec2 instances
     # app.run(debug=True, port=3000) # for localhost