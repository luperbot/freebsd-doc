=========================================================
15.12. Sicherheitsprobleme in Software Dritter ?berwachen
=========================================================

.. raw:: html

   <div class="navheader">

15.12. Sicherheitsprobleme in Software Dritter ?berwachen
`Zur?ck <fs-acl.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <security-advisories.html>`__

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

15.12. Sicherheitsprobleme in Software Dritter ?berwachen
---------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In den letzten Jahren wurden zahlreiche Verbesserungen in der
Einsch?tzung und dem Umgang mit Sicherheitsproblemen erzielt. Die Gefahr
von Einbr?chen in ein System wird aber immer gr??er, da Softwarepakete
von Dritten auf nahezu jedem Betriebssystem installiert und konfiguriert
werden.

Die Einsch?tzung der Verletzlichkeit eines Systems ist ein
Schl?sselfaktor f?r dessen Sicherheit. FreeBSD ver?ffentlicht zwar
Sicherheitshinweise (*security advisories*) f?r das Basissystem, das
Projekt ist allerdings nicht dazu in der Lage, dies auch f?r die
zahlreichen Softwarepakete von Dritten zu tun. Dennoch gibt es einen
Weg, auch diese Programmpakete zu ?berwachen. Das in der Ports-Sammlung
enthaltene Programm Portaudit wurde gezielt daf?r entwickelt.

Der Port
`ports-mgmt/portaudit <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portaudit/pkg-descr>`__
fragt dazu eine Datenbank, die vom FreeBSD Security Team sowie den
Ports-Entwicklern aktualisiert und gewartet wird, auf bekannte
Sicherheitsprobleme ab.

Bevor Sie Portaudit verwenden k?nnen, m?ssen Sie es ?ber die
Ports-Sammlung installieren:

.. code:: screen

    # cd /usr/ports/security/portaudit && make install clean

W?hrend der Installation werden die Konfigurationsdateien f?r
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
aktualisiert, was es Portaudit erlaubt, seine Ausgabe in den t?glichen
Sicherheitsbericht einzuf?gen. Stellen Sie auf jeden Fall sicher, dass
diese (an das E-Mail-Konto von ``root`` gesendeten) Sicherheitsberichte
auch gelesen werden. An dieser Stelle ist keine weitere Konfiguration
n?tig.

Nach der Installation kann ein Administrator die unter
``/var/db/portaudit`` lokal gespeicherte Datenbank aktualisieren und
sich danach durch folgenden Befehl ?ber m?gliche Sicherheitsl?cken der
von ihm installierten Softwarepakete informieren:

.. code:: screen

    # portaudit -Fda

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Datenbank wird automatisch aktualisiert, wenn
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
ausgef?hrt wird. Der eben genannte Befehl ist daher optional, er wird
aber f?r das folgende Beispiel ben?tigt.

.. raw:: html

   </div>

Nach erfolgter Installation der Datenbank kann ein Administrator ?ber
die Ports-Sammlung installierte Softwarepakete Dritter jederzeit
?berpr?fen. Dazu muss er lediglich folgenden Befehl eingeben:

.. code:: screen

    # portaudit -a

Existiert in Ihren installierten Softwarepaketen eine Sicherheitsl?cke,
wird Portaudit eine Ausgabe ?hnlich der folgenden produzieren:

.. code:: programlisting

    Affected package: cups-base-1.1.22.0_1
    Type of problem: cups-base -- HPGL buffer overflow vulnerability.
    Reference: <http://www.FreeBSD.org/ports/portaudit/40a3bca2-6809-11d9-a9e7-0001020eed82.html>

    1 problem(s) in your installed packages found.

    You are advised to update or deinstall the affected package(s) immediately.

Wenn Sie die angegebene URL ?ber einen Internetbrowser aufrufen,
erhalten Sie weitere Informationen ?ber die bestehende Sicherheitsl?cke,
wie die betroffenen Versionen, die Version des FreeBSD-Ports sowie
Hinweise auf weitere Seiten, die ebenfalls Sicherheitshinweise zu diesem
Problem bieten.

Portaudit ist ein m?chtiges Werkzeug und insbesondere in Zusammenarbeit
mit dem Port Portupgrade ?u?erst hilfreich.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+---------------------------------+--------------------------------------------+
| `Zur?ck <fs-acl.html>`__?                         | `Nach oben <security.html>`__   | ?\ `Weiter <security-advisories.html>`__   |
+---------------------------------------------------+---------------------------------+--------------------------------------------+
| 15.11. Zugriffskontrolllisten f?r Dateisysteme?   | `Zum Anfang <index.html>`__     | ?15.13. FreeBSD Sicherheitshinweise        |
+---------------------------------------------------+---------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
