from flask import Flask

app = Flask(__name__)

@app.route('/health', methods=['GET'])
def health():
    return 'helloworld', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
