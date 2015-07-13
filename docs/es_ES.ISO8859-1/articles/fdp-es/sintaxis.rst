===================
5. Gu?a de sintaxis
===================

.. raw:: html

   <div class="navheader">

5. Gu?a de sintaxis
`Anterior <ar01s04.html>`__?
?
?\ `Siguiente <ar01s06.html>`__

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

5. Gu?a de sintaxis
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por favor, siga ?stas sencillas reglas para facilitar el trabajo de toda
la gente que mantiene el c?digo fuente de la documentaci?n.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. Min?sculas
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las etiquetas van siempre en min?sculas: ``<para>``, *no* ``<PARA>``.

El texto SGML normalmente se escribe en may?sculas: ``<!ENTITY…>`` y
``<!DOCTYPE…>``, *no* ``<!entity…>`` o ``<!doctype…>``.

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

5.2. Sangrado
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada fichero comienza con un sangrado nulo, es decir, en la columna 0,
*sin tener en cuenta* el nivel de sangrado del fichero que pueda
contenerlo.

La apertura de etiquetas incrementa el nivel de sangrado en 2 espacios.
Reemplace los bloques de 8 espacios al inicio de una l?nea con una
tabulaci?n. No use espacios antes de una tabulaci?n y no a?ada espacios
al final de una l?nea. El contenido que est? entre elementos debe
sangrarse en dos espacios si el contenido ocupa m?s de una l?nea.

Por ejemplo, el c?digo fuente de esta secci?n es algo parecido a esto:

.. code:: programlisting

    +--- ?sta es la columna 0
    V

      <sect1>
        <title>...</title>

        <sect2>
          <title>Sangrado</title>

          <para>Cada fichero comienza con un sangrado nulo, es decir,
        en la columna 0, <emphasis>sin tener en cuenta</emphasis>
        el nivel de sangrado del fichero que pueda contenerlo.</para>

          ...
        </sect2>
      </sect1>
    </chapter>

Si usa Emacs o XEmacs para editar ficheros que forman parte de la
Documentaci?n se cargar? autom?ticamente el ``sgml-mode`` y las
variables locales que Emacs encontrar? al principio de cada fichero
podr?n utilizarse.

Si usa Vim puede serle muy ?til incluir lo siguiente en la configuraci?n
de su editor:

.. code:: programlisting

    augroup sgmledit
      autocmd FileType sgml set formatoptions=cq2l " Opciones especiales de formato
      autocmd FileType sgml set textwidth=70       " Corta las l?neas a 70 espacios
      autocmd FileType sgml set shiftwidth=2       " Sangra autom?ticamente
      autocmd FileType sgml set softtabstop=2      " Tabulaci?n = 2 espacios
      autocmd FileType sgml set tabstop=8          " Reemplaza 8 espacios con Tab
      autocmd FileType sgml set autoindent         " Sangrado autom?tico
    augroup END

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

5.3. Etiquetas
~~~~~~~~~~~~~~

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

5.3.1. Espacios en las etiquetas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las etiquetas que comienzan en el mismo nivel de sangrado que la
etiqueta anterior deben separarse con una l?nea en blanco, y las que no
est?n al mismo nivel de sangrado que la anterior *no*:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    <article lang='es'>
      <articleinfo>
        <title>NIS</title>

        <pubdate>Octubre 1999</pubdate>

        <abstract>
          <para>...
        ...
        ...</para>
        </abstract>
      </articleinfo>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>
    </article>

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

+--------------------------------+---------------------------+-----------------------------------+
| `Anterior <ar01s04.html>`__?   | ?                         | ?\ `Siguiente <ar01s06.html>`__   |
+--------------------------------+---------------------------+-----------------------------------+
| 4. Gu?a de estilo?             | `Inicio <index.html>`__   | ?6. Trato al lector o lectora     |
+--------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
