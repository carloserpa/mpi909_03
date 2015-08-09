package br.com.taskapp

class Task {	

    String task
	Date requiredBy
	//String category
	Integer complete = 0

    static belongsTo = [category: Categoria]

    static constraints = {
    	task (blank: false)
    	requiredBy (blank: false)
    	//category (blank: false)
    }

    static mapping = {
    	sort requiredBy: "desc"
	}

}
