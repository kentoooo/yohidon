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

type category struct {
	Id string `json:"id"`
	Name string `json:"name"`
	ParentId sql.NullString
}

type responseCategoriesJson struct {
	List []responseCategoryJson `json:"categories"`
}

type responseCategoryJson struct {
	Id string `json:"id"`
	Name string `json:"name"`
	Children []responseCategoryJson `json:"children"`
}

func Handler(w http.ResponseWriter, req *http.Request) {
	conn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=require", HOST, USER, PASSWORD, DATABASE)
	db, _ := sql.Open("postgres", conn)
	userId := strings.Split(req.URL.Path, "/")[2]
	sqlStatement := "select category_id, category_name, parent_id from category where user_id = $1;"
	rows, _ := db.Query(sqlStatement, userId)

	var categories []category

	for rows.Next() {
		category := &category{}
		if err := rows.Scan(&category.Id, &category.Name, &category.ParentId); err != nil {
			log.Println(err)
			break
		}
		categories = append(categories, *category)
	}

	response := make([]responseCategoryJson, 0, len(categories))

	for _, x := range categories {
		if !x.ParentId.Valid  {
			response = append(response, responseCategoryJson{x.Id, x.Name, []responseCategoryJson{}})
		}
	}

	for i, x := range response {
		children := make([]responseCategoryJson, 0, len(categories))
		for _, row := range categories {
			if row.ParentId.String == x.Id {
				children = append(children, responseCategoryJson{row.Id, row.Name, []responseCategoryJson{}})
			}
		}
		response[i] = responseCategoryJson{x.Id, x.Name, children}
	}

	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	bytes, _ := json.Marshal(responseCategoriesJson{response})
	fmt.Fprint(w, string(bytes))
}