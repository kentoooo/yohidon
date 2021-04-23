package category

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"github.com/google/uuid"
	_ "github.com/lib/pq"
	"strings"
)


var (
	HOST     = os.Getenv("YOHIDON_DB_HOST")
	USER     = os.Getenv("YOHIDON_DB_USER")
	DATABASE = os.Getenv("YOHIDON_DB_DATABASE")
	PASSWORD = os.Getenv("YOHIDON_DB_PASSWORD")
)

type Input struct {
	CategoryName string  `json:"categoryName"`
}

type Output struct {
	Status int `json:"status"`
}


func Handler(w http.ResponseWriter, req *http.Request) {

	userId := strings.Split(req.URL.Path, "/")[2]
	body, _ :=ioutil.ReadAll(req.Body)
	uuid, _ := uuid.NewRandom()

	input := Input{}
	json.Unmarshal(body, &input)

	conn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=require", HOST, USER, PASSWORD, DATABASE)
	db, err := sql.Open("postgres", conn)
	if err != nil {
		fmt.Println(err)
	}

	sql_statement := "insert into category(user_id, category_id, category_name) values($1, $2, $3);"
	db.Exec(sql_statement, userId, uuid, input.CategoryName)

	w.Header().Set("Content-Type", "application/json")
	d := Output{http.StatusCreated}
	bytes, _ := json.Marshal(d)
	fmt.Fprintf(w, string(bytes))
}