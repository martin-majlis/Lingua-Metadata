
doc:
	version=`cat dist.ini  | grep version | cut -f3 -d" "`; \
	dzil build; pod2html --infile=Lingua-Metadata-$$version/lib/Lingua/Metadata.pm > doc.html; \
	echo `pwd`/doc.html
