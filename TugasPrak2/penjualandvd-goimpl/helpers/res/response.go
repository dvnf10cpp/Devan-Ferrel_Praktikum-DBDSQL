package res

type Response struct {
	Message 	string		`json:"message"`
	Code 		int 		`json:"code"`
	Data		interface{}	`json:"data,omitempty"`
}