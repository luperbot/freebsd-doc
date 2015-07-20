========================================================
Kapitel 14. Benutzer und grundlegende Account-Verwaltung
========================================================

.. raw:: html

   <div class="navheader">

Kapitel 14. Benutzer und grundlegende Account-Verwaltung
`Zur?ck <boot-shutdown.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <users-introduction.html>`__

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

Kapitel 14. Benutzer und grundlegende Account-Verwaltung
--------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Neil Blakey-Milner.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Robert Drehmel.

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

`14.1. ?bersicht <users.html#users-synopsis>`__
`14.2. Einf?hrung <users-introduction.html>`__
`14.3. Der Superuser-Account <users-superuser.html>`__
`14.4. System-Accounts <users-system.html>`__
`14.5. Benutzer-Accounts <users-user.html>`__
`14.6. Accounts ver?ndern <users-modifying.html>`__
`14.7. Benutzer einschr?nken <users-limiting.html>`__
`14.8. Gruppen <users-groups.html>`__

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

14.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einen FreeBSD-Computer k?nnen mehrere Benutzer zur selben Zeit benutzen,
allerdings kann immer nur einer vor der Konsole sitzen
`:sup:`[6]` <#ftn.idp77736528>`__, ?ber das Netzwerk k?nnen beliebig
viele Benutzer angemeldet sein. Jeder Benutzer muss einen Account haben,
um das System benutzen zu k?nnen.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie

.. raw:: html

   <div class="itemizedlist">

-  die verschiedenen Account-Typen von FreeBSD kennen,

-  wissen, wie Accounts angelegt werden,

-  wissen, wie Sie Accounts l?schen,

-  wie Sie Attribute eines Accounts, wie den Loginnamen oder die
   Login-Shell ?ndern,

-  wissen, wie Sie Limits f?r einen Account setzen, um beispielsweise
   Ressourcen, wie Speicher oder CPU-Zeit, einzuschr?nken,

-  wie Sie mit Gruppen die Verwaltung der Accounts vereinfachen.

.. raw:: html

   </div>

Vor dem Lesen dieses Kapitels sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  die Grundlagen von UNIX? und FreeBSD (`Kapitel?4, *Grundlagen des
   UNIX Betriebssystems* <basics.html>`__) verstanden haben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp77736528" class="footnote">

`:sup:`[6]` <#idp77736528>`__\ Au?er Sie verwenden, wie in `Kapitel?28,
*Serielle Daten?bertragung* <serialcomms.html>`__ besprochen,
zus?tzliche Terminals

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------------+-------------------------------------------+
| `Zur?ck <boot-shutdown.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <users-introduction.html>`__   |
+------------------------------------+----------------------------------------------+-------------------------------------------+
| 13.7. Der Shutdown-Vorgang?        | `Zum Anfang <index.html>`__                  | ?14.2. Einf?hrung                         |
+------------------------------------+----------------------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
