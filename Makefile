lib := lib
tlkt := toolkit
checkdir := test

.PHONY : all clean check $(tlkt) $(lib) $(checkdir)

$(tlkt) :

all : $(lib) $(tlkt) $(checkdir)

$(tlkt) $(checkdir) : $(lib)
	@$(MAKE) -C $@ all

$(lib) :
	@$(MAKE) -C $@ all

clean :
	@for d in $(lib) $(tlkt) $(checkdir); \
		do \
		$(MAKE) -C $$d clean; \
		done

check : $(checkdir)
	@./test/run_check
