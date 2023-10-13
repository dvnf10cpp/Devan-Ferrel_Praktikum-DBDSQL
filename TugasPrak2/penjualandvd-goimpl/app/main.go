package main

import (
	"github.com/gin-gonic/gin"
	"penjualandvd-goimpl/database"
	"penjualandvd-goimpl/routes"
)

func main() {
	database.InitDB()
	database.MigrateDB()
	defer database.Db.Close()

	app := gin.Default()
	routes.InitRoute(app)

	app.Run(":5030")
}