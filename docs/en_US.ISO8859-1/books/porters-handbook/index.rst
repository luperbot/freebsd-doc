=========================
FreeBSD Porter's Handbook
=========================

.. raw:: html

   <div class="navheader">

FreeBSD Porter's Handbook
?
?
?\ `Next <why-port.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2000-2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Copyright <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <why-port.html>`__
`2. Making a New Port <own-port.html>`__
`3. Quick Porting <quick-porting.html>`__
`3.1. Writing the ``Makefile`` <quick-porting.html#porting-makefile>`__
`3.2. Writing the Description Files <porting-desc.html>`__
`3.3. Creating the Checksum File <porting-checksum.html>`__
`3.4. Testing the Port <porting-testing.html>`__
`3.5. Checking the Port with ``portlint`` <porting-portlint.html>`__
`3.6. Submitting the New Port <porting-submitting.html>`__
`4. Slow Porting <slow-porting.html>`__
`4.1. How Things Work <slow-porting.html#slow-work>`__
`4.2. Getting the Original Sources <slow-sources.html>`__
`4.3. Modifying the Port <slow-modifying.html>`__
`4.4. Patching <slow-patch.html>`__
`4.5. Configuring <slow-configure.html>`__
`4.6. Handling User Input <slow-user-input.html>`__
`5. Configuring the Makefile <makefiles.html>`__
`5.1. The Original Source <makefiles.html#makefile-source>`__
`5.2. Naming <makefile-naming.html>`__
`5.3. Categorization <makefile-categories.html>`__
`5.4. The Distribution Files <makefile-distfiles.html>`__
`5.5. ``MAINTAINER`` <makefile-maintainer.html>`__
`5.6. ``COMMENT`` <makefile-comment.html>`__
`5.7. ``PORTSCOUT`` <makefile-portscout.html>`__
`5.8. Dependencies <makefile-depend.html>`__
`5.9. ``MASTERDIR`` <makefile-masterdir.html>`__
`5.10. Man Pages <makefile-manpages.html>`__
`5.11. Info Files <makefile-info.html>`__
`5.12. Makefile Options <makefile-options.html>`__
`5.13. Specifying the Working Directory <makefile-wrkdir.html>`__
`5.14. Conflict Handling <conflicts.html>`__
`5.15. Installing Files <install.html>`__
`6. Special Considerations <special.html>`__
`6.1. Staging <special.html#staging>`__
`6.2. Bundled Libraries <bundled-libs.html>`__
`6.3. Shared Libraries <porting-shlibs.html>`__
`6.4. Ports with Distribution Restrictions or Legal
Concerns <porting-restrictions.html>`__
`6.5. Building Mechanisms <building.html>`__
`6.6. Using GNU Autotools <using-autotools.html>`__
`6.7. Using GNU ``gettext`` <using-gettext.html>`__
`6.8. Using Perl <using-perl.html>`__
`6.9. Using X11 <using-x11.html>`__
`6.10. Using GNOME <using-gnome.html>`__
`6.11. Using Qt <using-qt.html>`__
`6.12. Using KDE <using-kde.html>`__
`6.13. Using Java <using-java.html>`__
`6.14. Web Applications, Apache and PHP <using-php.html>`__
`6.15. Using Python <using-python.html>`__
`6.16. Using Tcl/Tk <using-tcl.html>`__
`6.17. Using Emacs <using-emacs.html>`__
`6.18. Using Ruby <using-ruby.html>`__
`6.19. Using SDL <using-sdl.html>`__
`6.20. Using wxWidgets <using-wx.html>`__
`6.21. Using Lua <using-lua.html>`__
`6.22. Using ``iconv`` <using-iconv.html>`__
`6.23. Using Xfce <using-xfce.html>`__
`6.24. Using Mozilla <using-mozilla.html>`__
`6.25. Using Databases <using-databases.html>`__
`6.26. Starting and Stopping Services (``rc``
Scripts) <rc-scripts.html>`__
`6.27. Adding Users and Groups <users-and-groups.html>`__
`6.28. Ports That Rely on Kernel
Sources <requiring-kernel-sources.html>`__
`7. Advanced ``pkg-plist`` Practices <plist.html>`__
`7.1. Changing ``pkg-plist`` Based on Make
Variables <plist.html#plist-sub>`__
`7.2. Empty Directories <plist-cleaning.html>`__
`7.3. Configuration Files <plist-config.html>`__
`7.4. Dynamic Versus Static Package List <plist-dynamic.html>`__
`7.5. Automated Package List Creation <plist-autoplist.html>`__
`7.6. Expanding Package List with Keywords <plist-keywords.html>`__
`8. ``pkg-*`` <pkg-files.html>`__
`8.1. ``pkg-message`` <pkg-files.html#porting-message>`__
`8.2. ``pkg-install`` <pkg-install.html>`__
`8.3. ``pkg-deinstall`` <pkg-deinstall.html>`__
`8.4. Changing the Names of ``pkg-*`` <pkg-names.html>`__
`8.5. Making Use of ``SUB_FILES`` and
``SUB_LIST`` <using-sub-files.html>`__
`9. Testing the Port <testing.html>`__
`9.1. Running ``make describe`` <testing.html#make-describe>`__
`9.2. Portlint <testing-portlint.html>`__
`9.3. Port Tools <testing-porttools.html>`__
`9.4. ``PREFIX`` and ``DESTDIR`` <porting-prefix.html>`__
`9.5. Poudriere <testing-poudriere.html>`__
`9.6. Tinderbox <testing-tinderbox.html>`__
`10. Upgrading a Port <port-upgrading.html>`__
`10.1. Using Subversion to Make
Patches <port-upgrading.html#svn-diff>`__
`10.2. ``UPDATING`` and ``MOVED`` <moved-and-updating-files.html>`__
`11. Security <security.html>`__
`11.1. Why Security is So Important <security.html#security-intro>`__
`11.2. Fixing Security Vulnerabilities <security-fix.html>`__
`11.3. Keeping the Community Informed <security-notify.html>`__
`12. Dos and Don'ts <porting-dads.html>`__
`12.1. Introduction <porting-dads.html#dads-intro>`__
`12.2. ``WRKDIR`` <porting-wrkdir.html>`__
`12.3. ``WRKDIRPREFIX`` <porting-wrkdirprefix.html>`__
`12.4. Differentiating Operating Systems and OS
Versions <porting-versions.html>`__
`12.5. Writing Something After
``bsd.port.mk`` <dads-after-port-mk.html>`__
`12.6. Use the ``exec`` Statement in Wrapper
Scripts <dads-sh-exec.html>`__
`12.7. Do Things Rationally <dads-rational.html>`__
`12.8. Respect Both ``CC`` and ``CXX`` <dads-cc.html>`__
`12.9. Respect ``CFLAGS`` <dads-cflags.html>`__
`12.10. Feedback <dads-feedback.html>`__
`12.11. ``README.html`` <dads-readme.html>`__
`12.12. Marking a Port as Architecture
Neutral <dads-arch-neutral.html>`__
`12.13. Marking a Port Not Installable with ``BROKEN``, ``FORBIDDEN``,
or ``IGNORE`` <dads-noinstall.html>`__
`12.14. Marking a Port for Removal with ``DEPRECATED`` or
``EXPIRATION_DATE`` <dads-deprecated.html>`__
`12.15. Avoid Use of the ``.error`` Construct <dads-dot-error.html>`__
`12.16. Usage of ``sysctl`` <dads-sysctl.html>`__
`12.17. Rerolling Distfiles <dads-rerolling-distfiles.html>`__
`12.18. Avoiding Linuxisms <dads-avoiding-linuxisms.html>`__
`12.19. Miscellanea <dads-misc.html>`__
`13. A Sample ``Makefile`` <porting-samplem.html>`__
`14. Keeping Up <keeping-up.html>`__
`14.1. FreshPorts <keeping-up.html#freshports>`__
`14.2. The Web Interface to the Source Repository <svnweb.html>`__
`14.3. The FreeBSD Ports Mailing List <ports-mailing-list.html>`__
`14.4. The FreeBSD Port Building Cluster <build-cluster.html>`__
`14.5. Portscout: the FreeBSD Ports Distfile
Scanner <distfile-survey.html>`__
`14.6. The FreeBSD Ports Monitoring System <portsmon.html>`__
`15. Values of ``USES`` <uses.html>`__
`16. ``__FreeBSD_version`` Values <versions.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

List of Tables

.. raw:: html

   </div>

5.1. `Package Naming Examples <makefile-naming.html#idp64457040>`__
5.2. `Examples of ``DISTVERSION`` and the Derived
``PORTVERSION`` <makefile-distfiles.html#idp67343696>`__
5.3. `Shortcuts for ``MASTER_SITE_*``
Macros <makefile-distfiles.html#makefile-master_sites-shortcut>`__
5.4. `Magic ``MASTER_SITES``
Macros <makefile-distfiles.html#makefile-master_sites-popular>`__
5.5. ```USE_GITHUB``
Description <makefile-distfiles.html#makefile-master_sites-github-description>`__
5.6. ```USE_*`` <makefile-depend.html#makefile-use-vars-table>`__
6.1. `Variables for Ports That Use
``configure`` <building.html#using-configure-variables>`__
6.2. `Variables for Ports That Use
``cmake`` <building.html#using-cmake-variables>`__
6.3. `Variables the Users Can Define for ``cmake``
Builds <building.html#using-cmake-user-variables>`__
6.4. `Variables for Ports That Use
``scons`` <building.html#using-scons-variables>`__
6.5. `Read-Only Variables for Ports That Use
Perl <using-perl.html#using-perl-variables>`__
6.6. `Variables for Ports That Use
X <using-x11.html#using-xorg-variables>`__
6.7. `Variables Provided to Ports That Use
Qt <using-qt.html#using-qt-variables>`__
6.8. `Available Qt Library
Components <using-qt.html#using-qt-library-list>`__
6.9. `Available Qt Tool
Components <using-qt.html#using-qt-tools-list>`__
6.10. `Available Qt Plugin
Components <using-qt.html#using-qt-plugins-list>`__
6.11. `Variables for Ports That Use
``qmake`` <using-qt.html#using-qmake-variables>`__
6.12. `Available KDE 4
Components <using-kde.html#using-kde-components>`__
6.13. `Variables Which May be Set by Ports That Use
Java <using-java.html#using-java-variables>`__
6.14. `Variables Provided to Ports That Use
Java <using-java.html#using-java-variables2>`__
6.15. `Constants Defined for Ports That Use
Java <using-java.html#using-java-constants>`__
6.16. `Variables for Ports That Use
Apache <using-php.html#using-apache-variables>`__
6.17. `Useful Variables for Porting Apache
Modules <using-php.html#using-apache-modules>`__
6.18. `Variables for Ports That Use
PHP <using-php.html#using-php-variables>`__
6.19. `Most Useful Variables for Ports That Use
Python <using-python.html#using-python-variables>`__
6.20. `The Most Useful Read-Only Variables for Ports That Use
Tcl/Tk <using-tcl.html#using-tcl-variables>`__
6.21. `Useful Variables for Ports That Use
Ruby <using-ruby.html#using-ruby-variables>`__
6.22. `Selected Read-Only Variables for Ports That Use
Ruby <using-ruby.html#using-ruby-variables-ro>`__
6.23. `Variables to Select wxWidgets
Versions <using-wx.html#wx-ver-sel-table>`__
6.24. `Available wxWidgets
Versions <using-wx.html#wx-widgets-versions-table>`__
6.25. `wxWidgets Version
Specifications <using-wx.html#wx-widgets-versions-specification>`__
6.26. `Variables to Select Preferred wxWidgets
Versions <using-wx.html#wx-widgets-preferred-version>`__
6.27. `Available wxWidgets
Components <using-wx.html#wx-widgets-components-table>`__
6.28. `Available wxWidgets Dependency
Types <using-wx.html#wx-widgets-dependency-table>`__
6.29. `Default wxWidgets Dependency
Types <using-wx.html#wx-def-dep-types>`__
6.30. `Variables to Select Unicode in wxWidgets
Versions <using-wx.html#wx-unicode-var-table>`__
6.31. `Variables Defined for Ports That Use
wxWidgets <using-wx.html#wx-widgets-variables>`__
6.32. `Legal Values for
``WX_CONF_ARGS`` <using-wx.html#wx-conf-args-values>`__
6.33. `Variables Defined for Ports That Use
Lua <using-lua.html#using-lua-variables-ports>`__
6.34. `Variables for Ports That Use
Mozilla <using-mozilla.html#using-mozilla-variables>`__
6.35. `Variables for Ports Using
Databases <using-databases.html#using-databases-variables>`__
10.1. `Subversion Update File
Prefixes <port-upgrading.html#table-svn-up>`__
15.1. `Values of ``USES`` <uses.html#uses-values-table>`__
16.1. ```__FreeBSD_version``
Values <versions.html#freebsd-versions-table>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

List of Examples

.. raw:: html

   </div>

5.1. `Simple Use of
``USE_GITHUB`` <makefile-distfiles.html#makefile-master_sites-github-ex1>`__
5.2. `More Complete Use of
``USE_GITHUB`` <makefile-distfiles.html#makefile-master_sites-github-ex2>`__
5.3. `Use of ``USE_GITHUB`` with
``DISTVERSIONPREFIX`` <makefile-distfiles.html#makefile-master_sites-github-ex3>`__
5.4. `Use of ``USE_GITHUB`` with Multiple Distribution
Files <makefile-distfiles.html#makefile-master_sites-github-multi>`__
5.5. `Simplified Use of ``MASTER_SITES:n`` with One File Per
Site <makefile-distfiles.html#ports-master-sites-n-example-simple-use-one-file-per-site>`__
5.6. `Simplified Use of ``MASTER_SITES:n`` with More Than One File Per
Site <makefile-distfiles.html#ports-master-sites-n-example-simple-use-more-than-one-file-per-site>`__
5.7. `Detailed Use of ``MASTER_SITES:n`` in
``MASTER_SITE_SUBDIR`` <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-subdir>`__
5.8. `Detailed Use of ``MASTER_SITES:n`` with Comma Operator, Multiple
Files, Multiple Sites and Multiple
Subdirectories <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-complete-example-master-sites>`__
5.9. `Detailed Use of ``MASTER_SITES:n`` with SourceForge
(``SF``) <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-sourceforge>`__
5.10. `Simplified Use of ``MASTER_SITES:n`` with
``PATCH_SITES`` <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-patch-sites>`__
5.11. `Use of
``ALWAYS_KEEP_DISTFILES`` <makefile-distfiles.html#ports-master-sites-n-example-always-keep-distfiles>`__
5.12. `Wrong Declaration of an Optional
Dependency <makefile-depend.html#makefile-automatic-dependencies-bad>`__
5.13. `Correct Declaration of an Optional
Dependency <makefile-depend.html#makefile-automatic-dependencies-good>`__
5.14. `Simple Use of
``OPTIONS`` <makefile-options.html#ports-options-simple-use>`__
5.15. `Check for Unset Port
``OPTIONS`` <makefile-options.html#ports-options-check-unset>`__
5.16. `Practical Use of
``OPTIONS`` <makefile-options.html#ports-options-practical-use>`__
5.17. `Wrong Handling of an
Option <makefile-options.html#makefile-options-auto-activation-bad>`__
5.18. `Correct Handling of an
Option <makefile-options.html#makefile-options-auto-activation-good>`__
6.1. ```USES= cmake`` Example <building.html#using-cmake-example>`__
6.2. `Perl Dependency
Example <using-perl.html#use-perl-dependency-example>`__
6.3. ```USE_XORG`` Example <using-x11.html#use-xorg-example>`__
6.4. `Using X11-Related Variables <using-x11.html#using-x11-vars>`__
6.5. `Selecting Qt 4
Components <using-qt.html#qt4-components-example>`__
6.6. ```USES= qmake`` Example <using-qt.html#using-qmake-example>`__
6.7. ```USE_KDE4`` Example <using-kde.html#kde4-components-example>`__
6.8. `Example Makefile for PEAR Class <using-php.html#pear-makefile>`__
6.9. `Example Makefile for Horde
Module <using-php.html#horde-Makefile>`__
6.10. `Makefile for a Simple Python
Module <using-python.html#python-Makefile>`__
6.11. `Selecting wxWidgets
Components <using-wx.html#wx-components-example>`__
6.12. `Detecting Installed wxWidgets Versions and
Components <using-wx.html#wx-ver-det-example>`__
6.13. `Using wxWidgets Variables in
Commands <using-wx.html#wx-premk-example>`__
6.14. `Simple ``iconv`` Usage <using-iconv.html#iconv-simple-use>`__
6.15. ```iconv`` Usage with
``configure`` <using-iconv.html#iconv-configure-use>`__
6.16. `Fixing Hardcoded
``-liconv`` <using-iconv.html#iconv-reinplace>`__
6.17. `Checking for Native ``iconv``
Availability <using-iconv.html#iconv-conditional>`__
6.18. ```USES=xfce`` Example <using-xfce.html#use-xfce>`__
6.19. `Using Xfce's Own GTK3 Widgets <using-xfce.html#use-xfce-gtk3>`__
7.1. `Example of a ``@dirrmtryecho``
Keyword <plist-keywords.html#plist-keywords-fc-example>`__
7.2. `Real Life Example, How ``@sample`` is
Implemented <plist-keywords.html#plist-keywords-sample-example>`__
9.1. `Using ``make.conf`` to Change Default
Perl <testing-poudriere.html#testing-poudriere-sets-perl>`__
12.1. `How to Avoid Using
``.error`` <dads-dot-error.html#dot-error-breaks-index>`__
15.1. `Typical Use <uses.html#idp71598288>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------+
| ?   | ?   | ?\ `Next <why-port.html>`__   |
+-----+-----+-------------------------------+
| ?   | ?   | ?Chapter?1.?Introduction      |
+-----+-----+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
