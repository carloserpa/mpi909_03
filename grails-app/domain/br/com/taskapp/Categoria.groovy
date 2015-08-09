package br.com.taskapp

class Categoria {
	String descricao

    static constraints = {
    	descricao(blank: false)
    }

    String toString() {
    	return this.descricao;
	}
}
