package routes

import (
	usecases "app/pkg/handlers/useCases"

	"github.com/labstack/echo/v4"
)

func Init(e *echo.Echo) {

	e.GET("/register", Register)
}

func Register(e echo.Context) error {

	h := usecases.NewHandler()
	err := h.Auth.Register("user")
	return err
}
