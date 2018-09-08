GOPATH := ${PWD}
export GOPATH
GO=/home/isucon/local/go/bin/go

build:
	${GO} build -v isubata
	sudo systemctl restart isubata.golang.service
vet:
	${GO} vet ./src/isubata/...
