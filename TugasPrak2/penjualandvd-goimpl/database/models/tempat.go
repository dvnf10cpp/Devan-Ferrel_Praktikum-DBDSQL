package models  

type Kecamatan struct {
	IDKecamatan		int32		`json:"id_kecamatan"`
	Kecamatan 		string 		`json:"kecamatan"`
}

type Kelurahan struct {
	IDKelurahan		int32		`json:"id_kelurahan"`
	IDKecamatan		int32		`json:"id_kecamatan"`
	Kelurahan 		string 		`json:"kelurahan"`
}