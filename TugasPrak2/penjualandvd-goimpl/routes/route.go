package routes  

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"penjualandvd-goimpl/controllers"
)

func InitRoute(app *gin.Engine) {

	app.GET("/", func (ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H {
			"message": "OK! Server is running",
		})
	})

	app.POST("/insert/movie", controllers.InsertMovie)
	app.PATCH("/update/movie/:kode", controllers.UpdateMovie)
	app.DELETE("/remove/movie/:kode", controllers.DeleteMovie)
	
}