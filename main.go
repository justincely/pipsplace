package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

// This will be loaded from env later I'm assuming. For now just returns what port is used on localhost.
const HOST = "127.0.0.1"
const PORT = "8080"

var ADDRESS = fmt.Sprintf("%s:%s", HOST, PORT)

func main() {
	fmt.Println("serving on address: ", ADDRESS)
	router := gin.Default()
	router.GET("/health", getHealth)
	http.ListenAndServe(ADDRESS, router)
}

func getHealth(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, gin.H{
		"status": "serving",
	})
}
