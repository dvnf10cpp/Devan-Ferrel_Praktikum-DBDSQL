package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"penjualandvd-goimpl/database"
	"penjualandvd-goimpl/database/models"
	"penjualandvd-goimpl/helpers/res"
)

func GetAllMovies(ctx *gin.Context) {
	rows, err := database.Db.Query("SELECT * FROM movie");

	if err != nil {
		ctx.JSON(http.StatusInternalServerError, res.Response{
			Message: "internal server error", 
			Code: http.StatusInternalServerError,
			Data: err.Error(),
		})
		return
	}

	var movies []models.Movie

	for rows.Next() {
		var movie models.Movie

		if err := rows.Scan(
			&movie.KodeDVD, &movie.Judul, 
			&movie.HargaSewa, &movie.Denda,
			&movie.TahunRilis); err != nil {
				ctx.JSON(http.StatusInternalServerError, res.Response{
					Message: "internal server error", 
					Code: http.StatusInternalServerError,
					Data: err.Error(),
				})
				return
			}

			movies = append(movies, movie)
	}

	ctx.JSON(http.StatusOK, res.Response{
		Message: "successfully fetch movies",
		Code: http.StatusOK,
		Data: movies,
	})
}

func GetMovie(ctx *gin.Context) {
	kodeDvd := ctx.Param("kode")

	var movie models.Movie 

	if err := database.Db.QueryRow("SELECT * FROM movie WHERE kode_dvd = ?", kodeDvd). 
		Scan(&movie.KodeDVD, &movie.Judul, &movie.HargaSewa, &movie.Denda, &movie.TahunRilis);
		err != nil {
			ctx.JSON(http.StatusInternalServerError, res.Response{
				Message: "internal server error", 
				Code: http.StatusInternalServerError,
				Data: err.Error(),
			})
			return	

		}
	
	ctx.JSON(http.StatusOK, res.Response {
		Message: "successfully fetch movie",
		Code: http.StatusOK,
		Data: movie,
	})

}

func InsertMovie(ctx *gin.Context) {
	var movie models.Movie

	if err := ctx.ShouldBindJSON(&movie); err != nil {
		ctx.JSON(http.StatusBadRequest, res.Response{
			Message: "bad request", 
			Code: http.StatusBadRequest,
			Data: err.Error(),
		})
		return 
	}

	if _, err := database.Db.Exec(
		"INSERT INTO movie VALUES (?, ?, ?, ?, ?)",
		movie.KodeDVD, movie.Judul, movie.HargaSewa, movie.Denda, movie.TahunRilis, 
	); err != nil {
		ctx.JSON(http.StatusInternalServerError, res.Response{
			Message: "internal server error", 
			Code: http.StatusInternalServerError,
			Data: err.Error(),
		})
		return
	}

	ctx.JSON(http.StatusCreated, res.Response{
		Message: "successfully insert movie ", 
		Code: http.StatusCreated,
		Data: movie,
	})
}

func UpdateMovie(ctx *gin.Context) {
	kodeDvd := ctx.Param("kode")
	var movie models.Movie 

	if err := ctx.ShouldBindJSON(&movie); err != nil {
		ctx.JSON(http.StatusBadRequest, res.Response{
			Message: "bad request", 
			Code: http.StatusBadRequest,
			Data: err.Error(),
		})
		return 
	}

	if _, err := database.Db.Exec(
		"UPDATE movie SET judul = ?, harga_sewa = ?, denda= ?, tahun_rilis = ? WHERE kode_dvd = ?",
		movie.Judul, movie.HargaSewa, movie.Denda, movie.TahunRilis, kodeDvd,
	); err != nil {
		ctx.JSON(http.StatusInternalServerError, res.Response{
			Message: "internal server error", 
			Code: http.StatusInternalServerError,
			Data: err.Error(),
		})
		return
	}	

	ctx.JSON(http.StatusCreated, res.Response{
		Message: "successfully update movie ", 
		Code: http.StatusOK,
	})
}

func DeleteMovie(ctx *gin.Context) {
	kodeDvd := ctx.Param("kode")

	if _, err := database.Db.Exec("DELETE FROM movie WHERE kode_dvd = ?", kodeDvd); err != nil {
		ctx.JSON(http.StatusInternalServerError, res.Response{
			Message: "internal server error", 
			Code: http.StatusInternalServerError,
			Data: err.Error(),
		})
		return
	}

	ctx.JSON(http.StatusCreated, res.Response{
		Message: "successfully delete movie", 
		Code: http.StatusCreated,
		Data: nil,
	})
}