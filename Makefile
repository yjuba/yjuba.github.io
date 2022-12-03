.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

TIMESTAMP := $(shell date +%Y%m%d)
MONTH := $(shell date -d "$(date '+%m01') 1 month ago" "+%b" | tr '[:upper:]' '[:lower:]')
monthly: ## 毎月の振り返り
	@hugo new post/$(TIMESTAMP)-lookingi-back-on-$(MONTH).md
