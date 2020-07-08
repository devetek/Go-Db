package userModel

import (
	"time"

	"github.com/devetek/go-db/utils/database"
)

func AddNewUser(username string, department string, created time.Time) int {
	db := database.Init()

	var lastInsertId int
	err := db.QueryRow("INSERT INTO userinfo(username, departname, created) VALUES($1,$2,$3) returning uid;", username, department, created).Scan(&lastInsertId)

	if err != nil {
		return 0
	}

	defer db.Close()

	return lastInsertId
}
