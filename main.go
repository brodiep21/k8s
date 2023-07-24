package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"
)

type Hello struct {
	World string
}

var h Hello

var templ *template.Template

func init() {
	templ = template.Must(template.ParseGlob("*.html"))
}

func homepage(w http.ResponseWriter, r *http.Request) {

	h.World = "Hello World"
	templ.ExecuteTemplate(w, "site.html", h)
}
func main() {
	port := os.Getenv("PORT")

	if port == "" {
		port = "80"
		log.Printf("Setting default port to %s", port)
	}

	fmt.Printf("Starting server at %s\n", port)

	http.HandleFunc("/", homepage)
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		fmt.Println(err)
	}

}
