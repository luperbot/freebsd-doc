==========================
16.2. Jails - Definitionen
==========================

.. raw:: html

   <div class="navheader">

16.2. Jails - Definitionen
`Zur?ck <jails.html>`__?
Kapitel 16. Jails
?\ `Weiter <jails-intro.html>`__

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

16.2. Jails - Definitionen
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die f?r den Einsatz von Jails ben?tigten FreeBSD-Funktionen, deren
Interna sowie die Art und Weise, mit der diese mit anderen Teilen des
Betriebssystems interagieren, zu erl?utern, werden in diesem Kapitel
folgende Definitionen verwendet:

.. raw:: html

   <div class="variablelist">

`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
(-Befehl)
    Ein Werkzeug, das den FreeBSD-Systemaufruf
    `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
    verwendet, um das Wurzelverzeichnis eines Prozesses und all seiner
    Nachk?mmlinge zu ?ndern.

`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
(-Umgebung)
    Die Umgebung eines Prozesses, der in einem „chroot“ l?uft. Diese
    beinhaltet Ressourcen, wie zum Beispiel sichtbare Abschnitte des
    Dateisystems, verf?gbare Benutzer- und Gruppenkennungen,
    Netzwerkschnittstellen und weitere IPC-Mechanismen und so weiter.

`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
(-Befehl)
    Das Systemadministrationswerkzeug, welches es erlaubt, Prozesse
    innerhalb der Jail-Umgebung zu starten.

Host (-Benutzer, -Prozess, -System)
    Das verwaltende System einer Jail-Umgebung. Das Host-System hat
    Zugriff auf alle verf?gbaren Hardwareressourcen und kann sowohl
    innerhalb als auch ausserhalb der Jail-Umgebung Prozesse steuern.
    Einer der wichtigsten Unterschiede des Host-System einer Jails ist,
    dass die Einschr?nkungen, welche f?r die Superuser-Prozesse
    innerhalb eines Jails gelten, nicht f?r die Prozesse des
    Host-Systems gelten.

Gast (-Benutzer, -Prozess, -System)
    Ein Prozess, ein Benutzer oder eine andere Instanz, deren Zugriff
    durch eine FreeBSD-Jail eingeschr?nkt ist.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------------+------------------------------------+
| `Zur?ck <jails.html>`__?   | `Nach oben <jails.html>`__    | ?\ `Weiter <jails-intro.html>`__   |
+----------------------------+-------------------------------+------------------------------------+
| Kapitel 16. Jails?         | `Zum Anfang <index.html>`__   | ?16.3. Einf?hrung                  |
+----------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
