PREFIX = /usr/local
JUNC = share/texmf
DESTDIR = ${PREFIX}/${JUNC}/ptex/platex/genkou
JFONTDIR = ${PREFIX}/${JUNC}/fonts/tfm/ptex/genkou
EFONTDIR = ${PREFIX}/${JUNC}/fonts/tfm/misc/genkou
MFDIR = ${PREFIX}/${JUNC}/fonts/source/misc/genkou
DPIDIR = ${PREFIX}/${JUNC}/fonts/pk
VFDIR = ${PREFIX}/${JUNC}/fonts/vf
STYLE = genkou.cls tgenkou.clo ygenkou.clo ribon.clo binsen.clo \
	genkomac.sty genkouid.tex genkin.tex
JTFM = gmin10.tfm gtmin10.tfm
ETFM = gerib10.tfm
MF = gerib10.mf
DPI = 300dpi 360dpi 600dpi 720dpi

install:
	install -d ${DESTDIR}
	install -m 644 ${STYLE} ${DESTDIR}
	install -d ${JFONTDIR}
	install -m 644 ${JTFM} ${JFONTDIR}
	install -d ${EFONTDIR}
	install -m 644 ${ETFM} ${EFONTDIR}
	install -d ${MFDIR}
	install -m 644 ${MF} ${MFDIR}
	install -d ${DPIDIR}
	for DPI_DIR in ${DPI}; do \
	cp -r  $${DPI_DIR} ${DPIDIR}; done
	makejvf gmin10 rml 
	makejvf gtmin10 rmlv
	install -d ${VFDIR}
	install -m 644 *.vf ${VFDIR}
	rm -f rml.tfm rmlv.tfm

uninstall:
	rm -rf ${DESTDIR}
	rm -rf ${JFONTDIR}
	rm -rf ${EFONTDIR}
	rm -rf ${MFDIR}
	rm -rf ${DPIDIR}/*
	rm -rf ${VFDIR}
