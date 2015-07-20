===========================
Das FreeBSD Porter-Handbuch
===========================

.. raw:: html

   <div class="navheader">

Das FreeBSD Porter-Handbuch
?
?
?\ `Weiter <why-port.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="de" lang="de">

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

The FreeBSD German Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2000-2015 The FreeBSD German Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am April 2000 von .

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

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Einf?hrung <why-port.html>`__
`2. Einen neuen Port erstellen <own-port.html>`__
`3. Einen neuen Port erstellen <quick-porting.html>`__
`3.1. Das ``Makefile``
schreiben <quick-porting.html#porting-makefile>`__
`3.2. Die Beschreibungsdateien erstellen <porting-desc.html>`__
`3.3. Die Checksummendatei erzeugen <porting-checksum.html>`__
`3.4. Den Port testen <porting-testing.html>`__
`3.5. Ihren Port mit ``portlint`` ?berpr?fen <porting-portlint.html>`__
`3.6. Den neuen Port einreichen <porting-submitting.html>`__
`4. Einen Port in aller Ruhe erstellen <slow.html>`__
`4.1. Die Funktionsweise <slow.html#slow-work>`__
`4.2. Den originalen Quelltext besorgen <slow-sources.html>`__
`4.3. Den Port bearbeiten <slow-modifying.html>`__
`4.4. Fehlerbehebung (Patches) <slow-patch.html>`__
`4.5. Konfigurieren <slow-configure.html>`__
`4.6. Handhabung von Benutzereingaben <slow-user-input.html>`__
`5. Die Konfiguration des Makefile <makefile.html>`__
`5.1. Der originale Quelltext <makefile.html#makefile-source>`__
`5.2. Bezeichnungen <makefile-naming.html>`__
`5.3. Kategorisierung <makefile-categories.html>`__
`5.4. Die Distributionsdateien <makefile-distfiles.html>`__
`5.5. ``MAINTAINER`` <makefile-maintainer.html>`__
`5.6. ``COMMENT`` <makefile-comment.html>`__
`5.7. Abh?ngigkeiten (dependencies) <makefile-depend.html>`__
`5.8. ``MASTERDIR`` <makefile-masterdir.html>`__
`5.9. Manualpages <makefile-manpages.html>`__
`5.10. Info-Dateien <makefile-info.html>`__
`5.11. Makefile-Optionen <makefile-options.html>`__
`5.12. Die Festlegung des
Arbeitsverzeichnisses <makefile-wrkdir.html>`__
`5.13. Konfliktbehandlung <conflicts.html>`__
`5.14. Installation von Dateien <install.html>`__
`6. Besonderheiten <special.html>`__
`6.1. Shared-Libraries <special.html#porting-shlibs>`__
`6.2. Ports mit beschr?nkter Verbreitung <porting-restrictions.html>`__
`6.3. Build-Mechanismen <building.html>`__
`6.4. Benutzung von GNU autotools <using-autotools.html>`__
`6.5. Benutzung von GNU ``gettext`` <using-gettext.html>`__
`6.6. Die Benutzung von ``perl`` <using-perl.html>`__
`6.7. Benutzung von X11 <using-x11.html>`__
`6.8. Benutzung von GNOME <using-gnome.html>`__
`6.9. Benutzung von Qt <using-qt.html>`__
`6.10. Benutzung von KDE <using-kde.html>`__
`6.11. Benutzung von Java <using-java.html>`__
`6.12. Webanwendungen, Apache und PHP <using-php.html>`__
`6.13. Python benutzen <using-python.html>`__
`6.14. Benutzung von Tcl/Tk <using-tcl.html>`__
`6.15. Emacs benutzen <using-emacs.html>`__
`6.16. Ruby benutzen <using-ruby.html>`__
`6.17. SDL verwenden <using-sdl.html>`__
`6.18. wxWidgets verwenden <using-wx.html>`__
`6.19. Verwendung von Lua <using-lua.html>`__
`6.20. Xfce verwenden <using-xfce.html>`__
`6.21. Mozilla verwenden <using-mozilla.html>`__
`6.22. Benutzung von Datenbanken <using-databases.html>`__
`6.23. Starten und Anhalten von Diensten (rc
Skripten) <rc-scripts.html>`__
`6.24. Hinzuf?gen von Benutzern und Gruppen <users-and-groups.html>`__
`6.25. Von Kernelquellen abh?ngige Ports <ch06s25.html>`__
`7. Fortgeschrittene ``pkg-plist``-Methoden <plist.html>`__
`7.1. ?nderungen an ``pkg-plist`` mit Hilfe von
make-Variablen <plist.html#plist-sub>`__
`7.2. Leere Verzeichnisse <plist-cleaning.html>`__
`7.3. Konfigurationsdateien <plist-config.html>`__
`7.4. Dynamische oder statische Paketliste <plist-dynamic.html>`__
`7.5. Automatisiertes Erstellen von
Paketlisten <plist-autoplist.html>`__
`8. Die ``pkg-*`` Dateien <pkg-files.html>`__
`8.1. ``pkg-message`` <pkg-files.html#porting-message>`__
`8.2. ``pkg-install`` <pkg-install.html>`__
`8.3. ``pkg-deinstall`` <pkg-deinstall.html>`__
`8.4. ``pkg-req`` <pkg-req.html>`__
`8.5. ?ndern der Namen der ``pkg-*`` Dateien <pkg-names.html>`__
`8.6. Nutzung von ``SUB_FILES`` und
``SUB_LIST`` <using-sub-files.html>`__
`9. Ihren Port testen <testing.html>`__
`9.1. ``make describe`` ausf?hren <testing.html#make-describe>`__
`9.2. Portlint <testing-portlint.html>`__
`9.3. Port Tools <testing-porttools.html>`__
`9.4. ``PREFIX`` und ``DESTDIR`` <porting-prefix.html>`__
`9.5. Die Tinderbox <testing-tinderbox.html>`__
`10. Einen existierenden Port aktualisieren <port-upgrading.html>`__
`10.1. Patches mit CVS erstellen <port-upgrading.html#cvs-diff>`__
`10.2. Die Dateien UPDATING und MOVED <moved-and-updating-files.html>`__
`11. Sicherheit der Ports <security.html>`__
`11.1. Warum Sicherheit so wichtig ist <security.html#security-intro>`__
`11.2. Sicherheitsl?cken schliessen <security-fix.html>`__
`11.3. Die Community informiert halten <security-notify.html>`__
`12. Was man machen respektive vermeiden sollte <porting-dads.html>`__
`12.1. Einf?hrung <porting-dads.html#dads-intro>`__
`12.2. ``WRKDIR`` <porting-wrkdir.html>`__
`12.3. ``WRKDIRPREFIX`` <porting-wrkdirprefix.html>`__
`12.4. Unterschiedliche Betriebssysteme und
Betriebssystemversionen <porting-versions.html>`__
`12.5. \_\_FreeBSD\_version Werte <freebsd-versions.html>`__
`12.6. Etwas hinter die ``bsd.port.mk``-Anweisung
schreiben <dads-after-port-mk.html>`__
`12.7. Benutzen Sie die ``exec``-Anweisung in
Wrapper-Skripten <dads-sh-exec.html>`__
`12.8. Aufgaben vern?nftig l?sen <dads-rational.html>`__
`12.9. Ber?cksichtigen Sie sowohl ``CC`` als auch
``CXX`` <dads-cc.html>`__
`12.10. Ber?cksichtigen Sie ``CFLAGS`` <dads-cflags.html>`__
`12.11. Threading-Bibliotheken <dads-pthread.html>`__
`12.12. R?ckmeldungen <dads-freedback.html>`__
`12.13. ``README.html`` <dads-readme.html>`__
`12.14. Einen Port durch ``BROKEN``, ``FORBIDDEN`` oder ``IGNORE`` als
nicht installierbar markieren <dads-noinstall.html>`__
`12.15. Kennzeichnen eines Ports zur Entfernung durch ``DEPRECATED``
oder ``EXPIRATION_DATE`` <dads-deprecated.html>`__
`12.16. Vermeiden Sie den Gebrauch des
``.error``-Konstruktes <dads-dot-error.html>`__
`12.17. Verwendung von ``sysctl`` <dads-sysctl.html>`__
`12.18. Erneutes Ausliefern von
Distfiles <dads-rerolling-distfiles.html>`__
`12.19. Verschiedenes <dads-misc.html>`__
`13. Beispiel eines ``Makefile`` <porting-samplem.html>`__
`14. Auf dem Laufenden bleiben <keeping-up.html>`__
`14.1. FreshPorts <keeping-up.html#freshports>`__
`14.2. Die Webschnittstelle zum Quelltext-Repository <cvsweb.html>`__
`14.3. Die FreeBSD Ports-Mailingliste <ports-mailling-list.html>`__
`14.4. Der Cluster zum Bauen von FreeBSD-Ports auf
``pointyhat.FreeBSD.org`` <build-cluster.html>`__
`14.5. Der FreeBSD Ports-Distfile-Scanner <distfile-survey.html>`__
`14.6. Das FreeBSD Ports-Monitoring-System <portsmon.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

Tabellenverzeichnis

.. raw:: html

   </div>

5.1. `Beliebte magic
``MASTER_SITES``-Makros <makefile-distfiles.html#idp67741776>`__
5.2. `Die ``USE_*``-Varibalen <makefile-depend.html#idp68175184>`__
5.3. `H?ufige ``WITH_*`` und
``           WITHOUT_*``-Variablen <makefile-options.html#idp68310480>`__
6.1. `Port-Variablen im Zusammenhang mit
gmake <building.html#idp68558160>`__
6.2. `Variablen f?r Ports, die ``configure``
benutzen <building.html#idp68581328>`__
6.3. `Variablen f?r Ports, die ``scons``
benutzen <building.html#idp68596304>`__
6.4. `Variablen f?r Ports, die ``perl``
benutzen <using-perl.html#idp68725584>`__
6.5. `Variablen f?r Ports, die X
benutzen <using-x11.html#idp68775760>`__
6.6. `Variablen bei Abh?ngigkeit von einzelnen Teilen von
X11 <using-x11.html#idp68785616>`__
6.7. `Variablen f?r Ports, die Qt
ben?tigen <using-qt.html#idp68885840>`__
6.8. `Zus?tzliche Variablen f?r Ports, die Qt 4.xi
benutzen <using-qt.html#idp68904912>`__
6.9. `Verf?gbare
Qt4-Bibliothekskomponenten <using-qt.html#idp68926032>`__
6.10. `Verf?gbare Qt4-Tool-Komponenten <using-qt.html#idp68946384>`__
6.11. `Verf?gbare Qt4-Plugin-Komponenten <using-qt.html#idp68956240>`__
6.12. `Variablen f?r Ports, die KDE 3
benutzen <using-kde.html#idp68984784>`__
6.13. `Verf?gbare KDE 4-Komponenten <using-kde.html#idp68993232>`__
6.14. `Variablen, die von Ports, die Java benutzen, gesetzt werden
m?ssen <using-java.html#idp69032656>`__
6.15. `Bereitgestellte Variablen f?r Ports, die Java
benutzen <using-java.html#idp69055696>`__
6.16. `Konstanten, die f?r Ports, welche Java benutzen, definiert
sind <using-java.html#idp69115984>`__
6.17. `Variablen f?r Ports, die Apache
verwenden <using-php.html#idp69152720>`__
6.18. `N?tzliche Variablen f?r Ports von
Apache-Modulen <using-php.html#idp69177808>`__
6.19. `Variablen f?r Ports, die PHP
verwenden <using-php.html#idp69206736>`__
6.20. `N?tzliche Variablen f?r Ports, die Python
verwenden <using-python.html#idp69245264>`__
6.21. `?u?erst n?tzliche Variablen f?r Ports, die Tcl/Tk
benutzen <using-tcl.html#idp69285968>`__
6.22. `N?tzliche Variablen f?r Ports, die Ruby
verwenden <using-ruby.html#idp69315152>`__
6.23. `Ausgew?hlte read-only-Variablen f?r Ports, die Ruby
verwenden <using-ruby.html#idp69338320>`__
6.24. `Variablen, um die wxWidgets-Version
festzulegen <using-wx.html#wx-ver-sel-table>`__
6.25. `Verf?gbare wxWidgets-Versionen <using-wx.html#idp69418448>`__
6.26. `Spezifikationen der
wxWidgets-Versionen <using-wx.html#idp69429200>`__
6.27. `Variablen zur Festlegung der bevorzugten
wxWidgets-Version <using-wx.html#idp69442640>`__
6.28. `Verf?gbare wxWidgets-Komponenten <using-wx.html#idp69455184>`__
6.29. `Verf?gbare Typen von
wxWidgets-Abh?ngigkeiten <using-wx.html#idp69478352>`__
6.30. `Standardtypen der
wxWidgets-Abh?ngigkeiten <using-wx.html#wx-def-dep-types>`__
6.31. `Variablen, um Unicode in den wxWidgets-Versionen
auszuw?hlen <using-wx.html#wx-unicode-var-table>`__
6.32. `Vordefinierte Variablen f?r Ports, die wxWidgets
verwenden <using-wx.html#idp69545424>`__
6.33. `Zul?ssige Werte f?r
``WX_CONF_ARGS`` <using-wx.html#idp69577296>`__
6.34. `Variablen, um die Lua-Version
festzulegen <using-lua.html#lua-ver-sel-table>`__
6.35. `Verf?gbare Lua-Versionen <using-lua.html#idp69606096>`__
6.36. `Spezifikationen der Lua-Versionen <using-lua.html#idp69614928>`__
6.37. `Variablen zur Festlegung der bevorzugten
Lua-Version <using-lua.html#idp69628496>`__
6.38. `Verf?gbare Lua-Komponenten <using-lua.html#idp69640912>`__
6.39. `Verf?gbare Typen von
Lua-Abh?ngigkeiten <using-lua.html#idp69656016>`__
6.40. `Standardtypen f?r
Lua-Abh?ngigkeiten <using-lua.html#lua-def-dep-types>`__
6.41. `Vordefinierte Variablen f?r Ports, die Lua
verwenden <using-lua.html#idp69689936>`__
6.42. `Variablen f?r Ports, die Mozilla
verwenden <using-mozilla.html#idp69777488>`__
6.43. `Variablen f?r Ports, die Datenbanken
benutzen <using-databases.html#idp69806288>`__
10.1. `Von cvs update verwendete
Pr?fixe <port-upgrading.html#table-cvs-up>`__
12.1. `\_\_FreeBSD\_version-Werte <freebsd-versions.html#idp70506576>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

Liste der Beispiele

.. raw:: html

   </div>

5.1. `Vereinfachtes Beispiel f?r den Gebrauch von ``MASTER_SITES:n`` mit
einer Datei pro
Webseite <makefile-distfiles.html#ports-master-sites-n-example-simple-use-one-file-per-site>`__
5.2. `Vereinfachtes Beispiel f?r den Gebrauch von ``MASTER_SITES:n`` mit
mehr als einer Datei pro
Webseite <makefile-distfiles.html#ports-master-sites-n-example-simple-use-more-than-one-file-per-site>`__
5.3. `Ausf?hrliches Beispiel von ``MASTER_SITES:n`` in
``MASTER_SITE_SUBDIR`` <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-subdir>`__
5.4. `Ausf?hrliches Beispiel von ``MASTER_SITES:n`` mit Komma-Operator,
mehreren Dateien, mehreren Webseiten und mehreren
Unterverzeichnissen <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-complete-example-master-sites>`__
5.5. `Ausf?hrliches Beispiel von ``MASTER_SITES:n`` mit
``MASTER_SITE_SOURCEFORGE`` <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-sourceforge>`__
5.6. `Vereinfachte Nutzung von ``MASTER_SITES:n`` mit
``PATCH_SITES``. <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-patch-sites>`__
5.7. `Nutzung von
``ALWAYS_KEEP_DISTFILES``. <makefile-distfiles.html#ports-master-sites-n-example-always-keep-distfiles>`__
5.8. `Einfache Anwendung von
``OPTIONS`` <makefile-options.html#ports-options-simple-use>`__
5.9. `Veraltete Anwendung von
``OPTIONS`` <makefile-options.html#ports-options-old-style-use>`__
5.10. `Falsche Behandlung einer
Option <makefile-options.html#idp68352592>`__
5.11. `Korrekte Behandlung einer
Option <makefile-options.html#idp68354512>`__
6.1. `Beispiel f?r USE\_XORG <using-x11.html#use-xorg-example>`__
6.2. `Benutzung von X11-bezogenen Variablen in einem
Port <using-x11.html#using-x11-vars>`__
6.3. `Qt4-Komponenten
ausw?hlen <using-qt.html#qt4-components-example>`__
6.4. ```USE_KDE4``-Beispiel <using-kde.html#kde4-components-example>`__
6.5. `Beispiel eines Makefiles f?r eine PEAR
Klasse <using-php.html#pear-makefile>`__
6.6. `Auswahl von
wxWidgets-Komponenten <using-wx.html#wx-components-example>`__
6.7. `Installierte wxWidgets-Versionen und?–Komponenten
feststellen <using-wx.html#wx-ver-det-example>`__
6.8. `Verwendung von wxWidgets-Variablen in
Kommandos <using-wx.html#wx-premk-example>`__
6.9. `Auswahl der Lua-Version <using-lua.html#lua-version-example>`__
6.10. `Auswahl von
Lua-Komponenten <using-lua.html#lua-components-example>`__
6.11. `Installierte Lua-Versionen und–?Komponenten
feststellen <using-lua.html#lua-ver-det-example>`__
6.12. `Einem Port mitteilen, in welchem Verzeichnis Lua
liegt <using-lua.html#lua-variables-example>`__
6.13. `Verwendung von Lua-Variablen in
Kommandos <using-lua.html#lua-premk-example>`__
12.1. `Wie vermeidet man die Verwendung von
``.error`` <dads-dot-error.html#dot-error-breaks-index>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------------+
| ?   | ?   | ?\ `Weiter <why-port.html>`__   |
+-----+-----+---------------------------------+
| ?   | ?   | ?Kapitel 1. Einf?hrung          |
+-----+-----+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
