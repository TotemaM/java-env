##################################################################################
# This file is under MIT License												 #
# https://mit-license.org/														 #
# 																				 #
# Copyright (c) 2024 Totema														 #
# https://github.com/TotemaM													 #
##################################################################################

SRC_DIR := src
BLD_DIR := build
OUT_DIR := out
TST_DIR := test
SRC_FILES = $(shell find $(SRC_DIR) -type f -name '*.java')
SRC_FILES += $(shell find $(TST_DIR) -type f -name '*.java')

compile:
	@ javac -d $(OUT_DIR) $(SRC_FILES)

run: compile
	@ java -cp $(OUT_DIR) Main $(filter-out $@,$(MAKECMDGOALS))

test: compile
	@ java -cp $(OUT_DIR) test.Main $(filter-out $@,$(MAKECMDGOALS))

# Ignore undifined targets
%:
	@:

.PHONY: clear

clear:
	@ rm -rf $(OUT_DIR)