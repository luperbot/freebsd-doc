=======================
3.10. Editores de texto
=======================

.. raw:: html

   <div class="navheader">

3.10. Editores de texto
`Anterior <shells.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <basics-devices.html>`__

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

3.10. Editores de texto
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Gran parte de la configuraci?n de FreeBSD se realiza modificando
ficheros de texto, as? que le conviene familiarizarse con alguno de
ellos. FreeBSD viene con unos cuantos como parte del sistema base y
encontrar? muchos m?s en la colecci?n de ports.

El editor de textos m?s sencillo y f?cil de aprender es uno llamado ee,
cuyo nombre proviene del ingl?s ?easy editor? (editor f?cil). Para
iniciar ee se debe teclear en la l?nea de ?rdenes
``ee nombre-de-fichero``, donde *``nombre-de-fichero``* es el nombre del
fichero que se quiere editar. Por ejemplo, para editar ``/etc/rc.conf``
tecl?e ``ee /etc/rc.conf``. Una vez dentro de ``ee`` todas las ?rdenes
para manipular las funciones del editor est?n listadas en la parte
superior de la pantalla. El caracter ``^`` representa la tecla **Ctrl**
del teclado, por lo tanto ``^e`` significa la combinaci?n de teclas
**Ctrl**+**e**. Para salir de ee pulse la tecla **Esc** y elija
abandonar (?leave?) el editor. El editor preguntar? entonces si quiere
conservar los cambios si el fichero hubiera sido modificado.

FreeBSD viene tambi?n con editores de texto mucho m?s potentes, como vi,
como parte del sistema base, mientras que otros editores, como Emacs y
vim son parte de la colecci?n de ports de FreeBSD
(`editors/emacs <http://www.freebsd.org/cgi/url.cgi?ports/editors/emacs/pkg-descr>`__
y
`editors/vim <http://www.freebsd.org/cgi/url.cgi?ports/editors/vim/pkg-descr>`__).
Estos editores son much?simo m?s poderosos, pero tienen la desventaja de
ser un poco m?s complicados de aprender a manejar. De cualquier manera
si planea hacer mucho trabajo de edici?n de texto, aprender a usar un
editor de texto m?s poderoso como vim o Emacs le ahorrar? much?simo m?s
tiempo a la larga.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+---------------------------+-----------------------------------------------+
| `Anterior <shells.html>`__?   | `Subir <basics.html>`__   | ?\ `Siguiente <basics-devices.html>`__        |
+-------------------------------+---------------------------+-----------------------------------------------+
| 3.9. Shells?                  | `Inicio <index.html>`__   | ?3.11. Dispositivos y nodos de dispositivos   |
+-------------------------------+---------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
