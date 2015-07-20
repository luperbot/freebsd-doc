===============================
5.2. MAINTAINER eines Makefiles
===============================

.. raw:: html

   <div class="navheader">

5.2. ``MAINTAINER`` eines Makefiles
`Zur?ck <policies.html>`__?
Kapitel 5. Vorgaben und Richtlinien f?r das Quelltextverzeichnis
?\ `Weiter <policies-contributed.html>`__

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

5.2. ``MAINTAINER`` eines Makefiles
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein bestimmter Bereich der FreeBSD ``src/``-Distribution von einer
Person oder Gruppe gepflegt wird, kann dies durch einen Eintrag in die
Datei ``src/MAINTAINERS`` der ?ffentlichkeit mitgeteilt werden.
Maintainer eines Ports in der Ports-Sammlung k?nnen ihre Verantwortung
?ber den Port durch einen Eintrag in die ``MAINTAINER``-Zeile im
``Makefile`` des Ports der Welt mitteilen.

.. code:: programlisting

    MAINTAINER= email-addresses

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

F?r andere Teile des Repositories oder andere Abschnitte, die noch
keinen Maintainer aufweisen, oder falls Sie sich nicht sicher sind, wer
der Maintainer ist, sehen Sie sich die Commit-Historie des betreffenden
Ports an. Es ist recht h?ufig der Fall, dass ein Maintainer nicht
explizit aufgef?hrt ist, aber trotzdem diejenigen Personen, die den Port
seit den letzten paar Jahren aktiv betreuen, daran interessiert sind,
?nderungen zu begutachten. Selbst wenn dies nicht explizit in der
Dokumentation oder im Quellcode erw?hnt ist, wird es trotzdem als
h?fliche Geste angesehen, wenn man nach einer ?berpr?fung der eigenen
?nderungen fragt.

.. raw:: html

   </div>

Die Rolle eines Maintainers ist die folgende:

.. raw:: html

   <div class="itemizedlist">

-  Der Maintainer ist verantwortlich f?r diesen Code. Er oder sie muss
   einerseits f?r die Behebung von Fehlern und das Beantworten von
   Problemberichten f?r diesen Code die Verantwortung tragen und
   andererseits, falls es sich um beigesteuerte Software handelt, neue
   Versionen verfolgen und bereitstellen.

-  ?nderungen an Verzeichnissen, die ein Maintainer definiert hat,
   sollten an den Maintainer f?r eine ?berpr?fung gesendet werden, bevor
   diese committet werden. Nur wenn der Maintainer in einer
   inakzeptablen Zeitspanne auf mehrere E-Mails nicht antwortet, k?nnen
   die ?nderungen, die mit dem Commit in Kraft treten, auch ohne
   ?berpr?fung durch den Maintainer vollzogen werden. Dennoch wird
   empfohlen, dass die ?nderungen, falls m?glich, von jemand anderem
   ?berpr?ft werden.

-  Es ist nat?rlich nicht akzeptabel, einer Person oder Gruppe den
   Status eines Maintainers zu geben, so lange sie nicht zustimmt, diese
   Pflicht auf sich zu nehmen. Andererseits muss es kein einzelner
   Mensch sein. Eine Gruppe von Menschen ist genauso in Ordnung.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------------+---------------------------------+---------------------------------------------+
| `Zur?ck <policies.html>`__?                                         | `Nach oben <policies.html>`__   | ?\ `Weiter <policies-contributed.html>`__   |
+---------------------------------------------------------------------+---------------------------------+---------------------------------------------+
| Kapitel 5. Vorgaben und Richtlinien f?r das Quelltextverzeichnis?   | `Zum Anfang <index.html>`__     | ?5.3. Beigesteuerte Software                |
+---------------------------------------------------------------------+---------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
