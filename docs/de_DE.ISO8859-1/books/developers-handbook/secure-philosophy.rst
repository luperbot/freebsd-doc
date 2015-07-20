===================================
3.2. Methoden des sicheren Entwurfs
===================================

.. raw:: html

   <div class="navheader">

3.2. Methoden des sicheren Entwurfs
`Zur?ck <secure.html>`__?
Kapitel 3. Sicheres Programmieren
?\ `Weiter <secure-bufferov.html>`__

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

3.2. Methoden des sicheren Entwurfs
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sichere Anwendungen zu schreiben erfordert eine sehr skeptische und
pessimistische Lebenseinstellung. Anwendungen sollten nach dem Prinzip
der „geringsten Privilegien“ ausgef?hrt werden, sodass kein Prozess mit
mehr als dem absoluten Minimum an Zugriffsrechten arbeitet, die er zum
Erf?llen seiner Aufgabe ben?tigt. Wo es m?glich ist, sollte Quelltext,
der bereits ?berpr?ft wurde, wiederverwendet werden, um h?ufige Fehler,
die andere schon korrigiert haben, zu vermeiden.

Eine der Stolperfallen der UNIX?-Umgebung ist, dass es sehr einfach ist
Annahmen ?ber die Konsistenz der Umgebung zu machen. Anwendungen sollten
Nutzereingaben (in allen Formen) niemals trauen, genauso wenig wie den
System-Ressourcen, der Inter-Prozess-Kommunikation oder dem zeitlichen
Ablauf von Ereignissen. UNIX?-Prozesse arbeiten nicht synchron. Daher
sind logische Operationen selten atomar.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <secure.html>`__?            | `Nach oben <secure.html>`__   | ?\ `Weiter <secure-bufferov.html>`__   |
+--------------------------------------+-------------------------------+----------------------------------------+
| Kapitel 3. Sicheres Programmieren?   | `Zum Anfang <index.html>`__   | ?3.3. Puffer-?berl?ufe                 |
+--------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
