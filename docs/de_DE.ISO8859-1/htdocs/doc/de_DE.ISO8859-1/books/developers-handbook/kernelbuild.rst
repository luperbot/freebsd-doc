======================================================
Kapitel 9. Einen FreeBSD-Kernel bauen und installieren
======================================================

.. raw:: html

   <div class="navheader">

Kapitel 9. Einen FreeBSD-Kernel bauen und installieren
`Zur?ck <kernel.html>`__?
Teil?III.?Kernel
?\ `Weiter <kernelbuild-new.html>`__

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

Kapitel 9. Einen FreeBSD-Kernel bauen und installieren
------------------------------------------------------

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

`9.1. Einen Kernel auf die „traditionelle“ Art und Weise
bauen <kernelbuild.html#kernelbuild-traditional>`__
`9.2. Einen Kernel auf die „neue“ Art und Weise
bauen <kernelbuild-new.html>`__

.. raw:: html

   </div>

Ein Kernelentwickler muss wissen, wie der Bau eines angepassten Kernels
funktioniert, da das Debuggen des FreeBSD-Kernels nur durch den Bau
eines neuen Kernels m?glich ist. Es gibt zwei Wege, einen angepassten
Kernel zu bauen:

.. raw:: html

   <div class="itemizedlist">

-  Den „traditionellen“ Weg

-  Den „neuen“ Weg

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die folgenden Ausf?hrungen setzen voraus, dass Sie den Abschnitt
`Erstellen und Installation eines angepassten
Kernels <../handbook/kernelconfig-building.html>`__ des
FreeBSD-Handbuchs gelesen haben und daher wissen, wie man einen
FreeBSD-Kernel baut.

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

9.1. Einen Kernel auf die „traditionelle“ Art und Weise bauen
-------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bis FreeBSD?4.X wurde dieser Weg zum Bau eines angepassten Kernels
empfohlen. Sie k?nnen Ihren Kernel nach wie vor auf diese Art und Weise
bauen (anstatt das Target „buildkernel“ der Makefiles im Verzeichnis
``/usr/src/`` zu verwenden). Dies kann beispielsweise sinnvoll sein,
wenn Sie am Kernel-Quellcode arbeiten. Haben Sie nur ein oder zwei
Optionen der Kernelkonfigurationsdatei ge?ndert, ist dieser Weg in der
Regel schneller als der „neue“ Weg. Andererseits kann es aber auch zu
unerwarteten Fehlern beim Bau des Kernels kommen, wenn Sie Ihren Kernel
unter aktuellen FreeBSD-Versionen auf diese Art und Weise bauen.

.. raw:: html

   <div class="procedure">

#. Erzeugen Sie den Kernel-Quellcode mit
   `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__:

   .. code:: screen

       # /usr/sbin/config MYKERNEL

#. Wechseln Sie in das Build-Verzeichnis.
   `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
   gibt den Namen dieses Verzeichnisses aus, wenn die Erzeugung des
   Kernel-Quellcodes im vorherigen Schritt erfolgreich abgeschlossen
   wurde.

   .. code:: screen

       # cd ../compile/MYKERNEL

#. Kompilieren Sie den neuen Kernel:

   .. code:: screen

       # make depend
       # make

#. Installieren Sie den neuen Kernel:

   .. code:: screen

       # make install

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------------+---------------------------------------------------------+
| `Zur?ck <kernel.html>`__?   | `Nach oben <kernel.html>`__   | ?\ `Weiter <kernelbuild-new.html>`__                    |
+-----------------------------+-------------------------------+---------------------------------------------------------+
| Teil?III.?Kernel?           | `Zum Anfang <index.html>`__   | ?9.2. Einen Kernel auf die „neue“ Art und Weise bauen   |
+-----------------------------+-------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
