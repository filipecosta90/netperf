# Go parameters
GOCMD=GO111MODULE=on go

GOBUILD=$(GOCMD) build
GOINSTALL=$(GOCMD) install
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test -count=1
GOGET=$(GOCMD) get
GOMOD=$(GOCMD) mod
GOFMT=$(GOCMD) fmt

.PHONY: all test coverage
all: test coverage build

get:
	$(GOGET) -t -v .

fmt:
	$(GOFMT) .

test: get fmt
	$(GOTEST) ./.

coverage: get
	$(GOTEST) -race -coverprofile=coverage.txt -covermode=atomic ./.

build: get test
	$(GOBUILD) ./.