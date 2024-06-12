package usecases

import "app/infrastructure/data"

type Handler struct {
	Auth AuthHandler
}

type AuthHandler interface {
	Register(user string) error
}

type Auth struct {
	Repostiroty data.RepositoryInterface
}

func NewHandler() *Handler {
	return &Handler{
		Auth: &Auth{},
	}
}

func (e Auth) Register(user string) error {
	e.Repostiroty = data.GetProvider()
	e.Repostiroty.Save()
	return nil
}
