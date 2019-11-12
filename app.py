from flask import Flask, request, render_template
import json

app = Flask(__name__, template_folder='frontend/web')


@app.route('/')
def landing_page():
    return render_template("index.html"), 200


@app.route('/users/')
def get_all_user():
    return json.dumps({'success': True, 'data': []}), 200


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
