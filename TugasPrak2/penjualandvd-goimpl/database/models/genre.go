package models

type Genre struct {
	IDGenre 	int32 		`json:"id_genre"`
	Genre 		string 		`json:"genre"`
}

type GenreMovie struct {
	IDGenre 	int32 		`json:"id_genre"`
	Genre 		string 		`json:"genre"`
}