==================================
15.13. FreeBSD Sicherheitshinweise
==================================

.. raw:: html

   <div class="navheader">

15.13. FreeBSD Sicherheitshinweise
`Zur?ck <security-portaudit.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <security-accounting.html>`__

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

15.13. FreeBSD Sicherheitshinweise
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie f?r andere hochwertige Betriebssysteme auch werden f?r FreeBSD
Sicherheitshinweise herausgegeben. Die Hinweise werden gew?hnlich auf
den Sicherheits-Mailinglisten und in den Errata ver?ffentlicht, nachdem
das Sicherheitsproblem behoben ist. Dieser Abschnitt beschreibt den
Umgang mit den Sicherheitshinweisen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.13.1. Wie sieht ein Sicherheitshinweis aus?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der nachstehende Sicherheitshinweis stammt von der Mailingliste
`freebsd-security-notifications <http://lists.FreeBSD.org/mailman/listinfo/freebsd-security-notifications>`__:

.. code:: programlisting

    =============================================================================
    FreeBSD-SA-XX:XX.UTIL                                     Security Advisory
                                                              The FreeBSD Project

    Topic:          denial of service due to some problem

    Category:       core
    Module:         sys
    Announced:      2003-09-23
    Credits:        Person
    Affects:        All releases of FreeBSD
                    FreeBSD 4-STABLE prior to the correction date
    Corrected:      2003-09-23 16:42:59 UTC (RELENG_4, 4.9-PRERELEASE)
                    2003-09-23 20:08:42 UTC (RELENG_5_1, 5.1-RELEASE-p6)
                    2003-09-23 20:07:06 UTC (RELENG_5_0, 5.0-RELEASE-p15)
                    2003-09-23 16:44:58 UTC (RELENG_4_8, 4.8-RELEASE-p8)
                    2003-09-23 16:47:34 UTC (RELENG_4_7, 4.7-RELEASE-p18)
                    2003-09-23 16:49:46 UTC (RELENG_4_6, 4.6-RELEASE-p21)
                    2003-09-23 16:51:24 UTC (RELENG_4_5, 4.5-RELEASE-p33)
                    2003-09-23 16:52:45 UTC (RELENG_4_4, 4.4-RELEASE-p43)
                    2003-09-23 16:54:39 UTC (RELENG_4_3, 4.3-RELEASE-p39)
    CVE Name:       CVE-XXXX-XXXX

    For general information regarding FreeBSD Security Advisories,
    including descriptions of the fields above, security branches, and the
    following sections, please visit
    http://www.FreeBSD.org/security/.

    I.   Background


    II.  Problem Description


    III. Impact


    IV.  Workaround


    V.   Solution


    VI.  Correction details


    VII. References

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-topic>`__                  | Das Feld ``Topic`` enth?lt eine      |
|                                      | Beschreibung des Sicherheitsproblems |
|                                      | und benennt das betroffene Programm. |
+--------------------------------------+--------------------------------------+
| `|2| <#co-category>`__               | Das Feld ``Category`` beschreibt den |
|                                      | betroffenen Systemteil. M?gliche     |
|                                      | Werte f?r dieses Feld sind ``core``, |
|                                      | ``contrib`` oder ``ports``. Die      |
|                                      | Kategorie ``core`` gilt f?r          |
|                                      | Kernkomponenten des                  |
|                                      | FreeBSD-Betriebssystems, die         |
|                                      | Kategorie ``contrib`` beschreibt zum |
|                                      | Basissystem geh?rende Software       |
|                                      | Dritter beispielsweise sendmail. Die |
|                                      | Kategorie ``ports`` beschreibt       |
|                                      | Software, die Teil der               |
|                                      | Ports-Sammlung ist.                  |
+--------------------------------------+--------------------------------------+
| `|3| <#co-module>`__                 | Das Feld ``Module`` beschreibt die   |
|                                      | betroffene Komponente. Im Beispiel   |
|                                      | ist ``sys`` angegeben, das hei?t     |
|                                      | dieses Problem betrifft eine         |
|                                      | Komponente, die vom Kernel benutzt   |
|                                      | wird.                                |
+--------------------------------------+--------------------------------------+
| `|4| <#co-announce>`__               | Das Feld ``Announced`` gibt den      |
|                                      | Zeitpunkt der Bekanntgabe des        |
|                                      | Sicherheitshinweises an. Damit       |
|                                      | existiert das Sicherheitsproblem,    |
|                                      | ist vom Sicherheits-Team best?tigt   |
|                                      | worden und eine entsprechende        |
|                                      | Korrektur wurde in das               |
|                                      | Quellcode-Repository von FreeBSD     |
|                                      | gestellt.                            |
+--------------------------------------+--------------------------------------+
| `|5| <#co-credit>`__                 | Das Feld ``Credits`` gibt die Person |
|                                      | oder Organisation an, die das        |
|                                      | Sicherheitsproblem bemerkte und      |
|                                      | gemeldet hat.                        |
+--------------------------------------+--------------------------------------+
| `|6| <#co-affects>`__                | Welche FreeBSD-Releases betroffen    |
|                                      | sind, ist im Feld ``Affects``        |
|                                      | angegeben. Die Version einer Datei,  |
|                                      | die zum Kernel geh?rt, k?nnen Sie    |
|                                      | schnell mit ``ident`` ermitteln. Bei |
|                                      | Ports ist die Versionsnummer         |
|                                      | angegeben, die Sie im Verzeichnis    |
|                                      | ``/var/db/pkg`` finden. Wenn Sie Ihr |
|                                      | System nicht t?glich aktualisieren,  |
|                                      | ist Ihr System wahrscheinlich        |
|                                      | betroffen.                           |
+--------------------------------------+--------------------------------------+
| `|7| <#co-corrected>`__              | Wann das Problem in welchem Release  |
|                                      | behoben wurde, steht im Feld         |
|                                      | ``Corrected``.                       |
+--------------------------------------+--------------------------------------+
| `|8| <#co-cve>`__                    | Reserviert f?r Informationen, ?ber   |
|                                      | die in der *Common Vulnerabilities   |
|                                      | Database* nach Sicherheitsl?cken     |
|                                      | gesucht werden kann.                 |
+--------------------------------------+--------------------------------------+
| `|9| <#co-backround>`__              | Im Feld ``Background`` wird das      |
|                                      | betroffene Werkzeug beschrieben.     |
|                                      | Meist finden Sie hier warum das      |
|                                      | Werkzeug Bestandteil von FreeBSD     |
|                                      | ist, wof?r es benutzt wird und eine  |
|                                      | kurze Darstellung der Herkunft des   |
|                                      | Werkzeugs.                           |
+--------------------------------------+--------------------------------------+
| `|10| <#co-descript>`__              | Im Feld ``Problem Description``      |
|                                      | befindet sich eine genaue            |
|                                      | Darstellung des Sicherheitsproblems. |
|                                      | Hier wird fehlerhafter Code          |
|                                      | beschrieben oder geschildert, wie    |
|                                      | ein Werkzeug ausgenutzt wird.        |
+--------------------------------------+--------------------------------------+
| `|11| <#co-impact>`__                | Das Feld ``Impact`` beschreibt die   |
|                                      | Auswirkungen des Sicherheitsproblems |
|                                      | auf ein System, beispielsweise       |
|                                      | erweiterte Rechte oder gar           |
|                                      | Superuser-Rechte f?r normale         |
|                                      | Benutzer.                            |
+--------------------------------------+--------------------------------------+
| `|12| <#co-workaround>`__            | Im Feld ``Workaround`` wird eine     |
|                                      | Umgehung des Sicherheitsproblems     |
|                                      | beschrieben. Die Umgehung ist f?r    |
|                                      | Administratoren gedacht, die ihr     |
|                                      | System aus Zeitnot,                  |
|                                      | Netzwerk-technischen oder anderen    |
|                                      | Gr?nden nicht aktualisieren k?nnen.  |
|                                      | Nehmen Sie Sicherheitsprobleme       |
|                                      | ernst: Auf einem betroffenen System  |
|                                      | sollte das Problem entweder behoben  |
|                                      | oder, wie hier beschrieben, umgangen |
|                                      | werden.                              |
+--------------------------------------+--------------------------------------+
| `|13| <#co-solution>`__              | Im Feld ``Solution`` enth?lt eine    |
|                                      | getestete Schritt-f?r-Schritt        |
|                                      | Anleitung, die das                   |
|                                      | Sicherheitsproblem behebt.           |
+--------------------------------------+--------------------------------------+
| `|14| <#co-details>`__               | Das Feld ``Correction Details``      |
|                                      | enth?lt die CVS-Tags der betroffenen |
|                                      | Dateien zusammen mit zugeh?rigen     |
|                                      | Revisionsnummern.                    |
+--------------------------------------+--------------------------------------+
| `|15| <#co-ref>`__                   | Im Feld ``References`` finden sich   |
|                                      | Verweise auf weitere                 |
|                                      | Informationsquellen. Dies k?nnen     |
|                                      | URLs zu Webseiten, B?cher,           |
|                                      | Mailinglisten und Newsgroups sein.   |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------+---------------------------------+--------------------------------------------+
| `Zur?ck <security-portaudit.html>`__?                        | `Nach oben <security.html>`__   | ?\ `Weiter <security-accounting.html>`__   |
+--------------------------------------------------------------+---------------------------------+--------------------------------------------+
| 15.12. Sicherheitsprobleme in Software Dritter ?berwachen?   | `Zum Anfang <index.html>`__     | ?15.14. Prozess-?berwachung                |
+--------------------------------------------------------------+---------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
.. |11| image:: ./imagelib/callouts/11.png
.. |12| image:: ./imagelib/callouts/12.png
.. |13| image:: ./imagelib/callouts/13.png
.. |14| image:: ./imagelib/callouts/14.png
.. |15| image:: ./imagelib/callouts/15.png
