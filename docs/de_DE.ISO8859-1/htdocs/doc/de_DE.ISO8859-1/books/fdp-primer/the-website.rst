=======================
Kapitel 6. Die Webseite
=======================

.. raw:: html

   <div class="navheader">

Kapitel 6. Die Webseite
`Zur?ck <make-includes.html>`__?
?
?\ `Weiter <the-website-install.html>`__

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

`6.1. Die Webseiten bauen <the-website.html#the-website-build>`__
`6.2. Installieren der Webseiten auf Ihrem
Server <the-website-install.html>`__
`6.3. Umgebungsvariablen <the-website-env.html>`__

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

6.1. Die Webseiten bauen
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie die Quellen der Webseite erfolgreich heruntergeladen haben,
k?nnen Sie mit dem Bau der Webseite beginnen. In unserem Beispiel
erfolgt der Bau im Verzeichnis ``~/doc``, in dem sich bereits alle
ben?tigten Dateien befinden.

Sie starten den Bau der Webseiten, indem Sie in das Unterverzeichnis
``en_US.ISO8859-1/htdocs`` des Dokumentationsbaums (in unserem Beispiel
also unter ``~/doc``) wechseln und dort den Befehl ``make all``
ausf?hren.

.. code:: screen

    % cd ~/doc/en_US.ISO8859-1/htdocs
    % make all

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Der Bau der Webseiten erfordert die Datei ``INDEX`` der Ports-Sammlung
und schl?gt fehl, wenn ``/usr/ports`` nicht existiert. Der einfachste
Weg, dies zu vermeiden, ist die Installatin der
`Ports-Sammlung <../../../../doc/de_DE.ISO8859-1/books/handbook/ports.html#ports-tree>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------+-------------------------------+-----------------------------------------------------+
| `Zur?ck <make-includes.html>`__?                            | ?                             | ?\ `Weiter <the-website-install.html>`__            |
+-------------------------------------------------------------+-------------------------------+-----------------------------------------------------+
| 5.3. make(1)-Includes des FreeBSD Documentation Projects?   | `Zum Anfang <index.html>`__   | ?6.2. Installieren der Webseiten auf Ihrem Server   |
+-------------------------------------------------------------+-------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
