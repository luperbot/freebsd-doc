======================================================
Kapitel 12. Was man machen respektive vermeiden sollte
======================================================

.. raw:: html

   <div class="navheader">

Kapitel 12. Was man machen respektive vermeiden sollte
`Zur?ck <security-notify.html>`__?
?
?\ `Weiter <porting-wrkdir.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

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

12.1. Einf?hrung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hier ist eine Liste von gebr?uchlichen Dos and Don'ts (Dinge, die man
machen oder vermeiden sollte), welchen Sie w?hrend des
Portierungsprozesses begegnen werden. Sie sollten Ihren Port anhand
dieser Liste ?berpr?fen. Sie k?nnen auch Ports in der `PR
Datenbank <http://www.FreeBSD.org/cgi/query-pr-summary.cgi?query>`__,
welche andere Menschen eingereicht haben, kontrollieren. Senden Sie
bitte Kommentare zu Ports, die Sie verifizieren wie unter `Bug Reports
and General
Commentary <../../../../doc/de_DE.ISO8859-1/articles/contributing/contrib-how.html#CONTRIB-GENERAL>`__
beschrieben. Der Abgleich von Ports aus der PR-Datenbank hilft uns diese
schneller zu committen, und zeigt auch, dass Sie wissen, worum es geht.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <security-notify.html>`__?       | ?                             | ?\ `Weiter <porting-wrkdir.html>`__   |
+------------------------------------------+-------------------------------+---------------------------------------+
| 11.3. Die Community informiert halten?   | `Zum Anfang <index.html>`__   | ?12.2. ``WRKDIR``                     |
+------------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
