=================================
21.5. Delegierbare Administration
=================================

.. raw:: html

   <div class="navheader">

21.5. Delegierbare Administration
`Zur?ck <zfs-zfs.html>`__?
Kapitel 21. Das Z-Dateisystem (ZFS)
?\ `Weiter <zfs-advanced.html>`__

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

21.5. Delegierbare Administration
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein umfassendes System zur Berechtigungs?bertragung erlaubt
unprivilegierten Benutzern, ZFS-Administrationsaufgaben durchzuf?hren.
Beispielsweise, wenn jedes Heimatverzeichnis eines Benutzers ein Dataset
ist, k?nnen Benutzer das Recht darin erhalten, Schnappsch?sse zu
erstellen und zu zerst?ren. Einem Benutzer f?r die Sicherung kann die
Erlaubnis einger?umt werden, die Replikationseigenschaft zu verwenden.
Einem Skript zum Sammeln von Speicherplatzverbrauch kann die
Berechtigung gegeben werden, nur auf die Verbrauchsdaten aller Benutzer
zuzugreifen. Es ist sogar m?glich, die M?glichkeit zum Delegieren zu
delegieren. Die Berechtigung zur Delegation ist f?r jedes Unterkommando
und die meisten Eigenschaften m?glich.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.5.1. Delegieren, ein Dataset zu erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``zfs allow       someuser`` create *``mydataset``* gibt dem angegebenen
Benutzer die Berechtigung, Kind-Datasets unter dem ausgew?hlten
Elterndataset anzulegen. Es gibt einen Haken: ein neues Dataset
anzulegen beinhaltet, dass es eingeh?ngt wird. Dies bedeutet, dass
FreeBSDs ``vfs.usermount``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
auf ``1`` gesetzt wird, um nicht-root Benutzern zu erlauben,
Dateisysteme einzubinden. Es gibt eine weitere Einschr?nkung um
Missbrauch zu verhindern: nicht-\ ``root`` Benutzer m?ssen Besitzer des
Einh?ngepunktes sein, an dem das Dateisystem eingebunden werden soll.

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

21.5.2. Delegationsberechtigung delegieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``zfs allow       someuser`` allow *``mydataset``* gibt dem angegebenen
Benutzer die F?higkeit, jede Berechtigung, die er selbst auf dem Dataset
oder dessen Kindern besitzt, an andere Benutzer weiterzugeben. Wenn ein
Benutzer die ``snapshot``- und die ``allow``-Berechtigung besitzt, kann
dieser dann die ``snapshot``-Berechtigung an andere Benutzer delegieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <zfs-zfs.html>`__?      | `Nach oben <zfs.html>`__      | ?\ `Weiter <zfs-advanced.html>`__    |
+---------------------------------+-------------------------------+--------------------------------------+
| 21.4. ``zfs`` Administration?   | `Zum Anfang <index.html>`__   | ?21.6. Themen f?r Fortgeschrittene   |
+---------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
