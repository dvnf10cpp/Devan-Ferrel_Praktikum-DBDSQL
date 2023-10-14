package database

import (
	"database/sql"
	"log"
	"os"
	"strings"

	_ "github.com/go-sql-driver/mysql"
)

var Db *sql.DB 

func InitDB() {
	db, err := sql.Open("mysql", "root:root@tcp(127.0.0.1:3310)/penjualandvd-go")

	if err != nil {
		log.Fatal(err)
	}

	Db = db 
}

func MigrateDB() {
	data, err := os.ReadFile("database/sql/migrate.sql")

	if err != nil {
		log.Fatal(err)
	}

	statements := strings.Split(string(data), ";")

	for _, statement := range statements {
		if _, err := Db.Exec(statement); err != nil {
			log.Printf("Error executing SQL statement : %v\n", err)
		}
	}

	log.Println("SQL DDL Executed Successfully")
}

func SeederDB() {
	data, err := os.ReadFile("database/sql/seeder.sql")

	if err != nil {
		log.Fatal(err)
	}

	statements := strings.Split(string(data), ";")

	for _, statement := range statements {
		if _, err := Db.Exec(statement); err != nil {
			log.Printf("Error executing SQL statement : %v\n", err)	
		}
	}

	log.Println("SQL Seeder Executed Successfully")
}