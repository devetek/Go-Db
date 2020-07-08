package database

/**
Basic Ref:
- https://www.alexedwards.net/blog/configuring-sqldb
*/

import (
	"database/sql"
	"fmt"

	"github.com/devetek/go-db/utils/config"
	_ "github.com/lib/pq"
)

var db *sql.DB
var conf *config.Config

func Init() *sql.DB {
	conf := config.Init()

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		conf.Database.Host, conf.Database.Port, conf.Database.Username, conf.Database.Password, conf.Database.Db)

	db, err := sql.Open("postgres", psqlInfo)

	db.SetMaxIdleConns(5)
	db.SetMaxOpenConns(5)

	if err != nil {
		panic(err)
	}

	err = db.Ping()
	if err != nil {
		panic(err)
	}

	return db
}
