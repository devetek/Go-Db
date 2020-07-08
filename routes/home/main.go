package homeRoute

import (
	"fmt"
	"net/http"
)

func HomeHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "Terpusat")
	w.Header().Set("X-App-ID", "text/html; charset=utf-8")
	fmt.Fprintf(w, "Hello gaes, thanks for visiting %s! You create new visitor %d", r.URL.Path[1:], 0)
}
