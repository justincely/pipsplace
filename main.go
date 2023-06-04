package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

// This will be loaded from env later I'm assuming. For now just returns what port is used on localhost.
const PORT string = ":8080"

func main() {
	fmt.Println("serving on port: ", PORT)
	router := gin.Default()
	router.GET("/health", getHealth)
	http.ListenAndServe(PORT, router)
}

func getHealth(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, gin.H{
		"status": 200, "serving": PORT,
	})
}
