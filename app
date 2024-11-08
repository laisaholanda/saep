from flask import Flask, render_template, redirect, request
from bd import BD

app = Flask(__name__)
bd = BD()

@app.route("/")
def lista():
    contatos = bd.buscaContatos()
    return render_template("lista.html", contatos)

@app.route("/deletar/<string:numero>")
def deletar(numero):
    bd.deletarContato(numero)
    
    return redirect("/")

@app.route("/cadastro")
def cadastro ():
    return render_template("cadastro.html")

@app.route("novoContato", methods= ["POST"])
def novoContato():
    nome = request.form["nome"]
    numero = request.form["numero"]
    cidade = request.form["cidade"]
    
    bd.adicionarContato(nome, numero, cidade)
    
    return redirect
    
    

if __name__ == "__main__":
    app.run(debug=True)
