=================
Kapitel 16. Jails
=================

.. raw:: html

   <div class="navheader">

Kapitel 16. Jails
`Zur?ck <security-accounting.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <jails-terms.html>`__

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

Kapitel 16. Jails
-----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Matteo Riondato.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Oliver Peter, Dirk Arlt und Johann Kois.

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

`16.1. ?bersicht <jails.html#jails-synopsis>`__
`16.2. Jails - Definitionen <jails-terms.html>`__
`16.3. Einf?hrung <jails-intro.html>`__
`16.4. Einrichtung und Verwaltung von Jails <jails-build.html>`__
`16.5. Feinabstimmung und Administration <jails-tuning.html>`__
`16.6. Anwendung von Jails <jails-application.html>`__

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

16.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel erkl?rt, was FreeBSD-Jails sind und wie man sie einsetzt.
Jails, manchmal als Ersatz f?r *chroot-Umgebungen* bezeichnet, sind ein
sehr m?chtiges Werkzeug f?r Systemadministratoren, jedoch kann deren
grundlegende Verwendung auch f?r fortgeschrittene Anwender n?tzlich
sein.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Jails sind ein m?chtiges Werkzeug, aber sie sind kein
Sicherheits-"Allheilmittel". Es ist wichtig zu beachten, dass es f?r
einen Prozess in der Jail nicht m?glich ist, von selbst auszubrechen. Es
gibt jedoch M?glichkeiten, in denen ein unpriviligierter Benutzer
au?erhalb der Jail, mit einem priviligierten Benutzer innerhalb der Jail
kooperiert, und somit erh?hte Rechte in der Host-Umgebung erlangt.

Den meisten dieser Angriffe kann vorgebeugt werden, indem sichergestellt
wird, dass das Rootverzeichnis der Jail f?r unpriviligierte Benutzer der
Host-Umgebung nicht zug?nglich ist.

.. raw:: html

   </div>

Nachdem Sie dieses Kapitel gelesen haben, werden Sie

.. raw:: html

   <div class="itemizedlist">

-  Wissen, was eine Jail ist und welche Verwendungszwecke es daf?r unter
   FreeBSD gibt.

-  Wissen, wie man eine Jail erstellt, startet und und anh?lt.

-  Die Grundlagen der Jail-Administration (sowohl innerhalb als auch
   ausserhalb des Jails) kennen.

.. raw:: html

   </div>

Weitere n?tzliche Informationen ?ber Jails sind beispielsweise in
folgenden Quellen zu finden:

.. raw:: html

   <div class="itemizedlist">

-  Der
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
   Manualpage. Diese umfassende Referenz beschreibt, wie man unter
   FreeBSD eine Jail startet, anh?lt und kontrolliert.

-  Den Mailinglisten und deren Archive. Die Archive der Mailingliste
   `FreeBSD general
   questions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
   und anderen Mailinglisten, welche vom `FreeBSD list
   server <http://lists.FreeBSD.org/mailman/listinfo>`__ bereitgestellt
   werden, beinhalten bereits umfangreiche Informationen zu Jails. Daher
   ist es sinnvoll, bei Problemen mit Jails zuerst die Archive der
   Mailinglisten zu durchsuchen, bevor Sie eine neue Anfrage auf der
   Mailingliste
   `freebsd-questions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
   stellen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+----------------------------------------------+------------------------------------+
| `Zur?ck <security-accounting.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <jails-terms.html>`__   |
+------------------------------------------+----------------------------------------------+------------------------------------+
| 15.14. Prozess-?berwachung?              | `Zum Anfang <index.html>`__                  | ?16.2. Jails - Definitionen        |
+------------------------------------------+----------------------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
