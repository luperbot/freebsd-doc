=======================
5.4. Belastende Dateien
=======================

.. raw:: html

   <div class="navheader">

5.4. Belastende Dateien
`Zur?ck <policies-contributed.html>`__?
Kapitel 5. Vorgaben und Richtlinien f?r das Quelltextverzeichnis
?\ `Weiter <policies-shlib.html>`__

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

5.4. Belastende Dateien
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es kann gelegentlich notwendig sein, belastende Dateien in den
FreeBSD-Quelltextbaum zu integrieren. Braucht ein Ger?t zum Beispiel ein
St?ck bin?ren Code, der zuerst geladen werden muss, bevor das Ger?t
funktioniert, und wir haben keine Quellen zu diesem Code, dann wird die
bin?re Datei als belastend bezeichnet. Die folgenden Richtlinien sind
beim Aufnehmen von belastenden Dateien in den FreeBSD-Quelltextbaum zu
beachten.

.. raw:: html

   <div class="orderedlist">

#. Jede Datei, die durch die System-CPU(s) ausgef?hrt wird und nicht als
   Quelltext vorliegt, ist belastend.

#. Jede Datei, deren Lizenz restriktiver ist als die BSD- oder
   GNU-Lizenz, ist belastend.

#. Eine Datei, die herunterladbare Bin?r-Daten enth?lt, ist nur
   belastend, wenn (1) oder (2) zutreffen. Sie muss in einem
   ASCII-Format gespeichert werden, das Architektur-neutral ist (file2c
   oder uuencoding wird empfohlen).

#. Jede belastende Datei braucht eine spezielle Genehmigung vom
   `Core-Team <../../../../administration.html#t-core>`__, bevor diese
   in das Repository aufgenommen werden darf.

#. Belastende Dateien liegen unter ``src/contrib`` oder
   ``src/sys/contrib``.

#. Das komplette Modul sollte auch am St?ck aufbewahrt werden. Es gibt
   keinen Grund, dieses zu teilen, au?er es gibt einen Code-Austausch
   mit Quelltext, der nicht belastend ist.

#. Objekt-Dateien werden wie folgt benannt: ``arch/filename.o.uu>``.

#. Kernel-Dateien:

   .. raw:: html

      <div class="orderedlist">

   #. Sollten immer nach ``conf/files.*`` verweisen (um den Bau einfach
      zu halten).

   #. Sollten sich immer in ``LINT`` befinden, jedoch entscheidet das
      `Core-Team <../../../../administration.html#t-core>`__ je nach
      Fall, ob es auskommentiert wird oder nicht. Das
      `Core-Team <../../../../administration.html#t-core>`__ kann sich
      zu einem sp?teren Zeitpunkt immer noch anders entscheiden.

   #. Der *Release-Engineer* entscheidet, ob es in ein Release
      aufgenommen wird oder nicht.

   .. raw:: html

      </div>

#. Userland-Dateien:

   .. raw:: html

      <div class="orderedlist">

   #. 

      Das `Core-Team <../../../../administration.html#t-core>`__
      entscheidet, ob der Code von ``make world`` gebaut wird oder
      nicht.

   #. 

      Der `Release-Engineer <../../../../administration.html#t-re>`__
      entscheidet, ob es in das Release aufgenommen wird oder nicht.

   .. raw:: html

      </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------+---------------------------------------+
| `Zur?ck <policies-contributed.html>`__?   | `Nach oben <policies.html>`__   | ?\ `Weiter <policies-shlib.html>`__   |
+-------------------------------------------+---------------------------------+---------------------------------------+
| 5.3. Beigesteuerte Software?              | `Zum Anfang <index.html>`__     | ?5.5. Shared-Libraries                |
+-------------------------------------------+---------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
