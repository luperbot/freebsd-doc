=====================
3.13. M?s informaci?n
=====================

.. raw:: html

   <div class="navheader">

3.13. M?s informaci?n
`Anterior <binary-formats.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <ports.html>`__

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

3.13. M?s informaci?n
---------------------

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

3.13.1. P?ginas de manual
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La documentaci?n m?s exhaustiva de FreeBSD est? en las p?ginas de
manual. Casi todos los programas del sistema vienen con un breve manual
de referencia explicando el funcionamiento b?sico y sus diferentes
argumentos. Estos manuales pueden revisarse mediante ``man``. El uso de
``man`` es simple:

.. code:: screen

    % man orden

``orden`` es el nombre de la orden sobre la que que desea saber m?s. Por
ejemplo, para m?s informaci?n sobre ``ls`` escriba:

.. code:: screen

    % man ls

El manual en l?nea est? dividido en secciones numeradas:

.. raw:: html

   <div class="orderedlist">

#. Comandos de usuario.

#. Llamadas al sistema y n?meros de error.

#. Funciones en las bibliotecas de C.

#. Controladores de dispositivo.

#. Formatos de fichero.

#. Juegos y dem?s pasatiempos.

#. Informaci?n sobre temas diversos.

#. Comandos relacionados con el mantenimiento del sistema y su
   funcionamiento.

#. Desarrolladores del Kernel.

.. raw:: html

   </div>

En algunos casos, el mismo tema puede aparecer en m?s de una secci?n del
manual en l?nea. Por ejemplo, existe una orden de usuario ``chmod`` y
una llamada del sistema ``chmod()``. En este caso se le puede decir a
``man`` cu?l desea consultar especificando la secci?n:

.. code:: screen

    % man 1 chmod

Esto desplegar? la p?gina de manual de la orden de usuario ``chmod``.
Las referencias a una secci?n concreta del manual en l?nea
tradicionalmente suelen colocarse entre par?ntesis en la documentaci?n
escrita, por lo tanto
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
se refiere a la orden de usuario ``chmod`` y
`chmod(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=2>`__
se refiere a la llamada de sistema.

Esto est? muy bien si se conoce el nombre del programa y simplemente se
quiere saber como usarlo. Pero ?y si no puede recordar el nombre de la
orden? Se puede usar man para que realice una b?squeda mediante palabras
clave en las descripciones de programas utilizando el argumento ``-k``:

.. code:: screen

    % man -k mail

Dicha orden mostrar? una lista de ?rdenes que contengan la palabra clave
?mail? en sus descripciones. Esto es funcionalmente equivalente a usar
``apropos``.

As? que, ?est? viendo todos esos programas tan atractivos en
``/usr/bin`` pero no tiene ni la menor idea de lo que la mayor?a de
ellos hace? Haga lo siguiente:

.. code:: screen

    % cd /usr/bin
    % man -f *

o

.. code:: screen

    % cd /usr/bin
    % whatis *

que hace exactamente lo mismo.

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

3.13.2. Ficheros de informaci?n GNU: info
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD incluye muchas aplicaciones y utilidades producidas por la FSF
(Free Software Foundation). Adem?s de con las correspondientes p?ginas
de manual, estos programas vienen con documentos de hipertexto m?s
detallados, llamados ficheros ``info``, los cuales pueden ser
visualizados con ``info``, o si tiene instalado emacs, con el modo info
de emacs.

Si quiere utilizar la orden
`info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=info&sektion=1>`__
tecl?e:

.. code:: screen

    % info

Para una breve introducci?n tecl?e ``h``. Cuando necesite una referencia
r?pida, tecl?e ``?``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+----------------------------------------------------------------+
| `Anterior <binary-formats.html>`__?   | `Subir <basics.html>`__   | ?\ `Siguiente <ports.html>`__                                  |
+---------------------------------------+---------------------------+----------------------------------------------------------------+
| 3.12. Formatos binarios?              | `Inicio <index.html>`__   | ?Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports   |
+---------------------------------------+---------------------------+----------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
