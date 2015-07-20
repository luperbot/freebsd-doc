===============================
5. Tilpasset Post-Install Pakke
===============================

.. raw:: html

   <div class="navheader">

5. Tilpasset Post-Install Pakke
`forrige <install-setup.html>`__?
?
?

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

5. Tilpasset Post-Install Pakke
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Du kan bruge scriptet ```pkgmaker.sh `` <pkgmaker.sh>`__ til at lave en
tilpasset pakke til post install. Ideen er at have den til at installere
og konfigurere de specielle ting du vil have gjort. ``pkgmaker`` K?res i
mappen ovenover den pakke du ?nsker at lave med det ene argument fra
pakken (f. eks mypkg) som s? vil lave en mypkg.tgz som du s? kan
inkludere i din sysinstall pakke.

Inde i din mappe med tilpassede pakker vil du have en fil kaldet
``PLIST`` som indeholder alle de filer du ?nsker at installere og f?
inkorporeret i din pakke.

Du vil ogs? ?nske dig at have nogle filer kaldet ```pre`` <pre>`__ og
```post`` <post>`__ i den mappe, disse er shell scripts som du vil
eksekverer f?r og efter din pakke er installeret.

Siden denne pakke er i din ``install.cfg`` fil burde den blive k?rt og
lave den sidste konfiguration for dig.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-----+
| `forrige <install-setup.html>`__?   | ?                       | ?   |
+-------------------------------------+-------------------------+-----+
| 4. Installations ops?tning?         | `hjem <index.html>`__   | ?   |
+-------------------------------------+-------------------------+-----+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
