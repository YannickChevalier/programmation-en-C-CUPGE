MAKEFILE_STACK:=$(lastword $(MAKEFILE_LIST))
PATH_STACK:=$(abspath $(dir $(firstword $(MAKEFILE_STACK)))) 
FULL_PATH:=$(firstword $(PATH_STACK))

$(info MAKEFILE_STACK:=$(MAKEFILE_STACK))
$(info PATH_STACK:=$(PATH_STACK))
$(info FULL_PATH:=$(FULL_PATH))


include git.mk
include admin.mk







$(eval $(end_Makefile))
