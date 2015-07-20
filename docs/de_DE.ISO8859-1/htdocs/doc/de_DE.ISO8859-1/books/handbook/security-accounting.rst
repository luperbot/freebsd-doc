==========================
15.14. Prozess-?berwachung
==========================

.. raw:: html

   <div class="navheader">

15.14. Prozess-?berwachung
`Zur?ck <security-advisories.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <jails.html>`__

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

15.14. Prozess-?berwachung
--------------------------

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

Prozess-?berwachung (*Process accounting*) ist ein Sicherheitsverfahren,
bei dem ein Administrator verfolgt, welche Systemressourcen verwendet
werden und wie sich diese auf die einzelnen Anwender verteilen. Dadurch
kann das System ?berwacht werden und es ist sogar m?glich, zu
kontrollieren, welche Befehle ein Anwender eingibt.

Diese F?higkeiten haben sowohl Vor- als auch Nachteile. Positiv ist,
dass man einen Einbruchsversuch bis an den Anfang zur?ckverfolgen kann.
Von Nachteil ist allerdings, dass durch diesen Prozess Unmengen an
Protokolldateien erzeugt werden, die auch dementsprechenden Plattenplatz
ben?tigen. Dieser Abschnitt beschreibt die Grundlagen der
Prozess-?berwachung.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.14.1. Die Prozess-?berwachung aktivieren und konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie die Prozess-?berwachung verwenden k?nnen, m?ssen Sie diese
aktivieren. Dazu f?hren Sie als ``root`` die folgenden Befehle aus:

.. code:: screen

    # touch /var/account/acct
    # accton /var/account/acct
    # echo 'accounting_enable="YES"' >> /etc/rc.conf

Einmal aktiviert, wird sofort mit der ?berwachung von CPU-Statistiken,
Befehlen und anderen Vorg?ngen begonnen. Protokolldateien werden in
einem nur von Maschinen lesbaren Format gespeichert, daher m?ssen Sie
diese ?ber
`sa(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=8>`__
aufrufen. Geben Sie keine Optionen an, gibt ``sa`` Informationen wie die
Anzahl der Aufrufe pro Anwender, die abgelaufene Zeit in Minuten, die
gesamte CPU- und Anwenderzeit in Minuten, die durchschnittliche Anzahl
der Ein- und Ausgabeoperationen und viel andere mehr aus.

Um Informationen ?ber ausgef?hrte Befehle zu erhalten, verwenden Sie
`lastcomm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lastcomm&sektion=1>`__.
So k?nnen Sie etwa ermittlen, welche Befehle von wem auf welchem
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__
ausgef?hrt wurden:

.. code:: screen

    # lastcomm ls
        trhodes ttyp1

Das Ergebnis sind alle bekannten Eins?tze von ``ls`` durch ``trhodes``
auf dem Terminal ``ttyp1``.

Zahlreiche weitere n?tzliche Optionen finden Sie in den Manualpages zu
`lastcomm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lastcomm&sektion=1>`__,
`acct(5) <http://www.FreeBSD.org/cgi/man.cgi?query=acct&sektion=5>`__
sowie `sa(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+------------------------------+
| `Zur?ck <security-advisories.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <jails.html>`__   |
+------------------------------------------+---------------------------------+------------------------------+
| 15.13. FreeBSD Sicherheitshinweise?      | `Zum Anfang <index.html>`__     | ?Kapitel 16. Jails           |
+------------------------------------------+---------------------------------+------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
