################################################################################
##                                                                       GENERAL
################################################################################

PROJECT = example

PWD       = ${shell pwd}
TEMP      = ${PWD}/temp


all: ${PROJECT}.pdf

view: ${PROJECT}.pdf
	(zathura $(PROJECT).pdf &)

clean:
	rm -rf ${TEMP}
	if [ -f ${PROJECT}.pdf ] ; then rm ${PROJECT}.pdf ; fi;



TEX_INTRPR = xelatex
TEX_FLAGS  = -halt-on-error -file-line-error -output-directory ${TEMP}
TEX_FILES = $(shell find . -name '*.tex' -or -name '*.sty' -or -name '*.cls')


${TEMP}:
	mkdir -p ${TEMP}

${TEMP}/$(PROJECT).aux: $(TEX_FILES) | ${TEMP}
	${TEX_INTRPR} $(TEX_FLAGS) $(PROJECT)

${TEMP}/$(PROJECT).pdf: ${TEMP}/$(PROJECT).aux
	${TEX_INTRPR} $(TEX_FLAGS) $(PROJECT)

${PROJECT}.pdf: ${TEMP}/$(PROJECT).pdf
	cp ${TEMP}/${PROJECT}.pdf ${PWD}
