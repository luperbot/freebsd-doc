====================================
10. Einige abschlie?ende Bemerkungen
====================================

.. raw:: html

   <div class="navheader">

10. Einige abschlie?ende Bemerkungen
`Zur?ck <your-working-environment.html>`__?
?
?\ `Weiter <comments-welcome.html>`__

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

10. Einige abschlie?ende Bemerkungen
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als ``root`` k?nnen Sie das CD-ROM-Laufwerk mit ``/sbin/umount /cdrom``
abh?ngen, eine andere CD-ROM einlegen und mit
``/sbin/mount_cd9660 /dev/cd0a     /cdrom`` wieder einh?ngen (falls cd0a
der Devicename Ihres CD-ROM-Laufwerkes ist). Bei neueren
FreeBSD-Versionen muss daf?r nur ``/sbin/mount /cdrom`` eingegeben
werden.

Das Live-Filesystem (die zweite FreeBSD-CD-ROM) kann hilfreich sein,
wenn auf Ihrem System nur begrenzt Speicherplatz vorhanden ist. Was
genau auf dieser Live-CD enthalten ist, variiert von Ausgabe zu Ausgabe.
Vielleicht k?nnen verschiedene Spiele von CD-ROM gespielt werden. Dazu
muss aber auch ``lndir`` vorhanden sein, damit diese Programme wissen,
wo sie die von ihnen ben?tigten Dateien finden, da sich diese unter
``/cdrom`` und nicht unter ``/usr`` und den entsprechenden
Unterverzeichnissen befinden, wie es diese Programme erwarten. Lesen Sie
dazu auch
`lndir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lndir&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <your-working-environment.html>`__?   | ?                             | ?\ `Weiter <comments-welcome.html>`__   |
+-----------------------------------------------+-------------------------------+-----------------------------------------+
| 9. Die Arbeitsumgebung?                       | `Zum Anfang <index.html>`__   | ?11. Kommentare                         |
+-----------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
