============================
A.6. Benutzen von Subversion
============================

.. raw:: html

   <div class="navheader">

A.6. Benutzen von Subversion
`Zur?ck <ctm.html>`__?
Anhang A. Bezugsquellen f?r FreeBSD
?\ `Weiter <svn-mirrors.html>`__

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

A.6. Benutzen von Subversion
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.6.1. Einf?hrung
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Seit Juli 2012 nutzt FreeBSD
`Subversion <http://subversion.apache.org/>`__ (*svn*) als prim?res
Versionskontrollsystem zur Speicherung des gesamten FreeBSD Quellcodes,
der Dokumentation und der Ports-Sammlung.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Subversion ist haupts?chlich ein Werkzeug f?r Entwickler. Die meisten
Benutzer sollten `FreeBSD
Update <updating-upgrading-freebsdupdate.html>`__ benutzen um ihr
FreeBSD zu aktualisieren, und
`Portsnap <updating-upgrading-portsnap.html>`__ um ihre Ports-Sammlung
aktuell zu halten.

.. raw:: html

   </div>

In Subversion werden URLs in der Form von *``protocol://hostname/path``*
verwendet, um ein Repository zu kennzeichnen. Die Spiegel k?nnen, wie
unten angegeben, verschiedene Protokolle unterst?tzen. Die erste
Komponente des Pfades ist das FreeBSD Repository auf welches zugegriffen
wird. Es gibt drei verschiedene Repositories. ``base`` f?r den Quellcode
des FreeBSD Basissystems, ``ports`` f?r die Ports-Sammlung und ``doc``
f?r die Dokumentation. Als Beispiel spezifiziert die URL
``svn://svn0.us-east.FreeBSD.org/ports/head/`` den Hauptzweig des
Port-Repositories auf dem Mirror ``svn0.us-east.FreeBSD.org``, ?ber das
``svn``-Protokoll.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.6.2. Installation
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Subversion muss installiert werden, bevor Sie damit die Inhalte eines
der Repositories auschecken k?nnen. Wenn eine Kopie der Ports-Sammlung
bereits vorhanden ist, kann Subversion wie folgt installiert werden:

.. code:: screen

    # cd /usr/ports/devel/subversion
    #make install clean

Ist die Ports-Sammlung nicht vorhanden, kann Subversion als Paket
installiert werden:

.. code:: screen

    # pkg_add -r subversion

Wenn Sie pkgng verwenden, um Pakete zu verwalten, k?nnen Sie Subversion
stattdessen so installieren:

.. code:: screen

    # pkg install devel/subversion

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.6.3. Ausf?hren von Subversion
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der ``svn`` Befehl wird verwendet, eine Kopie der Quellen in ein lokales
Verzeichnis zu holen. Die Dateien in diesem Verzeichnis werden *lokale
Arbeitskopie* genannt.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Wenn das lokale Verzeichnis bereits vorhanden ist, aber nicht von
``svn`` erstellt wurde, benennen Sie das Verzeichnis um oder l?schen Sie
es, bevor Sie Inhalte auschecken. In ein bestehendes nicht-\ ``svn``
Verzeichnis auszuchecken kann zu Konflikten zwischen den vorhandenen
Dateien und denen aus dem Respository f?hren.

.. raw:: html

   </div>

Das Auschecken aus einem bestimmten Repository kann wie folgt
durchgef?hrt werden:

.. code:: screen

    # svn checkout svn-mirror/repository/branch lcwdir

wobei:

.. raw:: html

   <div class="itemizedlist">

-  *``svn-mirror``* eine URL f?r einen Mirror aus `Subversion Mirror
   Sites <svn-mirrors.html>`__ ist.

-  *``repository``* eines der Projekt-Repositories ist, z. B. ``base``,
   ``ports`` oder ``doc``.

-  *``branch``* vom verwendeten Repository abh?ngt. ``ports`` und
   ``doc`` werden meist im ``head`` Zweig aktualisiert, w?hrend ``base``
   die neueste Version von -CURRENT unter ``head`` und die jeweilige
   neueste Version des -STABLE Zweiges unter ``stable/8`` (f?r
   8.\ *``x``*) und ``stable/9`` (9.*``x``*) verwaltet wird.

-  *``lcwdir``* das Zielverzeichnis ist, in dem die Inhalte des
   angegebenen Zweiges plaziert werden sollen. Dies ist ?blicherweise
   ``/usr/ports`` f?r ``ports``, ``/usr/src`` f?r ``base``, und
   ``/usr/doc`` f?r ``doc``.

.. raw:: html

   </div>

Dieses Beispiel checkt die Ports-Sammlung aus dem Repositroy im Westen
der USA ?ber das HTTPS Protokoll aus, und speichert die Arbeitskopie
unter ``/usr/ports``. Wenn ``/usr/ports`` bereits vorhanden ist, aber
nicht von ``svn`` erstellt wurde, denken Sie vor dem Auschecken daran,
das Verzeichnis umzubenennen oder zu l?schen.

.. code:: screen

    # svn checkout https://svn0.us-west.FreeBSD.org/ports/head /usr/ports

Dies kann eine Weile dauern, da beim ersten Auschecken der komplette
Zweig vom entfernten Repository heruntergeladen werden muss. Bitte haben
Sie Geduld.

Nach dem ersten Auschecken k?nnen Sie Ihre lokale Arbeitskopie wie folgt
aktualisieren:

.. code:: screen

    # svn update lcwdir

Um ``/usr/ports`` aus dem oben erstellten Beispiel zu aktualisieren,
benutzen Sie:

.. code:: screen

    # svn update /usr/ports

Das Update ist viel schneller als ein Auschecken, da nur die Dateien
?bertragen werden m?ssen, die sich auch ge?ndert haben.

Eine alternative M?glichkeit zur Aktualisierung Ihrer Arbeitskopie nach
dem Auschecken ist es, das bestehende ``Makefile`` in den Verzeichnissen
``/usr/ports``, ``/usr/src``, und ``/usr/doc`` zu nutzen. Setzen Sie
dazu ``SVN_UPDATE`` und benutzen Sie das ``update`` Ziel. Zum Beispiel,
um ``/usr/src`` zu aktualisieren:

.. code:: screen

    # cd /usr/src
    # make update SVN_UPDATE=yes

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.6.4. Weiterf?hrende Informationen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weitere Informationen ?ber die Verwendung von Subversion finden Sie im
„Subversion Buch“ mit dem Namen `Versionskontrolle mit
Subversion <http://svnbook.red-bean.com/>`__, oder in der `Subversion
Dokumentation <http://subversion.apache.org/docs/>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+--------------------------------+------------------------------------+
| `Zur?ck <ctm.html>`__?   | `Nach oben <mirrors.html>`__   | ?\ `Weiter <svn-mirrors.html>`__   |
+--------------------------+--------------------------------+------------------------------------+
| A.5. CTM?                | `Zum Anfang <index.html>`__    | ?A.7. Subversion Mirror Sites      |
+--------------------------+--------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
