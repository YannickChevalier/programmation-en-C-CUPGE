.PHONY: push pull commit/%

REMOTE_NAME:=github

commit/%:
	git add . && git commit -am "$*"

push:
	git push $(REMOTE_NAME) master

pull:
	git pull $(REMOTE_NAME) master

