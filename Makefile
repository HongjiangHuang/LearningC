LANGS = go node php
CURRENT_LANG = ''

.PHONY: help
default help:
	@echo "Commands:\n"
	@echo "    g-lang			创建一个语言"
	@echo "    b-lang-docker		构建一个语言docker镜像"
	@echo "    b-lang-docker-all	构建所有语言的docker镜像"


.PHONY: g-lang
g-lang:
	@./script/gen-lang-template.sh

.PHONY: b-lang-docker
b-lang-docker:
	./script/build-lang-docker.sh $(CURRENT_LANG)

.PHONY: b-lang-docker-all
b-lang-docker-all:
	@$(foreach var,$(LANGS),./script/build-lang-docker.sh $(var);)
