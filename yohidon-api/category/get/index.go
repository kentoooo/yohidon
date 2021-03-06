package get

import (
	"database/sql"
	"encoding/json"
	"fmt"
	_ "github.com/lib/pq"
	"log"
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

type Categories struct {
	List []category `json:"categories"`
}

type category struct {
	Id string `json:"id"`
	Name string `json:"name"`
}

func Handler(w http.ResponseWriter, req *http.Request) {
	conn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=require", HOST, USER, PASSWORD, DATABASE)
	db, _ := sql.Open("postgres", conn)
	defer db.Close()
	userId := strings.Split(req.URL.Path, "/")[2]
	sqlStatement := "select category_id, category_name from category where user_id = $1 and parent_id is null;"
	rows, _ := db.Query(sqlStatement, userId)

	var categories []category

	for rows.Next() {
		category := &category{}
		if err := rows.Scan(&category.Id, &category.Name); err != nil {
			log.Println(err)
			break
		}
		categories = append(categories, *category)
	}

	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	bytes, _ := json.Marshal(Categories{categories})
	fmt.Fprint(w, string(bytes))
}