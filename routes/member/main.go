package memberRoute

import (
	"encoding/json"
	"net/http"
	"time"

	userModel "github.com/devetek/go-db/models/user"
)

func MemberHandler(w http.ResponseWriter, r *http.Request) {
	userId := userModel.AddNewUser("prakasa1904", "Technology", time.Now())

	data := []struct {
		Id int
	}{
		{userId},
	}

	jsonInBytes, err := json.Marshal(data)

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonInBytes)
}
