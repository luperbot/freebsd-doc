# bsd.web.mk
# $FreeBSD: www/share/mk/web.site.mk,v 1.34 2000/10/04 09:39:46 kuriyama Exp $

#
# Build and install a web site.
#
# Basic targets:
#
# all (default) -- performs batch mode processing necessary
# install -- Installs everything
# clean -- remove anything generated by processing
#

.if exists(${.CURDIR}/../Makefile.inc)
.include "${.CURDIR}/../Makefile.inc"
.endif

WEBDIR?=	${.CURDIR:T}
CGIDIR?=	${.CURDIR:T}
DESTDIR?=	${HOME}/public_html

WEBOWN?=	${USER}
WEBGRP?=	www
WEBMODE?=	664

CGIOWN?=	${USER}
CGIGRP?=	www
CGIMODE?=	775

PERL?=		perl5

#
# Install dirs derived from the above.
#
DOCINSTALLDIR=	${DESTDIR}${WEBBASE}/${WEBDIR}
CGIINSTALLDIR=	${DESTDIR}${WEBBASE}/${CGIDIR}

#
# The orphan list contains sources specified in DOCS that there
# is no transform rule for.  We start out with all of them, and
# each rule below removes the ones it knows about.  If any are
# left over at the end, the user is warned about them.
#
ORPHANS:=	${DOCS}

COPY=	-C

#
# Where the ports live, if CVS isn't used (ie. NOPORTSCVS is defined)
#
PORTSBASE?=	/usr

##################################################################
# Transformation rules

###
# file.sgml --> file.revinc
#
# Generate temporary file for translation revision checking
.SUFFIXES:	.sgml .revinc
GENDOCS+=	${REVFILES}
.sgml.revinc:
	if [ -f ${BUILDTOP}/en/${DIR_IN_LOCAL}/${.IMPSRC} ]; then \
	  ${BUILDTOP}/ja/revcheck ${BUILDTOP} ${DIR_IN_LOCAL} ${.IMPSRC} > ${.TARGET}; \
	else \
	  touch ${.TARGET}; \
	fi

###
# file.sgml --> file.html
#
# Runs file.sgml through spam to validate and expand some entity
# references are expanded.  file.html is added to the list of
# things to install.

.SUFFIXES:	.html
.if defined(REVCHECK)
PREHTML=	${WEB_PREFIX}/ja/prehtml
PREHTMLFLAGS=	${PREHTMLOPTS}
CANONPREFIX0!=	cd ${WEB_PREFIX}; echo $${PWD};
CANONPREFIX=	${PWD:S/^${CANONPREFIX0}//:S/^\///}
LOCALTOP!=	echo ${CANONPREFIX} | perl -pe 's@[^/]+@..@g; $$_.="/." if($$_ eq".."); s@^\.\./@@;'
DIR_IN_LOCAL!=	echo ${CANONPREFIX} | perl -pe 's@^[^/]+/?@@;'
PREHTMLFLAGS+=	-revcheck "${LOCALTOP}" "${DIR_IN_LOCAL}"
.else
DATESUBST=	's/<!ENTITY date[ \t]*"$$Free[B]SD. .* \(.* .*\) .* .* $$">/<!ENTITY date	"Last modified: \1">/'
PREHTML=	sed -e ${DATESUBST}
.endif
.if !defined(OPENJADE)
SGMLNORM=	sgmlnorm
.else
SGMLNORM=	osgmlnorm
.endif
PREFIX?=	/usr/local
CATALOG?=	${PREFIX}/share/sgml/html/catalog
SGMLNORMFLAGS=	-d ${SGMLNORMOPTS} -c ${CATALOG} -D ${.CURDIR}
GENDOCS+=	${DOCS:M*.sgml:S/.sgml$/.html/g}
ORPHANS:=	${ORPHANS:N*.sgml}

.sgml.html:
	(${PREHTML} ${PREHTMLFLAGS} ${.IMPSRC} |\
	SGML_CATALOG_FILES='' ${SGMLNORM} ${SGMLNORMFLAGS} > ${.TARGET})\
	|| (rm -f ${.TARGET} && false)

###
# file.docb --> file.html
#
# Generate HTML from docbook

.SUFFIXES:	.docb
GENDOCS+=	${DOCS:M*.docb:S/.docb$/.html/g}
ORPHANS:=	${ORPHANS:N*.docb}

.docb.html:
	sgmlfmt -d docbook -f html ${SGMLOPTS} ${.IMPSRC}


##################################################################
# Targets

#
# If no target is specified, .MAIN is made
#
.MAIN: all

#
# Build most everything
#
all: ${COOKIE} orphans ${GENDOCS} ${DATA} ${LOCAL} ${CGI} _PROGSUBDIR

#
# Warn about anything in DOCS that has no translation
#
.if !empty(ORPHANS)
orphans:
	@echo Warning!  I don\'t know what to do with: ${ORPHANS}
.else
orphans:
.endif

#
# Clean things up
#
.if !target(clean)
clean: _PROGSUBDIR
.if defined(DIRS_TO_CLEAN) && !empty(DIRS_TO_CLEAN)
.for dir in ${DIRS_TO_CLEAN}
	(cd ${.CURDIR}/${dir} && ${MAKE} clean)
.endfor
.endif
	rm -f Errs errs mklog ${GENDOCS} ${LOCAL} ${CLEANFILES}
.endif

#
# Really clean things up
#
.if !target(cleandir)
cleandir: clean _PROGSUBDIR
	rm -f ${.CURDIR}/tags .depend
	cd ${.CURDIR}; rm -rf obj;
.endif

#
# Install targets: before, real, and after.
#
.if !target(install)
.if !target(beforeinstall)
beforeinstall:
.endif
.if !target(afterinstall)
afterinstall:
.endif

_ALLINSTALL+=	${GENDOCS} ${DATA} ${LOCAL}

realinstall: ${COOKIE} ${GENDOCS} ${DATA} ${LOCAL} ${CGI} _PROGSUBDIR
.if !empty(_ALLINSTALL)
	@mkdir -p ${DOCINSTALLDIR}
	for entry in ${_ALLINSTALL}; do \
		${INSTALL} ${COPY} -o ${WEBOWN} -g ${WEBGRP} -m ${WEBMODE} \
			${INSTALLFLAGS} $${entry} ${DOCINSTALLDIR}; \
	done
.if defined(INDEXLINK) && !empty(INDEXLINK)
	(cd ${DOCINSTALLDIR}; ln -s -f ${INDEXLINK} index.html)
.endif
.endif
.if defined(CGI) && !empty(CGI)
	@mkdir -p ${CGIINSTALLDIR}
	for entry in ${CGI}; do \
		${INSTALL} ${COPY} -o ${CGIOWN} -g ${CGIGRP} -m ${CGIMODE} \
			${INSTALLFLAGS} $${entry} ${CGIINSTALLDIR}; \
	done
.endif
.if defined(DOCSUBDIR) && !empty(DOCSUBDIR)
	for entry in ${DOCSUBDIR}; do \
		mkdir -p ${DOCINSTALLDIR}/$$entry; \
	done
.endif

# Set up install dependencies so they happen in the correct order.
install: afterinstall
afterinstall: realinstall2
realinstall: beforeinstall
realinstall2: realinstall
.endif 

#
# This recursively calls make in subdirectories.
#
#SUBDIR+=${DOCSUBDIR}
_PROGSUBDIR: .USE
.if defined(SUBDIR) && !empty(SUBDIR)
	@for entry in ${SUBDIR}; do \
		(${ECHODIR} "===> ${DIRPRFX}$$entry"; \
		cd ${.CURDIR}/$${entry} && \
		${MAKE} ${.TARGET:S/realinstall/install/:S/.depend/depend/} DIRPRFX=${DIRPRFX}$$entry/); \
	done
.endif
.if defined(DOCSUBDIR) && !empty(DOCSUBDIR)
	@for entry in ${DOCSUBDIR}; do \
		(${ECHODIR} "===> ${DIRPRFX}$$entry"; \
		cd ${.CURDIR}/$${entry} && \
		if [ ${WEBDIR} = "data" -a $$entry = "handbook" -o $$entry = "docproj-primer" ]; then \
			${MAKE} ${.TARGET:S/realinstall/install/:S/.depend/depend/} DIRPRFX=${DIRPRFX}$$entry/ ${PARAMS} FORMATS="txt html html-split"; \
		elif [ $$entry = "handbook" -a ${WEBDIR} = "data/ja" ]; then \
			${MAKE} ${.TARGET:S/realinstall/install/:S/.depend/depend/} DIRPRFX=${DIRPRFX}$$entry/ ${PARAMS} FORMATS="html html-split"; \
		else \
			${MAKE} ${.TARGET:S/realinstall/install/:S/.depend/depend/} DIRPRFX=${DIRPRFX}$$entry/ ${PARAMS}; \
		fi); \
	done
.endif


#
# cruft for generating linuxdoc stuff
#

.if defined (DOCSUBDIR) && !empty(DOCSUBDIR)

FORMATS?=	"html ps latin1 ascii"
PARAMS=		DESTDIR=${DESTDIR} DOCDIR=${WEBBASE}/${WEBDIR}
PARAMS+=	DOCOWN=${WEBOWN} DOCGRP=${WEBGRP}
PARAMS+=	FORMATS=${FORMATS} COPY="${COPY}"
PARAMS+=	SGMLOPTS="${SGMLOPTS}"

.endif

.include <bsd.obj.mk>
# THE END
