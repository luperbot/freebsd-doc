==========================
9.7. Wenn etwas schiefgeht
==========================

.. raw:: html

   <div class="navheader">

9.7. Wenn etwas schiefgeht
`Zur?ck <kernelconfig-config.html>`__?
Kapitel 9. Konfiguration des FreeBSD-Kernels
?\ `Weiter <printing.html>`__

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

9.7. Wenn etwas schiefgeht
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt vier Hauptfehlerquellen beim Erstellen eines angepassten
Kernels:

.. raw:: html

   <div class="variablelist">

``config`` verursacht Fehler:
    Wenn
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
    misslingt, liegen Fehler in der Kernelkonfigurationsdatei vor. Zum
    Gl?ck gibt
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
    die die Zeilennummer der Fehlerstelle an, sodass Sie den Fehler
    schnell finden k?nnen. Beispielsweise k?nnten Sie folgende
    Fehlermeldung sehen:

    .. code:: screen

        config: line 17: syntax error

    Vergleichen Sie die angegebene Zeile mit ``GENERIC`` und stellen Sie
    sicher, dass das Schl?sselwort richtig geschrieben ist.

``make`` verursacht Fehler:
    Wenn ``make`` misslingt, liegen meistens Fehler in der
    Konfigurationsdatei vor, die aber nicht schwerwiegend genug f?r
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
    waren. ?berpr?fen Sie wiederum Ihre Konfiguration und wenn Sie
    keinen Fehler entdecken k?nnen, schicken Sie eine E-Mail mit Ihrer
    Kernelkonfiguration an die Mailingliste 'Fragen und Antworten zu
    FreeBSD' ``<de-bsd-questions@de.FreeBSD.org>``. Sie sollten dann
    schnell Hilfe erhalten.

Der Kernel bootet nicht:
    Wenn der Kernel nicht booten will, ist das noch lange kein Grund zur
    Panik. Denn FreeBSD besitzt exzellente Mechanismen zur
    Wiederherstellung nach dem Einsatz inkompatibler Kernel. Den Kernel,
    mit dem Sie booten wollen, k?nnen Sie sich im FreeBSD Boot-Loader
    aussuchen. Dazu w?hlen Sie im Bootmen? die Option „Escape to a
    loader prompt“. Danach geben Sie den Befehl ``boot kernel.old`` oder
    den Namen eines anderen Kernels ein, der sauber bootet. F?r alle
    F?lle sollten Sie immer einen Kernel, der garantiert bootet, bereit
    halten.

    Nun k?nnen Sie die Konfiguration noch einmal ?berpr?fen und den
    Kernel neu kompilieren. Dazu ist ``/var/log/messages`` sehr
    n?tzlich, da hier s?mtliche Kernelmeldungen von jedem erfolgreichen
    Bootvorgang gespeichert werden.
    `dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
    gibt Ihnen die Kernelmeldungen vom letzten Bootvorgang aus.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    F?r den Fall, dass Sie Probleme bei dem Kernelbau bekommen, heben
    Sie sich immer einen ``GENERIC`` oder einen anderen Kernel, der
    garantiert bootet, auf. Der Name dieses Kernels sollte so gew?hlt
    sein, dass er beim n?chsten Bau nicht ?berschrieben wird. Sie k?nnen
    sich nicht auf ``kernel.old`` verlassen, da dieser Kernel durch den
    zuletzt installierten Kernel, der vielleicht schon kaputt war,
    w?hrend der Installation ersetzt wird. Kopieren Sie den
    funktionierenden Kernel so schnell wie m?glich in das richtige
    Verzeichnis (``/boot/kernel``). Ansonsten funktionieren Kommandos
    wie
    `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
    nicht. Benennen Sie dazu einfach das Verzeichnis des
    funktionierenden Kernels um:

    .. code:: screen

        # mv /boot/kernel /boot/kernel.bad
        # mv /boot/kernel.good /boot/kernel

    .. raw:: html

       </div>

Der Kernel ist in Ordnung, aber ``ps`` geht nicht mehr:
    Wenn Sie eine andere Version des Kernels installiert haben als die,
    mit der Ihre Systemwerkzeuge gebaut wurden (beispielsweise einen
    -CURRENT-Kernel auf einem -RELEASE-System), werden Programme wie
    `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
    und
    `vmstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vmstat&sektion=8>`__
    nicht mehr funktionieren. Sie sollten nun das `komplette System neu
    bauen und installieren <makeworld.html>`__. Achten Sie darauf, dass
    die Quellen, aus denen Sie das System bauen, zum installierten
    Kernel passen. Das ist ein Grund daf?r, warum man nie einen Kernel,
    der nicht zur Systemversion passt, benutzen sollten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------------+---------------------------------+
| `Zur?ck <kernelconfig-config.html>`__?   | `Nach oben <kernelconfig.html>`__   | ?\ `Weiter <printing.html>`__   |
+------------------------------------------+-------------------------------------+---------------------------------+
| 9.6. Die Kernelkonfigurationsdatei?      | `Zum Anfang <index.html>`__         | ?Kapitel 10. Drucken            |
+------------------------------------------+-------------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
