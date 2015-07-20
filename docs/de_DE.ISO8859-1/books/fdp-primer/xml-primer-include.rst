====================================
7.7. Dateien mit Entit?ten einbinden
====================================

.. raw:: html

   <div class="navheader">

7.7. Dateien mit Entit?ten einbinden
`Zur?ck <xml-primer-entities.html>`__?
Kapitel 7. Die XML-Fibel
?\ `Weiter <xml-primer-marked-sections.html>`__

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

7.7. Dateien mit Entit?ten einbinden
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sowohl
`Allgemeine <xml-primer-entities.html#xml-primer-general-entities>`__
als auch
`Parameterentit?ten <xml-primer-entities.html#xml-primer-parameter-entities>`__
sind n?tzliche Helfer, wenn es darum geht, eine Datei in eine andere
einzubinden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.7.1. Dateien mit Allgemeinen Entit?ten einbinden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Angenommen man hat ein Buch geschrieben, dessen Inhalt auf mehrere
Dateien aufgeteilt und mittels SGML ausgezeichnet. Jedes Kapitel wurde
dazu in einer eigenen Datei (``kapitel1.xml``, ``kapitel2.xml`` usw.)
abgelegt und ?ber eine Datei ``buch.xml`` sollen alle physischen Dateien
wieder mit der Hilfe von Entit?ten zu einem logischen Dokument
zusammengef?hrt werden.

Damit der Inhalt der Dateien mit Entit?ten eingebunden werden kann, muss
die Deklaration der Entit?ten das Schl?sselwort ``SYSTEM`` enthalten.
SGML-Parser werden so angewiesen, den Inhalt der referenzierten Datei
als Wert f?r die jeweilige Entit?t zu nehmen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.12. Dateien mit Allgemeinen Entit?ten einbinden

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
    <!ENTITY kapitel.1 SYSTEM "kapitel1.xml">
    <!ENTITY kapitel.2 SYSTEM "kapitel2.xml">
    <!ENTITY kapitel.3 SYSTEM "kapitel3.xml">
    ]>

    <html>

      &amp;kapitel.1;
      &amp;kapitel.2;
      &amp;kapitel.3;
    </html>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Wenn man Allgemeine Entit?ten benutzt, um andere Dateien einzubinden,
d?rfen diese Dateien (``kapitel1.xml``, ``kapitel2.xml``, ...) *keine*
eigene DOCTYPE-Deklaration haben.

.. raw:: html

   </div>

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

7.7.2. Dateien mit Parameterentit?ten einbinden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie bereits festgestellt, k?nnen Parameterentit?ten nur innerhalb eines
SGML-Kontexts genutzt werden. Warum m?chte man aber Dateien innerhalb
eines SGML-Kontexts einbinden? Der Vorteil liegt in der M?glichkeit, die
Deklaration von Entit?ten in eine andere Datei auslagern zu k?nnen,
wodurch diese leichter wiederverwendbar sind.

Angenommen das Buch aus dem vorherigen Kapitel besteht aus sehr vielen
Kapiteln und diese sollen auch in einem anderen Buch, aber in einer
anderen Reihenfolge, verwendet werden. Eine M?glichkeit w?re es, die
daf?r notwendigen Entit?ten am Anfang jedes Buches einzeln festzulegen –
was allerdings mit der Zeit unhandlich und fehlertr?chtig wird.

Alternativ bietet sich dazu an, die Deklarationen in eine separate Datei
auszulagern und deren Inhalt anschlie?end in beide B?cher ?ber
Parameterentit?ten einzubinden.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.13. Dateien mit Parameterentit?ten einbinden

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Zuerst werden die Entit?ten in einer separaten Datei namens
``kapitel.ent`` deklariert. ``kapitel.ent`` enth?lt f?r dieses Beispiel
die folgenden Zeilen:

.. code:: programlisting

    <!ENTITY kapitel.1 SYSTEM "kapitel1.xml">
    <!ENTITY kapitel.2 SYSTEM "kapitel2.xml">
    <!ENTITY kapitel.3 SYSTEM "kapitel3.xml">

Im zweiten Schritt f?gt man in beide B?cher eine Parameterentit?t ein,
die den Inhalt von ``kapitel.ent`` referenziert, und l?dt ?ber diese
dann die Deklarationen. Anschlie?end k?nnen die so geladenen Entit?ten
wie gewohnt genutzt werden.

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
    <!ENTITY % kapitel SYSTEM "kapitel.ent">
    %kapitel;
    ]>

    <html>
      &amp;kapitel.1;
      &amp;kapitel.2;
      &amp;kapitel.3;
    </html>

.. raw:: html

   </div>

.. raw:: html

   </div>

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

7.7.3. Finger?bungen…
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.7.3.1. Binden Sie Dateien ?ber Allgemeine Entit?ten ein
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Legen Sie drei Dateien (``absatz1.xml``, ``absatz2.xml`` und
   ``absatz3.xml``) mit jeweils einer Zeile wie

   .. code:: programlisting

       <p>Erster Absatz.</p>

   an.

#. ?ndern Sie ``beispiel.xml`` so ab, dass sie wie folgt aussieht:

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
       <!ENTITY version "1.1">
       <!ENTITY absatz1 SYSTEM "absatz1.xml">
       <!ENTITY absatz2 SYSTEM "absatz2.xml">
       <!ENTITY absatz3 SYSTEM "absatz3.xml">
       ]>

       <html>
         <head>
           <title>Eine HTML-Beispieldatei</title>
         </head>

         <body>
           <p>Die aktuelle Version dieses Dokuments ist &version;</p>

           &absatz1;
           &absatz2;
           &absatz3;
         </body>
       </html>

#. Erzeugen Sie nun die Datei ``beispiel.html``, indem Sie
   ``beispiel.xml`` normalisieren:

   .. code:: screen

       % osgmlnorm -d beispiel.xml > beispiel.html

#. ?ffnen Sie ``beispiel.html`` nun mit einem Webbrowser und
   vergewissern Sie sich, dass der Inhalt der Dateien ``absatzN.xml`` in
   ``beispiel.html`` ?bernommen wurde.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.7.3.2. Binden Sie Dateien mit Parameterentit?ten ein
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Hierf?r m?ssen Sie die vorherige Finger?bung gemacht haben.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. ?ndern Sie ``beispiel.xml`` so ab, dass es wie folgt aussieht:

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
       <!ENTITY % entitaeten SYSTEM "entitaeten.xml"> %entitaeten;
       ]>

       <html>
         <head>
           <title>Eine HTML-Beispieldatei</title>
         </head>

         <body>
           <p>Die aktuelle Version dieses Dokuments ist &version;</p>

           &absatz1;
           &absatz2;
           &absatz3;
         </body>
       </html>

#. Legen Sie eine weitere Datei ``entitaeten.xml`` an, die folgenden
   Inhalt hat:

   .. code:: programlisting

       <!ENTITY version "1.1">
       <!ENTITY absatz1 SYSTEM "absatz1.xml">
       <!ENTITY absatz2 SYSTEM "absatz2.xml">
       <!ENTITY absatz3 SYSTEM "absatz3.xml">

#. Erzeugen Sie die Datei ``beispiel.html``, indem Sie ``beispiel.xml``
   normalisieren:

   .. code:: screen

       % osgmlnorm -d beispiel.xml > beispiel.html

#. ?ffnen Sie ``beispiel.html`` nun mit einem Webbrowser und
   vergewissern Sie sich, dass der Inhalt der Dateien ``absatzN.xml`` in
   ``beispiel.html`` ?bernommen wurde.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-----------------------------------+---------------------------------------------------+
| `Zur?ck <xml-primer-entities.html>`__?   | `Nach oben <xml-primer.html>`__   | ?\ `Weiter <xml-primer-marked-sections.html>`__   |
+------------------------------------------+-----------------------------------+---------------------------------------------------+
| 7.6. Entit?ten?                          | `Zum Anfang <index.html>`__       | ?7.8. Markierte Bereiche                          |
+------------------------------------------+-----------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
