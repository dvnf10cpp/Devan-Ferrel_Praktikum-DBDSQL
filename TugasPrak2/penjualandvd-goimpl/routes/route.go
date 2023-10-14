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

	api := app.Group("/api")
	api.GET("/movie", controllers.GetAllMovies)
	api.GET("/movie/:kode", controllers.GetMovie)
	api.POST("/movie", controllers.InsertMovie)
	api.PATCH("/movie/:kode", controllers.UpdateMovie)
	api.DELETE("/movie/:kode", controllers.DeleteMovie)
}