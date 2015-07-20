=========================================
25.5. Lokalisierung f?r einzelne Sprachen
=========================================

.. raw:: html

   <div class="navheader">

25.5. Lokalisierung f?r einzelne Sprachen
`Zur?ck <l10n-compiling.html>`__?
Kapitel 25. Lokalisierung – I18N/L10N einrichten und benutzen
?\ `Weiter <updating-upgrading.html>`__

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

25.5. Lokalisierung f?r einzelne Sprachen
-----------------------------------------

.. raw:: html

   </div>

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

25.5.1. Russisch (KOI8-R Codierung)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Andrey Chernov.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weitere Informationen ?ber die KOI8-R Codierung erhalten Sie auf der
Webseite `KOI8-R References (Russian Net Character
Set) <http://koi8.pp.ru/>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.5.1.1. Einrichten der Locale
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?gen Sie die folgenden Zeilen in ``~/.login_conf`` ein:

.. code:: programlisting

    me:My Account:\
        :charset=KOI8-R:\
        :lang=ru_RU.KOI8-R:

Weitere Erkl?rungen finden Sie in `Einstellen der
Locale <using-localization.html#setting-locale>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.5.1.2. Einrichten der Konsole
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  F?gen Sie folgende Zeile in ``/etc/rc.conf`` ein:

   .. code:: programlisting

       mousechar_start=3

-  Nehmen Sie zus?tzlich die folgenden Einstellungen in ``/etc/rc.conf``
   auf:

   .. code:: programlisting

       keymap="ru.koi8-r"
       scrnmap="koi8-r2cp866"
       font8x16="cp866b-8x16"
       font8x14="cp866-8x14"
       font8x8="cp866-8x8"

-  Benutzen Sie ``cons25r`` als Terminaltyp f?r jeden ``ttyv*`` Eintrag
   in ``/etc/ttys``.

.. raw:: html

   </div>

Weitere Beispiele finden Sie in `Einrichten der
Konsole <using-localization.html#setting-console>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.5.1.3. Einrichten eines Druckers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die meisten Drucker mit russischen Zeichen besitzen die Codetabelle
CP866, so dass ein spezielles Programm zur ?bersetzung von KOI8-R nach
CP866 ben?tigt wird. Zu diesem Zweck ist ``/usr/libexec/lpr/ru/koi2alt``
im Basissystem enthalten. Der Eintrag f?r einen Drucker mit russischer
Sprachunterst?tzung in ``/etc/printcap`` sieht wie folgt aus:

.. code:: programlisting

    lp|Russian local line printer:\
        :sh:of=/usr/libexec/lpr/ru/koi2alt:\
        :lp=/dev/lpt0:sd=/var/spool/output/lpd:lf=/var/log/lpd-errs:

N?heres erfahren Sie in
`printcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=printcap&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.5.1.4. MS-DOS? Dateisystem und russische Dateinamen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Russische Dateinamen auf MS-DOS? Dateisystemen werden mit dem folgenden
Eintrag in ``/etc/fstab`` erkannt:

.. code:: programlisting

    /dev/ad0s2      /dos/c  msdos   rw,-Wkoi2dos,-Lru_RU.KOI8-R 0 0

Die Option ``-L`` legt die Locale fest. Die Option ``-W`` legt die
Zeichenumwandlung fest. Stellen Sie sicher, dass ``/usr`` eingehangen
ist, bevor Sie die MS-DOS?-Partition einh?ngen, da die Tabellen zur
Zeichenumwandlung in ``/usr/libdata/msdosfs`` liegen. Weitere
Informationen erhalten Sie in der Hilfeseite
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.5.1.5. Einrichten von X11
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Richten Sie zun?chst die `normale
   Lokalisierung <using-localization.html#setting-locale>`__ ein.

#. Wenn Sie Xorg verwenden, installieren Sie den Port
   `x11-fonts/xorg-fonts-cyrillic <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/xorg-fonts-cyrillic/pkg-descr>`__.

   Im Abschnitt ``"Files"`` von ``/etc/X11/xorg.conf`` f?gen Sie den
   folgende Eintrag *vor* allen anderen ``FontPath`` Eintr?gen ein:

   .. code:: programlisting

       FontPath   "/usr/local/lib/X11/fonts/cyrillic"

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Zus?tzliche kyrillische Schriftarten finden Sie in der
   Ports-Sammlung.

   .. raw:: html

      </div>

#. Die Unterst?tzung f?r eine russische Tastatur aktivieren Sie im
   ``"Keyboard"`` Abschnitt von ``xorg.conf``:

   .. code:: programlisting

       Option "XkbLayout"   "us,ru"
       Option "XkbOptions"  "grp:toggle"

   Stellen Sie zudem sicher, dass ``XkbDisable`` deaktiviert
   (auskommentiert) ist.

   Beim Einsatz von ``grp:toggle`` k?nnen Sie mit **Right Alt** (Alt Gr)
   zwischen dem RUS- und LAT-Modus wechseln, verwenden Sie hingegen
   ``grp:ctrl_shift_toggle``, so erfolgt der Wechsel mit
   **Ctrl**+**Shift**. F?r ``grp:caps_toggle`` ist zum Wechseln des
   RUS/LAT-Modus **CapsLock** zust?ndig. Die alte Funktion von
   **CapsLock** steht nur im LAT-Modus mit der Tastenkombination
   **Shift**+**CapsLock** zur Verf?gung. ``grp:caps_toggle``
   funktioniert aus unbekannten Gr?nden unter Xorg nicht.

   Wenn Ihre Tastatur Windows?-Tasten besitzt und nicht-alphanumerische
   Tasten im RUS-Modus nicht funktionieren, f?gen Sie die folgende Zeile
   in ``xorg.conf`` ein:

   .. code:: programlisting

       Option "XkbVariant" ",winkeys"

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Die russische XKB-Tastatur funktioniert vielleicht nicht mit
   nicht-lokalisierten Anwendungen.

   .. raw:: html

      </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Lokalisierte Anwendungen sollten mindestens die Funktion
``XtSetLanguageProc (NULL, NULL, NULL);`` fr?hzeitig aufrufen.

Weitere Informationen ?ber die Lokalisierung von X11-Anwendungen
erhalten Sie auf der Webseite `KOI8-R for X
Window <http://koi8.pp.ru/xwin.html>`__.

.. raw:: html

   </div>

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

25.5.2. Traditionell chinesische Lokalisierung f?r Taiwan
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das taiwanesische FreeBSD Project stellt ein Tutorium unter
``http://netlab.cse.yzu.edu.tw/~statue/freebsd/zh-tut/`` zur Verf?gung,
das viele chinesische Anwendungen benutzt. Der Editor des
``FreeBSD Chinese HOWTOs`` ist Shen Chuan-Hsing
``<statue@freebsd.sinica.edu.tw>``.

Chuan-Hsing Shen ``<statue@freebsd.sinica.edu.tw>`` hat mithilfe des
Tutoriums die `Chinese FreeBSD Collection
(CFC) <http://netlab.cse.yzu.edu.tw/~statue/cfc/>`__ geschaffen. Die
Pakete und Skripten stehen unter
``ftp://freebsd.csie.nctu.edu.tw/pub/taiwan/CFC/``.

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

25.5.3. Deutsche Lokalisierung (f?r alle ISO 8859-1 Sprachen)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Von Slaven Rezic ``<eserte@cs.tu-berlin.de>`` stammt ein Tutorium, das
die Benutzung von Umlauten mit FreeBSD beschreibt. Das Tutorium ist in
Deutsch verfasst und unter
``http://user.cs.tu-berlin.de/~eserte/FreeBSD/doc/umlaute/umlaute.html``
verf?gbar.

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

25.5.4. Griechische Lokalisierung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nikos Kokkalis ``<nickkokkalis@gmail.com>`` hat einen ganzen Artikel
?ber die Griechisch-Unterst?tzung in FreeBSD geschrieben. Er ist als
Teil der offiziellen FreeBSD Dokumentation auf Griechisch erh?ltlich
unter
`http://www.freebsd.org/doc/el\_GR.ISO8859-7/articles/greek-language-support/index.html <../../../../doc/el_GR.ISO8859-7/articles/greek-language-support/index.html>`__.
Bitte beachten Sie, dass dies *nur* f?r Griechisch gilt.

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

25.5.5. Japanische und koreanische Lokalisierung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Informationen ?ber die japanische Lokalisierung entnehmen Sie bitte
``http://www.jp.FreeBSD.org/``, Informationen ?ber die koreanische
Lokalisierung erhalten Sie unter ``http://www.kr.FreeBSD.org/``.

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

25.5.6. Nicht-englische FreeBSD-Dokumentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Teile vor FreeBSD Dokumentation wurden in andere Sprachen ?bersetzt.
Folgen Sie bitte den Links auf der
`FreeBSD-Webseite <../../../../de/>`__ oder schauen Sie in
``/usr/share/doc`` nach.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+-------------------------------------------+
| `Zur?ck <l10n-compiling.html>`__?   | `Nach oben <l10n.html>`__     | ?\ `Weiter <updating-upgrading.html>`__   |
+-------------------------------------+-------------------------------+-------------------------------------------+
| 25.4. I18N-Programme ?bersetzen?    | `Zum Anfang <index.html>`__   | ?Kapitel 26. FreeBSD aktualisieren        |
+-------------------------------------+-------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
