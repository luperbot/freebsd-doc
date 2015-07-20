=========================================
Kapitel 5. Die Konfiguration des Makefile
=========================================

.. raw:: html

   <div class="navheader">

Kapitel 5. Die Konfiguration des Makefile
`Zur?ck <slow-user-input.html>`__?
?
?\ `Weiter <makefile-naming.html>`__

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

.. raw:: html

   </div>

Das Konfigurieren des ``Makefile`` ist sehr einfach und wir schlagen
vor, dass Sie zun?chst einen Blick auf vorhandene Beispiele werfen.
Zus?tzlich gibt es ein `Beispiel eines
Makefile <porting-samplem.html>`__ in diesem Handbuch. Schauen Sie es
sich an und verfolgen Sie bitte die Abfolge der Variablen und Abschnitte
in dieser Vorlage. Damit erleichtern Sie es anderen, Ihren Port zu
lesen.

Bedenken Sie bitte die folgenden Probleme in der hier vorgegebenen
Abfolge der Unterabschnitte dieses Kapitels, wenn Sie Ihr neues
``Makefile`` erstellen:

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. Der originale Quelltext
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Liegt der Quelltext in ``DISTDIR`` als eine standardisierte und mit gzip
gepackte Datei in der Art ``foozolix-1.2.tar.gz``? Falls ja, k?nnen Sie
zum n?chsten Schritt ?bergehen. Falls nicht, sollten Sie versuchen, die
Variablen ``DISTVERSION``, ``DISTNAME``, ``EXTRACT_CMD``,
``EXTRACT_BEFORE_ARGS``, ``EXTRACT_AFTER_ARGS``, ``EXTRACT_SUFX``, oder
``DISTFILES`` zu ?ndern. Das h?ngt davon ab, wie fremdartig das
Distributionsfile Ihres Ports ist (der h?ufigste Fall ist
``EXTRACT_SUFX=.tar.Z``, wenn der Tarball durch ein normales
``compress`` und nicht durch ``gzip`` gepackt wurde).

Im schlimmsten Fall k?nnen Sie einfach Ihre eigene Vorgabe mittels
``do-extract`` erzeugen und die Standardvorgabe ?berschreiben; aber dies
sollte in den wenigsten F?llen, wenn ?berhaupt, notwendig sein.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <slow-user-input.html>`__?      | ?                             | ?\ `Weiter <makefile-naming.html>`__   |
+-----------------------------------------+-------------------------------+----------------------------------------+
| 4.6. Handhabung von Benutzereingaben?   | `Zum Anfang <index.html>`__   | ?5.2. Bezeichnungen                    |
+-----------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
