$(eval $(begin_Makefile))

TARGET_DIR:=Cours/L2-Developpement-C
$(TARGET_DIR)/DIR_SUBMODULES:=Thèmes/enonces Thèmes/solutions
$(TARGET_DIR)/SUBDIRS:=
$(TARGET_DIR)/TITRE:=Développement C
$(TARGET_DIR)/WEB_TEST:=/export/longview/public_html
$(TARGET_DIR)/WEB_DEPLOY:=ychevali@bali.irit.fr:~/public_html
$(TARGET_DIR)/START_PAGE:=main.html
OTHER_WEB_FILES:=
$(TARGET_DIR)/WEB_FILES:=$(OTHER_WEB_FILES) \
		$(FULL_PATH)/$($(TARGET_DIR)/START_PAGE) \
		$(FULL_PATH)/config.js $(FULL_PATH)/index.html

$(eval $(end_Makefile))
