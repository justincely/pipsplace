package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
)

func main() {
	viper.SetConfigFile("config.yaml")
	err := viper.ReadInConfig()
	if err != nil {
		fmt.Println("Fatal error config file: dafault\n", err)
		os.Exit(1)
	}

	address := viper.GetString("server.host") + ":" + viper.GetString("server.port")

	fmt.Println("serving on address: ", address)
	router := gin.Default()
	router.LoadHTMLFiles("front-end/basic-home.html")

	router.GET("/health", getHealth)
	router.GET("/", getHomepage)

	http.ListenAndServe(address, router)
}

func getHealth(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, gin.H{
		"status": "serving",
	})
}

func getHomepage(c *gin.Context) {
	c.HTML(http.StatusOK, "basic-home.html", gin.H{
		"title": "Main website",
	})
}
