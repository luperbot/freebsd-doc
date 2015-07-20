==========================================
Kapitel 5. Die Erzeugung der Zieldokumente
==========================================

.. raw:: html

   <div class="navheader">

Kapitel 5. Die Erzeugung der Zieldokumente
`Zur?ck <structure-document.html>`__?
?
?\ `Weiter <doc-build-makefiles.html>`__

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

   <div>

?bersetzt von Johann Kois.

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

`5.1. F?r den Bau der FreeBSD-Dokumentation ben?tigte
Werkzeuge <doc-build.html#doc-build-toolset>`__
`5.2. Die ``Makefile``\ s des Dokumentationsbaums
verstehen <doc-build-makefiles.html>`__
`5.3. make(1)-Includes des FreeBSD Documentation
Projects <make-includes.html>`__

.. raw:: html

   </div>

Dieses Kapitels erkl?rt detailliert, *wie der Bau der Dokumentation
organisiert ist* und wie Sie diesen Prozess mit
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
beeinflussen k?nnen.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. F?r den Bau der FreeBSD-Dokumentation ben?tigte Werkzeuge
--------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgende Werkzeuge werden ben?tigt, um die FDP-Dokumente zu bauen
und zu installieren.

.. raw:: html

   <div class="itemizedlist">

-  Das wichtigste Werkzeug ist
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__,
   genauer Berkeley Make.

-  Der Bau von Paketen erfolgt unter FreeBSD mit
   `pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1>`__.

-  `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__
   dient zur Erstellung komprimierter Versionen der Dokumentation.
   `bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1>`__
   wird ebenfalls unterst?tzt. Wollen Sie Pakete der Dokumentation
   erstellen, ben?tigen Sie auch
   `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__.

-  Mit
   `install(1) <http://www.FreeBSD.org/cgi/man.cgi?query=install&sektion=1>`__
   installieren Sie die Dokumentation auf Ihrem System.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------------+---------------------------------------------------------------+
| `Zur?ck <structure-document.html>`__?       | ?                             | ?\ `Weiter <doc-build-makefiles.html>`__                      |
+---------------------------------------------+-------------------------------+---------------------------------------------------------------+
| 4.3. Dokumentenspezifische Informationen?   | `Zum Anfang <index.html>`__   | ?5.2. Die ``Makefile``\ s des Dokumentationsbaums verstehen   |
+---------------------------------------------+-------------------------------+---------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
