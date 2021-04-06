package health

import (
	"encoding/json"
	"fmt"
	"net/http"
)

type ResHealth struct {
	Status int `json:"status"`
}

func Handler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	d := ResHealth{http.StatusOK}
	bytes, _ := json.Marshal(d)
	fmt.Fprintf(w, string(bytes))
}
