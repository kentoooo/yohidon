package get

import (
	"database/sql"
	"encoding/json"
	"fmt"
	_ "github.com/lib/pq"
	"log"
	"net/http"
	"os"
	"time"
)

var (
	HOST     = os.Getenv("YOHIDON_DB_HOST")
	USER     = os.Getenv("YOHIDON_DB_USER")
	DATABASE = os.Getenv("YOHIDON_DB_DATABASE")
	PASSWORD = os.Getenv("YOHIDON_DB_PASSWORD")
)

type Activities struct {
	List []activity `json:"activities"`
}

type activity struct {
	UserId       string    `json:"userId"`
	UserName     string    `json:"userName"`
	CategoryId   string    `json:"categoryId"`
	CategoryName string    `json:"categoryName"`
	StudyTime    float32   `json:"studyTime"`
	Created      time.Time `json:"created"`
}

func Handler(w http.ResponseWriter, req *http.Request) {
	conn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=require", HOST, USER, PASSWORD, DATABASE)
	db, _ := sql.Open("postgres", conn)
	sqlStatement := "select u.user_id, u.user_name, c.category_id, s.time, s.created, c.category_name from users u left join study_log s on u.user_id = s.user_id left join category c on c.category_id = s.category_id order by s.created desc limit 20;"
	rows, _ := db.Query(sqlStatement)

	var activities []activity

	for rows.Next() {
		activity := &activity{}
		if err := rows.Scan(&activity.UserId, &activity.UserName, &activity.CategoryId, &activity.StudyTime, &activity.Created, &activity.CategoryName); err != nil {
			log.Println(err)
			break
		}
		activities = append(activities, *activity)
	}

	w.Header().Set("Content-Type", "application/json")
	bytes, _ := json.Marshal(Activities{activities})
	fmt.Fprint(w, string(bytes))
}