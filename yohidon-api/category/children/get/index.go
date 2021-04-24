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
	categoryId := strings.Split(req.URL.Path, "/")[2]
	sqlStatement := "select category_id, category_name from category where parent_id = $1;"
	rows, _ := db.Query(sqlStatement, categoryId)

	categories := make([]category,0)

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