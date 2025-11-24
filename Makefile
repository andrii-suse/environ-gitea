SHELL := /bin/bash

test:
	for f in t/environ/*.sh ; do bash -x $$f && continue; echo FAIL: $$f; break; done

test_container:
	( cd t/environ; for f in *.sh; do echo starting $$f; ./$$f && continue; echo FAIL $$f; break; done )

install:
	install -d -m 0755 "${DESTDIR}"/usr/share/environ.d/gt
	install -m 0644 port_base.cnf "${DESTDIR}"/usr/share/environ.d/gt/port_base.cnf ;\
	for d in common local source; do \
		test -d $$d || continue ;\
		mkdir -p "${DESTDIR}"/usr/share/environ.d/gt/$$d ;\
		for f in $$d/*.{m4,cnf,txt} ; do \
			test -f $$f && install -m 0644 $$f "${DESTDIR}"/usr/share/environ.d/gt/$$f ;\
		done ;\
		for dd in $$d/* ; do \
			test -d $$dd || continue ;\
			for f in $$dd/*.m4 ; do \
				test -f $$f || continue ;\
				mkdir -p "${DESTDIR}"/usr/share/environ.d/gt/$$dd ;\
				install -m 0644 $$f "${DESTDIR}"/usr/share/environ.d/gt/$$f ;\
			done \
		done ;\
		for dd in $$d/* ; do \
			test -L $$dd || continue ;\
			l=$$(basename $$dd) ; \
			( cd "${DESTDIR}"/usr/share/environ.d/gt/$$d; ln -sf ../../$$l/local/ $$l ) ; \
		done \
	done
