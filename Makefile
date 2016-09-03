# You can use make (gen|clean|install|apply).
# Why? Why not.

gen:
	sh ./gen.sh

install:
	sh ./install.sh

apply:
	sh ./apply.sh

.PHONY: clean
clean:
	sh ./clean.sh

