package homeRoute

import (
	"fmt"
	"net/http"
)

func HomeHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	w.Header().Set("X-App-ID", "Terpusat")
	fmt.Fprintf(w, "Welcome to Terpusat")
}
