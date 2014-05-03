
doc:
	version=`cat dist.ini  | grep version | cut -f3 -d" "`; \
	dzil build; pod2html --infile=Lingua-Metadata-$$version/lib/Lingua/Metadata.pm > doc.html; \
	echo `pwd`/doc.html

test-full:
	dzil test

test-simple:
	prove -lr t
	
build:
	version=`cat dist.ini  | grep version | cut -f3 -d" "`; \
	date=`date +"%Y-%m-%d"`; \
	for file in bin/*; do \
		sed -ri "s/^Version.*/Version: $$version ($$date)/" $$file; \
	done; \
	rm -rf Lingua-*-$$version*; \
	find . -name '*~' -exec rm {} \; ; \
	dzil build

release: build
	rm -v doc_*; \
	dzil release;
