package models

type Movie struct {
	KodeDVD 	string 		`json:"kode_dvd"`
	Judul		string 		`json:"judul"`
	HargaSewa	float64		`json:"harga_sewa"`
	Denda 		float64 	`json:"denda"`
	TahunRilis	int			`json:"tahun_rilis"`
}