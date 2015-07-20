===================================
15.4. DES, Blowfish, MD5, und Crypt
===================================

.. raw:: html

   <div class="navheader">

15.4. DES, Blowfish, MD5, und Crypt
`Zur?ck <securing-freebsd.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <one-time-passwords.html>`__

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

15.4. DES, Blowfish, MD5, und Crypt
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Teile umgeschrieben und aktualisiert von Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jedem Benutzer eines UNIX? Systems ist ein Passwort zugeordnet. Es
scheint offensichtlich, dass das Passwort nur dem Benutzer und dem
System bekannt sein muss. Um die Passw?rter geheim zu halten, werden sie
mit einer nicht umkehrbaren Hash-Funktion verschl?sselt, das hei?t sie
k?nnen leicht verschl?sselt aber nicht entschl?sselt werden. Was wir
gerade als offensichtlich dargestellt haben, ist also nicht wahr: Das
Betriebssystem kennt das Passwort *wirklich* nicht, es kennt nur das
*verschl?sselte* Passwort. Die einzige M?glichkeit, das originale
Passwort herauszufinden, besteht darin, alle m?glichen Passw?rter
auszuprobieren (*brute force* Suche).

Zu der Zeit als UNIX? entstanden ist, war die einzig sichere M?glichkeit
Passw?rter zu verschl?sseln, leider DES (Data Encryption Standard). F?r
die Einwohner der USA stellte das kein Problem dar, aber da der
Quellcode von DES nicht aus den USA exportiert werden durfte, musste ein
Weg gefunden werden, der die Gesetze der USA nicht verletzte und
gleichzeitig die Kompatibilit?t mit anderen UNIX? Systemen, die immer
noch DES benutzten, wahrte.

Die L?sung bestand darin, die Verschl?sselungsbibliotheken aufzuspalten.
Benutzer in den USA konnten die DES-Bibliotheken installieren und
nutzen. In der Grundeinstellung benutzt FreeBSD MD5 als
Verschl?sselungsmethode, das exportiert werden durfte und damit von
jedem genutzt werden konnte. Es wird davon ausgegangen, dass MD5
sicherer als DES ist, so dass DES nur aus Kompatibilit?tsgr?nden
installiert werden sollte.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.4.1. Erkennen der Verschl?sselungsmethode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Derzeit werden DES-, MD5- und Blowfish-Hash-Funktionen unterst?tzt. In
der Voreinstellung benutzt FreeBSD die MD5-Hash-Funktion.

Sie k?nnen leicht herausfinden, welche Verschl?sselungsmethode von
FreeBSD verwendet wird. Ein Weg besteht darin, die verschl?sselten
Passw?rter in ``/etc/master.passwd`` zu untersuchen. Passw?rter, die mit
MD5 verschl?sselt wurden, sind l?nger als die mit DES verschl?sselten
und beginnen mit den Zeichen ``$1$``. Passw?rter, die mit ``$2a$``
anfangen, wurden mit der Blowfish-Funktion verschl?sselt. DES Passw?rter
besitzen keine offensichtlichen Merkmale, an denen sie identifiziert
werden k?nnten. Sie sind aber k?rzer als MD5-Passw?rter und sind in
einem 64 Zeichen umfassenden Alphabet kodiert, das das ``$``-Zeichen
nicht enth?lt. Ein relativ kurzes Passwort, das nicht mit einem
``$``-Zeichen anf?ngt, ist wahrscheinlich ein DES-Passwort.

Die Verschl?sselungsmethode f?r neue Passw?rter wird durch
``passwd_format`` in ``/etc/login.conf`` bestimmt. Der Wert dieser
Variablen kann entweder ``des``, ``md5`` oder ``blf`` sein. N?heres
schlagen Sie bitte in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
nach.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------------+-------------------------------------------+
| `Zur?ck <securing-freebsd.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <one-time-passwords.html>`__   |
+---------------------------------------+---------------------------------+-------------------------------------------+
| 15.3. Absichern von FreeBSD?          | `Zum Anfang <index.html>`__     | ?15.5. Einmalpassw?rter                   |
+---------------------------------------+---------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
