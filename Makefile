.PHONY: all clean
.SUFFIXES: .ml .native

SRCS = step0_repl.ml step1_read_print.ml
NATIVES = $(SRCS:%.ml=%.native)
LIBS = re2

all: $(NATIVES)

clean:
	$(RM) -rf _build *.native

.ml.native:
	corebuild -pkg $(LIBS) $@
