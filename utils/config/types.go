package config

type Config struct {
	Environment string
	Database    struct {
		Host     string
		Port     int
		Username string
		Password string
		Db       string
	}
}
