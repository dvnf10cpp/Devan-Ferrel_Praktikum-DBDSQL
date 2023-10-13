package models  

type Pelanggan struct {
	KodePelanggan		string 		`json:"kode_pelanggan"`
	IDKelurahan			int32		`json:"id_kelurahan"`
	Nama				string		`json:"nama"`
	Alamat				string 		`json:"alamat"`
	JenisKelamin		rune		`json:"jenis_kelamin"`
}

type KontakPelanggan struct {
	KodePelanggan 		string 		`json:"kode_pelanggan"`
	NoHP				string		`json:"no_hp"`
}