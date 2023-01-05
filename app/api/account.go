package api

import (
	"WeddingBackEnd/database/repository"
	"net/http"

	"github.com/julienschmidt/httprouter"
)

type AccountHandler struct {
	AccountRepository repository.AccountRepository
}

func (h *AccountHandler) GetAll(w http.ResponseWriter, r *http.Request, p httprouter.Params) {

}
