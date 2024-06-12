package server

import "github.com/labstack/echo/v4"

type Server struct {
}

func NewServer() {
	e := echo.New()

	e.Logger.Fatal(e.Start(":8080"))
}
