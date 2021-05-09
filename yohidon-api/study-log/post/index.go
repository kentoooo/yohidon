package post

import (
	"database/sql"
	"encoding/json"
	"fmt"
	_ "github.com/lib/pq"
	"io/ioutil"
	"net/http"
	"os"
	"strings"
)

var (
	HOST     = os.Getenv("YOHIDON_DB_HOST")
	USER     = os.Getenv("YOHIDON_DB_USER")
	DATABASE = os.Getenv("YOHIDON_DB_DATABASE")
	PASSWORD = os.Getenv("YOHIDON_DB_PASSWORD")
)

type Output struct {
	Status int `json:"status"`
}

type Input struct {
	CategoryId string `json:"categoryId"`
	Memo string `json:"memo"`
	Time float32 `json:"time"`
}

func Handler(w http.ResponseWriter, req *http.Request) {
	userId := strings.Split(req.URL.Path, "/")[2]
	body, _ := ioutil.ReadAll(req.Body)

	input := Input{}
	json.Unmarshal(body, &input)

	sqlStatement := "insert into study_log(user_id, category_id, memo, time) values ($1, $2, $3, $4);"

	conn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=require", HOST, USER, PASSWORD, DATABASE)
	db, _ := sql.Open("postgres", conn)
	defer db.Close()
	db.Exec(sqlStatement, userId, input.CategoryId, input.Memo, input.Time)

	w.Header().Set("Content-Type", "application/json")
	d := Output{http.StatusCreated}
	bytes, _ := json.Marshal(d)
	fmt.Fprint(w, string(bytes))
}