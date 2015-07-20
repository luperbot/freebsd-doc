=============
A.9. CVS-Tags
=============

.. raw:: html

   <div class="navheader">

A.9. CVS-Tags
`Zur?ck <cvsup.html>`__?
Anhang A. Bezugsquellen f?r FreeBSD
?\ `Weiter <mirrors-rsync.html>`__

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

A.9. CVS-Tags
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie Quellen mit CVS oder CVSup erhalten oder aktualisieren wollen,
m?ssen Sie ein Tag angeben. Ein Tag kann einen bestimmten FreeBSD-Zweig
oder einen bestimmten Zeitpunkt (Release-Tag) bestimmen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.9.1. Tags f?r Zweige
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit Ausnahme von ``HEAD`` (das immer ein g?ltiges Tag ist), k?nnen die
folgenden Tags nur im ``src/``-Quellbaum verwendet werden. Die
Quellb?ume ``ports/``, ``doc/`` und ``www/`` sind nicht verzweigt.

.. raw:: html

   <div class="variablelist">

HEAD
    Symbolischer Name f?r den Hauptzweig, auch FreeBSD-CURRENT genannt.
    Dies ist die Vorgabe, wenn keine Revision angegeben wird.

    In CVSup wird dieses Tag mit einem ``.`` (Punkt) bezeichnet.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    In CVS ist das die Vorgabe, wenn Sie kein Tag oder eine Revision
    angeben. Au?er Sie wollen einen -STABLE Rechner auf -CURRENT
    aktualisieren, ist es *nicht* ratsam, die -CURRENT Quellen auf einem
    -STABLE Rechner einzuspielen.

    .. raw:: html

       </div>

RELENG\_9
    Der Entwicklungszweig f?r FreeBSD-9.X, auch bekannt als FreeBSD
    9-STABLE.

RELENG\_9\_1
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?9.1 durchgef?hrt werden.

RELENG\_9\_0
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?9.0 durchgef?hrt werden.

RELENG\_8
    Der Entwicklungszweig f?r FreeBSD-8.X, auch bekannt als FreeBSD
    8-STABLE.

RELENG\_8\_4
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?8.4 durchgef?hrt werden.

RELENG\_8\_3
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?8.3 durchgef?hrt werden.

RELENG\_8\_2
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?8.2 durchgef?hrt werden.

RELENG\_8\_1
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?8.1 durchgef?hrt werden.

RELENG\_8\_0
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?8.0 durchgef?hrt werden.

RELENG\_7
    Der Entwicklungszweig f?r FreeBSD-7.X, auch als FreeBSD 7-STABLE
    bekannt.

RELENG\_7\_4
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?7.4 durchgef?hrt werden.

RELENG\_7\_3
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?7.3 durchgef?hrt werden.

RELENG\_7\_2
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?7.2 durchgef?hrt werden.

RELENG\_7\_1
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?7.1 durchgef?hrt werden.

RELENG\_7\_0
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?7.0 durchgef?hrt werden.

RELENG\_6
    Der Entwicklungszweig f?r FreeBSD-6.X, auch als FreeBSD 6-STABLE
    bekannt.

RELENG\_6\_4
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?6.4 durchgef?hrt werden.

RELENG\_6\_3
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?6.3 durchgef?hrt werden.

RELENG\_6\_2
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?6.2 durchgef?hrt werden.

RELENG\_6\_1
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?6.1 durchgef?hrt werden.

RELENG\_6\_0
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?6.0 durchgef?hrt werden.

RELENG\_5
    Der FreeBSD?5.X Entwicklungszweig, der auch FreeBSD 5-STABLE genannt
    wird.

RELENG\_5\_5
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?5.5 durchgef?hrt werden.

RELENG\_5\_4
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?5.4 durchgef?hrt werden.

RELENG\_5\_3
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?5.3 durchgef?hrt werden.

RELENG\_5\_2
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?5.2 und FreeBSD?5.2.1 durchgef?hrt
    werden.

RELENG\_5\_1
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?5.1 durchgef?hrt werden.

RELENG\_5\_0
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?5.0 durchgef?hrt werden.

RELENG\_4
    Der FreeBSD?4.X Entwicklungszweig, der auch FreeBSD 4-STABLE genannt
    wird.

RELENG\_4\_11
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.11 durchgef?hrt werden.

RELENG\_4\_10
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.10 durchgef?hrt werden.

RELENG\_4\_9
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.9 durchgef?hrt werden.

RELENG\_4\_8
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.8 durchgef?hrt werden.

RELENG\_4\_7
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.7 durchgef?hrt werden.

RELENG\_4\_6
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.6 und FreeBSD?4.6.2 durchgef?hrt
    werden.

RELENG\_4\_5
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.5 durchgef?hrt werden.

RELENG\_4\_4
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.4 durchgef?hrt werden.

RELENG\_4\_3
    Der Zweig, auf dem sicherheitsrelevante oder kritische
    Fehlerbehebungen f?r FreeBSD?4.3 durchgef?hrt werden.

RELENG\_3
    Der FreeBSD-3.X Entwicklungszweig, der auch 3.X-STABLE genannt wird.

RELENG\_2\_2
    Der FreeBSD-2.2.X Entwicklungszweig, der auch 2.2-STABLE genannt
    wird.

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

A.9.2. Release-Tags
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Tags geben den Zeitpunkt an, an dem eine bestimme FreeBSD-Version
ver?ffentlicht wurde. Das Erstellen einer Release ist in den Dokumenten
``Release Engineering       Information`` und ``Release       Process``
beschrieben. Der ``src``-Baum benutzt Tags, deren Namen mit ``RELENG_``
anfangen. Die B?ume ``ports`` und ``doc`` benutzen Tags, deren Namen mit
``RELEASE`` anfangen. Im Baum ``www`` werden keine Release-Tags
verwendet.

.. raw:: html

   <div class="variablelist">

RELENG\_9\_1\_0\_RELEASE
    FreeBSD 9.1

RELENG\_9\_0\_0\_RELEASE
    FreeBSD 9.0

RELENG\_8\_3\_0\_RELEASE
    FreeBSD 8.3

RELENG\_8\_2\_0\_RELEASE
    FreeBSD 8.2

RELENG\_8\_1\_0\_RELEASE
    FreeBSD 8.1

RELENG\_8\_0\_0\_RELEASE
    FreeBSD 8.0

RELENG\_7\_4\_0\_RELEASE
    FreeBSD 7.4

RELENG\_7\_3\_0\_RELEASE
    FreeBSD 7.3

RELENG\_7\_2\_0\_RELEASE
    FreeBSD 7.2

RELENG\_7\_1\_0\_RELEASE
    FreeBSD 7.1

RELENG\_7\_0\_0\_RELEASE
    FreeBSD 7.0

RELENG\_6\_4\_0\_RELEASE
    FreeBSD 6.4

RELENG\_6\_3\_0\_RELEASE
    FreeBSD 6.3

RELENG\_6\_2\_0\_RELEASE
    FreeBSD 6.2

RELENG\_6\_1\_0\_RELEASE
    FreeBSD 6.1

RELENG\_6\_0\_0\_RELEASE
    FreeBSD 6.0

RELENG\_5\_5\_0\_RELEASE
    FreeBSD 5.5

RELENG\_5\_4\_0\_RELEASE
    FreeBSD 5.4

RELENG\_4\_11\_0\_RELEASE
    FreeBSD 4.11

RELENG\_5\_3\_0\_RELEASE
    FreeBSD 5.3

RELENG\_4\_10\_0\_RELEASE
    FreeBSD 4.10

RELENG\_5\_2\_1\_RELEASE
    FreeBSD 5.2.1

RELENG\_5\_2\_0\_RELEASE
    FreeBSD 5.2

RELENG\_4\_9\_0\_RELEASE
    FreeBSD 4.9

RELENG\_5\_1\_0\_RELEASE
    FreeBSD 5.1

RELENG\_4\_8\_0\_RELEASE
    FreeBSD 4.8

RELENG\_5\_0\_0\_RELEASE
    FreeBSD 5.0

RELENG\_4\_7\_0\_RELEASE
    FreeBSD 4.7

RELENG\_4\_6\_2\_RELEASE
    FreeBSD 4.6.2

RELENG\_4\_6\_1\_RELEASE
    FreeBSD 4.6.1

RELENG\_4\_6\_0\_RELEASE
    FreeBSD 4.6

RELENG\_4\_5\_0\_RELEASE
    FreeBSD 4.5

RELENG\_4\_4\_0\_RELEASE
    FreeBSD 4.4

RELENG\_4\_3\_0\_RELEASE
    FreeBSD 4.3

RELENG\_4\_2\_0\_RELEASE
    FreeBSD 4.2

RELENG\_4\_1\_1\_RELEASE
    FreeBSD 4.1.1

RELENG\_4\_1\_0\_RELEASE
    FreeBSD 4.1

RELENG\_4\_0\_0\_RELEASE
    FreeBSD 4.0

RELENG\_3\_5\_0\_RELEASE
    FreeBSD-3.5

RELENG\_3\_4\_0\_RELEASE
    FreeBSD-3.4

RELENG\_3\_3\_0\_RELEASE
    FreeBSD-3.3

RELENG\_3\_2\_0\_RELEASE
    FreeBSD-3.2

RELENG\_3\_1\_0\_RELEASE
    FreeBSD-3.1

RELENG\_3\_0\_0\_RELEASE
    FreeBSD-3.0

RELENG\_2\_2\_8\_RELEASE
    FreeBSD-2.2.8

RELENG\_2\_2\_7\_RELEASE
    FreeBSD-2.2.7

RELENG\_2\_2\_6\_RELEASE
    FreeBSD-2.2.6

RELENG\_2\_2\_5\_RELEASE
    FreeBSD-2.2.5

RELENG\_2\_2\_2\_RELEASE
    FreeBSD-2.2.2

RELENG\_2\_2\_1\_RELEASE
    FreeBSD-2.2.1

RELENG\_2\_2\_0\_RELEASE
    FreeBSD-2.2.0

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------+--------------------------------------+
| `Zur?ck <cvsup.html>`__?              | `Nach oben <mirrors.html>`__   | ?\ `Weiter <mirrors-rsync.html>`__   |
+---------------------------------------+--------------------------------+--------------------------------------+
| A.8. Benutzen von CVSup (veraltet)?   | `Zum Anfang <index.html>`__    | ?A.10. rsync-Server                  |
+---------------------------------------+--------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
