from flask import Flask, request
from config import *

app = Flask(__name__)

@app.route('/')
def home():
    return f'''
        <form action="/saludar" method="post">
            <label for="name">Hola {NOMBRE}, tienes {EDAD} años, Ingrese su nombre:</label>
            <hr>
            <input type="text" id="name" name="name" required>
            <button type="submit">Enviar</button>
        </form>
    '''

@app.route('/saludar', methods=['POST'])
def saludar():
    name = request.form.get('name')
    return f"¡Hola, {name}! {NOMBRE} te da las gracias"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
