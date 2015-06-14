OCBFLAGS := -use-ocamlfind \
	-syntax camlp4o \
	-pkg core \
	-pkg sexplib.syntax,comparelib.syntax,fieldslib.syntax,variantslib.syntax \
	-pkg bin_prot.syntax \
	-pkg re2 \
	-tag thread \
	-tag debug \
	-tag bin_annot \
	-tag short_paths \
	-cflags "-w A-4-33-40-41-42-43-34-44" \
	-cflags -strict-sequence \

OCB := ocamlbuild $(OCBFLAGS)
target := step2_eval

.PHONY: all debug clean top
all: $(target).cmxa $(target).native
debug: all $(target).cma

%.cma:
	$(OCB) $@
%.cmxa:
	$(OCB) $@
%.native:
	$(OCB) $@

clean:
	$(OCB) -clean
	$(RM) src/version.ml*

top: debug
	ocaml
