all: compile

themes/docbook/theme.toml:
	git submodule update --init --recursive

compile:
	hugo

open:
	xdg-open http://localhost:1313/

runserver: compile
	hugo server -D
