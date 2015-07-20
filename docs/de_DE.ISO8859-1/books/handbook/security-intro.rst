================
15.2. Einf?hrung
================

.. raw:: html

   <div class="navheader">

15.2. Einf?hrung
`Zur?ck <security.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <securing-freebsd.html>`__

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

15.2. Einf?hrung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sicherheit ist ein Konzept, das beim Systemadministrator anf?ngt und
aufh?rt. Obwohl alle BSD UNIX? Mehrbenutzersysteme ?ber
Sicherheitsfunktionen verf?gen, ist es wohl eine der gr??ten Aufgaben
eines Systemadministrators zus?tzliche Sicherheitsmechanismen zu
erstellen und zu pflegen. Maschinen sind nur so sicher wie sie gemacht
werden und Sicherheitsanforderungen stehen oft der
Benutzerfreundlichkeit entgegen. Auf UNIX? Systemen k?nnen sehr viele
Prozesse gleichzeitig laufen und viele dieser Prozesse sind Server, das
hei?t von au?en kann auf sie zugegriffen werden. In einer Zeit, in der
die Minicomputer und Mainframes von gestern die Desktops von heute sind
und Rechner immer mehr vernetzt werden, kommt der Sicherheit eine gro?e
Bedeutung zu.

Zur Systemsicherheit geh?rt auch die Besch?ftigung mit verschiedenen
Arten von Angriffen, auch solchen, die versuchen, ein System still zu
legen, oder sonst unbrauchbar zu machen ohne ``root`` zu
kompromittieren. Sicherheitsaspekte lassen sich in mehrere Kategorien
unterteilen:

.. raw:: html

   <div class="orderedlist">

#. Denial-of-Service Angriffe.

#. Kompromittierte Accounts.

#. Kompromittierter ``root``-Account durch zugreifbare Server.

#. Kompromittierter ``root``-Account durch kompromittierte Accounts.

#. Einrichten von Hintert?ren.

.. raw:: html

   </div>

Ein Denial-of-Service (Verhinderung von Diensten, DoS) Angriff entzieht
einer Maschine Ressourcen, die sie zur Bereitstellung von Diensten
ben?tigt. Meist versuchen Denial-of-Service Angriffe die Dienste oder
den Netzwerkstack einer Maschine zu ?berlasten, um so die Maschine
auszuschalten oder nicht nutzbar zu machen. Einige Angriffe versuchen,
Fehler im Netzwerkstack auszunutzen, und die Maschine mit einem einzigen
Paket auszuschalten. Diese Art des Angriffs kann nur verhindert werden,
indem der entsprechende Fehler im Kernel behoben wird. Oft k?nnen
Angriffe auf Dienste durch die Angabe von Optionen verhindert werden,
die die Last, die ein Dienst auf das System unter widrigen Umst?nden
aus?ben kann, begrenzt. Angriffen auf das Netzwerk ist schwerer zu
begegnen. Au?er durch Trennen der Internetverbindung ist zum Beispiel
einem Angriff mit gef?lschten Paketen nicht zu begegnen. Diese Art von
Angriff wird Ihr System zwar nicht unbrauchbar machen, kann aber die
Internetverbindung s?ttigen.

Kompromittierte Accounts kommen noch h?ufiger als DoS Angriffe vor.
Viele Systemadministratoren lassen auf ihren Maschinen noch die Dienste
telnetd, rlogind, rshd und ftpd laufen. Verbindungen zu diesen Servern
werden nicht verschl?sselt. Wenn Sie eine gr??ere Benutzerzahl auf Ihrem
System haben, die sich von einem entfernten System anmelden, ist die
Folge davon, dass das Passwort eines oder mehrerer Benutzer ausgesp?ht
wurde. Ein aufmerksamer Systemadministrator wird die Logs ?ber
Anmeldungen von entfernten Systemen auf verd?chtige Quelladressen, auch
f?r erfolgreiche Anmeldungen, untersuchen.

Es ist immer davon auszugehen, dass ein Angreifer, der Zugriff auf einen
Account hat, Zugang zum ``root``-Account erlangt. Allerdings gibt der
Zugriff auf einen Account auf einem gut gesicherten und gepflegten
System nicht notwendig Zugriff auf den ``root``-Account. Diese
Unterscheidung ist wichtig, da ein Angreifer, der keinen Zugang zu
``root`` besitzt, seine Spuren nicht verwischen kann. Er kann h?chstens
die Dateien des betreffenden Benutzers ver?ndern oder die Maschine
stilllegen. Kompromittierte Accounts sind sehr h?ufig, da Benutzer meist
nicht dieselben Vorsichtsma?nahmen wie Administratoren treffen.

Es gibt viele Wege, Zugang zum ``root``-Account eines Systems zu
bekommen: Ein Angreifer kann das Passwort von ``root`` kennen, er kann
einen Fehler in einem Server entdecken, der unter ``root`` l?uft und
dann ?ber eine Netzwerkverbindung zu diesem Server einbrechen. Oder er
kennt einen Fehler in einem SUID-\ ``root`` Programm, der es ihm
erlaubt, ``root`` zu werden, wenn er einmal einen Account kompromittiert
hat. Wenn ein Angreifer einen Weg gefunden hat, ``root`` zu werden,
braucht er vielleicht keine Hintert?r auf dem System installieren. Viele
der heute bekannten und geschlossenen Sicherheitsl?cher, die zu einem
``root`` Zugriff f?hren, verlangen vom Angreifer einen erheblichen
Aufwand, um seine Spuren zu verwischen. Aus diesem Grund wird er sich
wahrscheinlich entschlie?en, eine Hintert?r (engl. *Backdoor*) zu
installieren. Eine Hintert?r erlaubt es dem Angreifer leicht auf den
``root``-Account zuzugreifen. Einem klugen Systemadministrator erlaubt
sie allerdings auch, den Einbruch zu entdecken. Wenn Sie es einem
Angreifer verwehren, Hintert?ren zu installieren, kann das sch?dlich f?r
Ihre Sicherheit sein, da es vielleicht verhindert, dass die L?cke, die
der Angreifer f?r den Einbruch ausgenutzt hat, entdeckt wird.

Sicherheitsma?nahmen sollten immer in mehreren Schichten angelegt
werden. Die Schichten k?nnen wie folgt eingeteilt werden:

.. raw:: html

   <div class="orderedlist">

#. Absichern von ``root`` und Accounts.

#. Absichern von unter ``root`` laufenden Servern und SUID/SGID
   Programmen.

#. Absichern von Accounts.

#. Absichern der Passwort-Datei.

#. Absichern des Kernels, der Ger?te und von Dateisystemen.

#. Schnelles Aufdecken von unbefugten Ver?nderungen des Systems.

#. Paranoia.

.. raw:: html

   </div>

Die einzelnen Punkte der obigen Liste werden im n?chsten Abschnitt
genauer behandelt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+---------------------------------+-----------------------------------------+
| `Zur?ck <security.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <securing-freebsd.html>`__   |
+-------------------------------+---------------------------------+-----------------------------------------+
| Kapitel 15. Sicherheit?       | `Zum Anfang <index.html>`__     | ?15.3. Absichern von FreeBSD            |
+-------------------------------+---------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
