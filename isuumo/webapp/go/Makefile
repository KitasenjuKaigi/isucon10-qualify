all: isuumo

isuumo: *.go
	go build -o isuumo

restart: isuumo
	sudo systemctl restart isuumo.go.service

pprof: restart
	curl -s http://localhost:6060/debug/pprof/profile > cpu.pprof

show-pprof:
	scp isucon-server:/home/isucon/isuumo/webapp/go/cpu.pprof .
	go tool pprof -http localhost:8081 cpu.pprof

.PHONY: restart pprof show-pprof
