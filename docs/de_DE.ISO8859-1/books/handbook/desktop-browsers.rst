============
7.2. Browser
============

.. raw:: html

   <div class="navheader">

7.2. Browser
`Zur?ck <desktop.html>`__?
Kapitel 7. Desktop-Anwendungen
?\ `Weiter <desktop-productivity.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2. Browser
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD besitzt keinen vorinstallierten Browser, stattdessen enth?lt das
`www <../../../../ports/www.html>`__-Verzeichnis der Ports-Sammlung
Browser, die Sie installieren k?nnen. Wenn Ihnen das ?bersetzen der
Browser zu lange dauert, bei einigen Browsern dauert das wirklich lange,
installieren Sie die Pakete, die es f?r viele Browser gibt.

KDE und GNOME enthalten schon HTML-Browser. Das Einrichten dieser
grafischen Benutzeroberfl?chen ist in `Abschnitt?6.7, „Grafische
Oberfl?chen“ <x11-wm.html>`__ beschrieben.

Wenn Sie besonders schlanke Browser ben?tigen, suchen Sie in der
Ports-Sammlung nach
`www/dillo2 <http://www.freebsd.org/cgi/url.cgi?ports/www/dillo2/pkg-descr>`__,
`www/links <http://www.freebsd.org/cgi/url.cgi?ports/www/links/pkg-descr>`__
oder
`www/w3m <http://www.freebsd.org/cgi/url.cgi?ports/www/w3m/pkg-descr>`__.

Dieser Abschnitt behandelt die nachstehenden Anwendungen:

.. raw:: html

   <div class="informaltable">

+-------------+--------------------+--------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Anwendung   | Ressourcenbedarf   | Installationsaufwand aus den Ports   | wichtige Abh?ngigkeiten                                                                                                                                     |
+=============+====================+======================================+=============================================================================================================================================================+
| Firefox     | mittel             | hoch                                 | Gtk+                                                                                                                                                        |
+-------------+--------------------+--------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Opera       | niedrig            | niedrig                              | Es gibt eine FreeBSD- und eine Linux-Version. Die Linux-Version h?ngt von der Linux-Kompatibilit?t (*Linux Binary Compatibility*) und linux-openmotif ab.   |
+-------------+--------------------+--------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Konqueror   | mittel             | hoch                                 | KDE-Biliotheken                                                                                                                                             |
+-------------+--------------------+--------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Chromium    | mittel             | mittel                               | Gtk+                                                                                                                                                        |
+-------------+--------------------+--------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.1. Firefox
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Firefox ist ein moderner, freier und stabiler Open-Source Browser, der
vollst?ndig auf FreeBSD portiert wurde. Er bietet eine dem HTML-Standard
konforme Anzeige, Browserfenster als Tabs, Blockierung von
Werbefenstern, Erweiterungen, verbesserte Sicherheit und mehr. Firefox
basiert auf der Mozilla Codebasis.

Das Paket k?nnen Sie mit dem nachstehenden Befehl installieren:

.. code:: screen

    # pkg_add -r firefox

Damit installieren Sie die neueste Version von Firefox. Wenn Sie
stattdessen die Extended Support Release (ESR) Version einsetzen
m?chten, geben Sie folgenden Befehl ein:

.. code:: screen

    # pkg_add -r firefox-esr

Alternativ k?nnen Sie auch die Ports-Sammlung verwenden, um das Programm
aus dem Quellcode zu installieren:

.. code:: screen

    # cd /usr/ports/www/firefox
    # make install clean

Ersetzen Sie im vorherigen Kommando ``firefox`` durch ``firefox-esr``,
falls Sie Firefox ESR verwenden wollen.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.2. Firefox und das Java™-Plugin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser und die beiden n?chsten Abschnitte gehen davon aus, dass Sie
Firefox bereits installiert haben.

.. raw:: html

   </div>

Die Schritte zur Installation des Plugins h?ngen davon, welche Firefox
Sie installiert haben.

Installieren Sie das OpenJDK 6 ?ber die Ports-Sammlung:

.. code:: screen

    # cd /usr/ports/java/openjdk6
    # make install clean

Danach installieren Sie den Port
`java/icedtea-web <http://www.freebsd.org/cgi/url.cgi?ports/java/icedtea-web/pkg-descr>`__:

.. code:: screen

    # cd /usr/ports/java/icedtea-web
    # make install clean

Stellen Sie dabei sicher, dass Sie jeweils die Standardoptionen
verwenden.

Starten Sie nun Ihren Browser, geben Sie in der Adresszeile
``about:plugins`` ein und best?tigen Sie diese Eingabe mit der
**Enter**-Taste. Dadurch wird eine Seite ge?ffnet, die alle
installierten Plugins auflistet. In dieser Liste sollte sich nun auch
das Java™-Plugin befinden.

Wird das Plugin nicht gefunden, muss f?r jeden Benutzer der folgende
Befel ausgef?hrt werden:

.. code:: screen

    % ln -s /usr/local/lib/IcedTeaPlugin.so \
      $HOME/.mozilla/plugins/

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.3. Firefox und das Adobe? Flash?-Plugin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Adobe? Flash?-Plugin ist f?r FreeBSD nicht verf?gbar. Es existiert
jedoch ein Software-Layer (ein sogenannter Wrapper), der es erlaubt, die
Linux-Version des Plugins unter FreeBSD einzusetzen. Dieser Wrapper
unterst?tzt au?erdem das Adobe? Acrobat?-Plugin, das RealPlayer?-Plugin
und andere mehr.

Je nachdem, welche Version von FreeBSD Sie verwenden, sind
unterschiedliche Schritte notwendig:

.. raw:: html

   <div class="procedure">

#. **F?r FreeBSD?7.X**

   Installieren Sie den Port
   `www/nspluginwrapper <http://www.freebsd.org/cgi/url.cgi?ports/www/nspluginwrapper/pkg-descr>`__.
   Dieser Port setzt voraus, dass Sie den Port
   `emulators/linux\_base-fc4 <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base-fc4/pkg-descr>`__
   bereits installiert haben, der sehr gross ist.

   Anschlie?end installieren Sie den Port
   `www/linux-flashplugin9 <http://www.freebsd.org/cgi/url.cgi?ports/www/linux-flashplugin9/pkg-descr>`__.
   Dadurch wird Flash? 9.X installiert, denn diese Version l?uft
   zuverl?ssig auf FreeBSD?7.X.

#. **F?r FreeBSD?8.X oder Neuere**

   Installieren Sie den Port
   `www/nspluginwrapper <http://www.freebsd.org/cgi/url.cgi?ports/www/nspluginwrapper/pkg-descr>`__.
   Dieser Port ben?tigt den
   `emulators/linux\_base-f10 <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base-f10/pkg-descr>`__
   Port, der sehr gross ist.

   Als n?chstes installieren Sie Flash? 11.X aus dem Port
   `www/linux-f10-flashplugin11 <http://www.freebsd.org/cgi/url.cgi?ports/www/linux-f10-flashplugin11/pkg-descr>`__.

   F?r diese Version muss der folgende symbolische Link angelegt werden:

   .. code:: screen

       # ln -s /usr/local/lib/npapi/linux-f10-flashplugin/libflashplayer.so \
         /usr/local/lib/browser_plugins/

   Falls das Verzeichnis ``/usr/local/lib/browser_plugins`` auf Ihrem
   System nicht existiert, m?ssen Sie es manuell anlegen.

.. raw:: html

   </div>

Sobald der richtige Flash?-Port passend zu ihrer FreeBSD Version
installiert ist, muss das Plugin von jedem Benutzer mittels
``nspluginwrapper`` installiert werden:

.. code:: screen

    % nspluginwrapper -v -a -i

Rufen Sie dann Ihren Browser auf und geben in der Adresszeile
``about:plugins`` ein. Diese Eingabe muss mit der **Enter**-Taste
best?tigt werden. Danach wird eine Seite geladen, auf der alle
installierten Plugins aufgelistet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.4. Firefox und das Swfdec Flash?-Plugin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Swfdec ist die Bibliothek zum Dekodieren und Rendern von Flash?
Animationen. Swfdec-Mozilla ist ein Plugin f?r Firefox-Browser, welches
die Swfdec-Bibliothek zum Abspielen von SWF-Dateien benutzt. Momentan
befindet sie sich noch in der Entwicklung.

Wenn Sie diese nicht ?bersetzen k?nnen oder wollen, dann installieren
Sie einfach das Paket aus dem Netz:

.. code:: screen

    # pkg_add -r swfdec-plugin

Wenn das Paket nicht verf?gbar ist, k?nnen Sie es auch ?ber die
Ports-Sammlung bauen und installieren:

.. code:: screen

    # cd /usr/ports/www/swfdec-plugin
    # make install clean

Starten Sie anschliessend ihren Browser neu, damit dieses Plugin
aktiviert wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.5. Opera
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Opera ist ein schneller, vollwertiger und standardkonformer Browser, der
wie Mozilla ?ber einen eingebauten E-Mail- und Newsreader verf?gt.
Zus?tzlich sind ein IRC-Client, ein RSS/Atom-Feeds-Reader sowie weitere
Programme enthalten. Dennoch handelt es sich bei Opera weiterhin um ein
relativ kleines und sehr schnelles Programmpaket. Sie haben die Wahl
zwei Versionen dieses Browsers: Der „nativen“ FreeBSD-Version und der
Linux-Version.

Wenn Sie das Web mit der FreeBSD-Version von Opera erkunden wollen,
installieren Sie das Paket:

.. code:: screen

    # pkg_add -r opera

Einige FTP-Server haben nicht alle Pakete, Sie k?nnen Opera aber ?ber
die Ports-Sammlung installieren:

.. code:: screen

    # cd /usr/ports/www/opera
    # make install clean

Wenn Sie die Linux-Version des Browsers verwenden wollen, ersetzen Sie
in den Beispielen ``opera`` durch ``linux-opera``.

Das Adobe? Flash?-Plugin ist f?r FreeBSD nicht verf?gbar. Es gibt aber
eine Linux?-Version des Plugins, die auch unter FreeBSD installiert
werden kann. Dazu installieren Sie zuerst den Port
`www/linux-f10-flashplugin11 <http://www.freebsd.org/cgi/url.cgi?ports/www/linux-f10-flashplugin11/pkg-descr>`__,
danach den Port
`www/opera-linuxplugins <http://www.freebsd.org/cgi/url.cgi?ports/www/opera-linuxplugins/pkg-descr>`__:

.. code:: screen

    # cd /usr/ports/www/linux-f10-flashplugin11
    # make install clean
    # cd /usr/ports/www/opera-linuxplugins
    # make install clean

Danach sollte das Plugin installiert sein. Um dies zu ?berpr?fen,
starten Sie den Browser und geben in die Adresszeile ``opera:plugins``
ein und best?tigen diese Eingabe mit der **Return**-Taste. Dadurch
erhalten Sie eine Liste aller derzeit installierter Plugins.

Um das Java™-Plugin zu installieren, folgen Sie bitte den entsprechenden
`Anweisungen f?r Firefox <desktop-browsers.html#moz-java-plugin>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.6. Konqueror
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Konqueror ist Teil von KDE, kann aber au?erhalb von KDE benutzt werden,
wenn der Port
`x11/kdebase3 <http://www.freebsd.org/cgi/url.cgi?ports/x11/kdebase3/pkg-descr>`__
installiert ist. Konqueror ist mehr als nur ein Browser. Sie k?nnen das
Programm weiters zur Dateiverwaltung und zum Abspielen von
Multimedia-Dateien benutzen.

Der Port
`misc/konq-plugins <http://www.freebsd.org/cgi/url.cgi?ports/misc/konq-plugins/pkg-descr>`__
installiert verschiedene Plugins f?r Konqueror.

Konqueror unterst?tzt sowohl WebKit als auch sein eigenes KHTML. WebKit
wird von vielen modernen Browsern verwendet, einschliesslich Chromium.
Um WebKit mit Konqueror unter FreeBSD zu verwenden, geben Sie ein:

.. code:: screen

    # cd /usr/ports/www/kwebkitpart
    # make install clean

Klicken Sie dann in Konqueror auf „Settings“, „Configure Konqueror“ und
dann auf „Change KHTML to WebKit“.

Konqueror kann Flash?-Seiten darstellen. Wie Sie die
Flash?-Unterst?tzung aktiviern, k?nnen Sie unter
``http://freebsd.kde.org/howtos/konqueror-flash.php`` nachlesen.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.7. Chromium
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Chromium ist ein quelloffenes Browserprojekt mit dem Ziel ein sicheres,
schnelleres und stabileres Surferlebnis im Web zu erm?glichen. Chromium
erm?glicht surfen mit Tabs, Blockieren von Pop-Ups, Erweiterungen und
vieles mehr. Chromium ist das Open Source Projekt, welches auf dem
Google Chrome Webbrowser basiert.

Chromium kann als Paket durch die Eingabe des folgenden Befehls
installiert werden:

.. code:: screen

    # pkg_add -r chromium

Als Alternative kann Chromium aus dem Quellcode durch die Ports
Collection ?bersetzt werden:

.. code:: screen

    # cd /usr/ports/www/chromium
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Chromium wird als ``/usr/local/bin/chrome`` installiert und nicht als
``/usr/local/bin/chromium``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.8. Chromium und das Java™-Plug-In
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser Abschnitt setzt voraus, dass Chromium bereits installiert ist.

.. raw:: html

   </div>

Installieren Sie OpenJDK?6 mit Hilfe der Ports Collection durch Eingabe
von:

.. code:: screen

    # cd /usr/ports/java/openjdk6
    # make install clean

Als n?chstes installieren Sie
`java/icedtea-web <http://www.freebsd.org/cgi/url.cgi?ports/java/icedtea-web/pkg-descr>`__
aus der Ports Collection:

.. code:: screen

    # cd /usr/ports/java/icedtea-web
    # make install clean

Starten Sie Chromium und geben Sie ``about:plugins`` in die Addresszeile
ein. IcedTea-Web sollte dort als eines der installierten Plug-Ins
aufgelistet sein.

Falls Chromium das IcedTea-Web Plug-In nicht anzeigt, geben Sie das
folgende Kommando ein und starten Sie den Webbrowser anschliessend neu:

.. code:: screen

    # mkdir -p /usr/local/share/chromium/plugins
    # ln -s /usr/local/lib/IcedTeaPlugin.so \
       /usr/local/share/chromium/plugins/

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.9. Chromium und das Adobe??Flash?-Plug-In
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser Abschnitt setzt voraus, dass Chromium bereits installiert ist.

.. raw:: html

   </div>

Die Konfiguration von Chromium und Adobe??Flash? ist ?hnlich zur
`Anleitung f?r Firefox <desktop-browsers.html#moz-flash-plugin>`__. F?r
genauere Hinweise zur Installation von Adobe??Flash? auf FreeBSD, wenden
Sie sich bitte an diesen Abschnitt. Es sollte keine weitere
Konfiguration notwendig sein, da Chromium in der Lage ist, Plug-Ins von
anderen Browsern mit zu benutzen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+--------------------------------+---------------------------------------------+
| `Zur?ck <desktop.html>`__?        | `Nach oben <desktop.html>`__   | ?\ `Weiter <desktop-productivity.html>`__   |
+-----------------------------------+--------------------------------+---------------------------------------------+
| Kapitel 7. Desktop-Anwendungen?   | `Zum Anfang <index.html>`__    | ?7.3. B?roanwendungen                       |
+-----------------------------------+--------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
