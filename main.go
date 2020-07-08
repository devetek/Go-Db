package main

import (
	"log"
	"net/http"

	dashboardRoute "github.com/devetek/go-db/routes/dashboard"
	homeRoute "github.com/devetek/go-db/routes/home"
	memberRoute "github.com/devetek/go-db/routes/member"
	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/dashboard", dashboardRoute.DashboardHandler)
	r.HandleFunc("/member", memberRoute.MemberHandler)
	r.HandleFunc("/", homeRoute.HomeHandler)
	http.Handle("/", r)

	log.Fatal(http.ListenAndServe(":9000", nil))
}
