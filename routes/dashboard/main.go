package dashboardRoute

import (
	"fmt"
	"net/http"
)

func DashboardHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	w.Header().Set("X-App-ID", "Terpusat")
	fmt.Fprintf(w, "Welcome to page %s", r.URL.Path[1:])
}
