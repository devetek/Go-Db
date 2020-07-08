package config

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/lib/pq"
	"gopkg.in/gcfg.v1"
)

var db *sql.DB

func Init() *Config {
	var cfg Config

	cfgEnv := os.Getenv("TPENV")

	if cfgEnv == "" {
		log.Println("[GoDb][config] No environment set. Using 'Development'.")
		cfgEnv = "development"
	}

	file := fmt.Sprintf("./config/%s.ini", cfgEnv)
	if _, fileError := os.Stat(file); os.IsNotExist(fileError) {
		log.Fatalf("[GoDb][config] %+v \n", fileError)
	}

	errCnf := gcfg.ReadFileInto(&cfg, file)
	if errCnf != nil {
		log.Printf("[GoDb][config] Cannot load config %s\n", cfgEnv)
		log.Fatalf("[GoDb][config] %+v \n", errCnf)
	}

	return &cfg
}
