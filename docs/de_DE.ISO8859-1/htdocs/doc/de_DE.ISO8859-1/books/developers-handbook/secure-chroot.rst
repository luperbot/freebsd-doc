==============================================
3.5. Die Umgebung ihrer Programme einschr?nken
==============================================

.. raw:: html

   <div class="navheader">

3.5. Die Umgebung ihrer Programme einschr?nken
`Zur?ck <secure-setuid.html>`__?
Kapitel 3. Sicheres Programmieren
?\ `Weiter <secure-trust.html>`__

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

3.5. Die Umgebung ihrer Programme einschr?nken
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die herk?mmliche Methode, um einen Prozess einzuschr?nken, besteht in
dem Systemaufruf ``chroot()``. Dieser Aufruf ?ndert das
Wurzelverzeichnis, auf das sich alle Pfadangaben des Prozesses und
jegliche Kind-Prozesse beziehen. Damit dieser Systemaufruf gelingt, muss
der Prozess Ausf?hrungsrechte (Durchsuchungsrechte) f?r das Verzeichnis
haben, auf das er sich bezieht. Die neue Umgebung wird erst wirksam,
wenn Sie mittels ``chdir()`` in Ihre neue Umgebung wechseln. Es sollte
erw?hnt werden, dass ein Prozess recht einfach aus der chroot-Umgebung
ausbrechen kann, wenn er root-Rechte besitzt. Das kann man erreichen,
indem man Ger?tedateien anlegt, um Kernel-Speicher zu lesen, oder indem
man einen Debugger mit einem Prozess au?erhalb seiner
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__-Umgebung
verbindet, oder auf viele andere kreative Wege.

Das Verhalten des Systemaufrufs ``chroot()`` kann durch die
kern.chroot.allow\_open\_directories ``sysctl``-Variable beeinflusst
werden. Wenn diese auf 0 gesetzt ist, wird ``chroot()`` mit EPERM
fehlschlagen, wenn irgendwelche Verzeichnisse ge?ffnet sind. Wenn die
Variable auf den Standardwert 1 gesetzt ist, wird ``chroot()`` mit EPERM
fehlschlagen, wenn irgendwelche Verzeichnisse ge?ffnet sind und sich der
Prozess bereits in einer ``chroot()``-Umgebung befindet. Bei jedem
anderen Wert wird die ?berpr?fung auf ge?ffnete Verzeichnisse komplett
umgangen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.5.1. Die Jail-Funktionalit?t in FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Konzept einer Jail (Gef?ngnis) erweitert ``chroot()``, indem es die
Macht des Superusers einschr?nkt, um einen echten 'virtuellen Server' zu
erzeugen. Wenn ein solches Gef?ngnis einmal eingerichtet ist, muss die
gesamte Netzwerkkommunikation ?ber eine bestimmte IP-Adresse erfolgen
und die "root-Privilegien" innerhalb der Jail sind sehr stark
eingeschr?nkt.

Solange Sie sich in einer Jail befinden, werden alle Tests auf
Superuser-Rechte durch den Aufruf von ``suser()`` fehlschlagen.
Allerdings wurden einige Aufrufe von ``suser()`` abge?ndert, um die neue
``suser_xxx()``-Schnittstelle zu implementieren. Diese Funktion ist
daf?r verantwortlich, festzustellen, ob bestimmte Superuser-Rechte einem
eingesperrten Prozess zur Verf?gung stehen.

Ein Superuser-Prozess innerhalb einer Jail darf folgendes:

.. raw:: html

   <div class="itemizedlist">

-  Berechtigungen ver?ndern mittels: ``setuid``, ``seteuid``,
   ``setgid``, ``setegid``, ``setgroups``, ``setreuid``, ``setregid``,
   ``setlogin``
-  Ressourcenbegrenzungen setzen mittels ``setrlimit``
-  Einige sysctl-Variablen (kern.hostname) ver?ndern
-  ``chroot()``
-  Ein Flag einer vnode setzen: ``chflags``, ``fchflags``
-  Attribute einer vnode setzen wie Dateiberechtigungen, Eigent?mer,
   Gruppe, Gr??e, Zugriffszeit und Modifikationszeit
-  Binden eines Prozesses an einen ?ffentlichen privilegierten Port
   (ports < 1024)

.. raw:: html

   </div>

``Jail``\ s sind ein m?chtiges Werkzeug, um Anwendungen in einer
sicheren Umgebung auszuf?hren, aber sie haben auch ihre Nachteile.
Derzeit wurden die IPC-Mechanismen noch nicht an ``suser_xxx``
angepasst, so dass Anwendungen wie MySQL nicht innerhalb einer Jail
ausgef?hrt werden k?nnen. Der Superuser-Zugriff hat in einer Jail nur
eine sehr eingeschr?nkte Bedeutung, aber es gibt keine M?glichkeit zu
definieren was "sehr eingeschr?nkt" hei?t.

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

3.5.2. POSIX?.1e Prozess Capabilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

POSIX? hat einen funktionalen Entwurf (Working Draft) herausgegeben, der
Ereignis?berpr?fung, Zugriffskontrolllisten, feiner einstellbare
Privilegien, Informationsmarkierung und verbindliche Zugriffskontrolle
enth?lt.

Dies ist im Moment in Arbeit und das Hauptziel des
`TrustedBSD <http://www.trustedbsd.org/>`__-Projekts. Ein Teil der
bisherigen Arbeit wurde in FreeBSD-CURRENT ?bernommen
(cap\_set\_proc(3)).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <secure-setuid.html>`__?   | `Nach oben <secure.html>`__   | ?\ `Weiter <secure-trust.html>`__   |
+------------------------------------+-------------------------------+-------------------------------------+
| 3.4. SetUID-Themen?                | `Zum Anfang <index.html>`__   | ?3.6. Vertrauen                     |
+------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
