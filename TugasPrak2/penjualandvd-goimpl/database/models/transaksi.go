package models

import "time"

type Transaksi struct {
	KodeDVD 					string 		`json:"kode_dvd"`
    KodePelanggan 				string 		`json:"kode_pelanggan"`
    TanggalSewa 				time.Time   `json:"tanggal_sewa"` 		
    TanggalWajibKembali			time.Time   `json:"tanggal_wajib_kembali"` 	
    TanggalRealisasiKembali 	time.Time   `json:"tanggal_realisasi_kembali"`
}