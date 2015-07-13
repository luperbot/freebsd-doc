====================================================
8.4. Controladores del kernel, subsistemas y m?dulos
====================================================

.. raw:: html

   <div class="navheader">

8.4. Controladores del kernel, subsistemas y m?dulos
`Anterior <kernelconfig-devices.html>`__?
Cap?tulo 8. Configuraci?n del kernel de FreeBSD
?\ `Siguiente <kernelconfig-building.html>`__

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

8.4. Controladores del kernel, subsistemas y m?dulos
----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de compilar un kernel personalizado conviene pensar antes los
motivos. Si lo que se necesita es a?adir hardware espec?fico al sistema
es posible que sea posible utilizarlo mediante un m?dulo.

Los m?dulos del kernel est?n en el directorio ``/boot/kernel`` y se
pueden cargar din?micamente en un kernel en funcionamiento con
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
La mayor?a, por no decir todos, los controladores del kernel tienen un
m?dulo espec?fico y una p?gina de manual. Por ejemplo, en la secci?n
anterior habl?bamos del controlador Ethernet inal?mbrico ``ath``. La
p?gina de manual de este dispositivo contiene la siguiente informaci?n:

.. code:: programlisting

    Alternatively, to load the driver as a module at boot time, place the
         following line in loader.conf(5):

               if_ath_load="YES"

Si hace lo que dice ah?, es decir, a?adir la l?nea ``if_ath_load="YES"``
al fichero ``/boot/loader.conf`` har? que el m?dulo se cargue
din?micamente cada vez que el sistema arranque.

Hay casos, no obstante, en los que no existe el m?dulo correspondiente.
Esto sucede con ciertos subsistemas y con controladores muy importantes,
como por ejemplo el de FFS, que necesita el kernel. Igual sucede con la
posibilidad de utilizar redes (INET). Por desgracia, en estos casos la
?nica forma de saber si hace falta un controlador es buscar el m?dulo.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Es sumamente f?cil quitar un dispositivo o una opci?n del kernel y
encontrarse de manos a boca con un kernel que no funciona. Por ejemplo,
si elimina el controlador
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4>`__ del
fichero de configuraci?n del kernel un sistema que utilice unidades de
disco ATA no podr? arrancar a menos que se a?ada la l?nea
correspondiente al fichero ``loader.conf``. Si tiene dudas busque el
m?dulo y deje el kernel como est?.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+---------------------------------+--------------------------------------------------------------+
| `Anterior <kernelconfig-devices.html>`__?   | `Subir <kernelconfig.html>`__   | ?\ `Siguiente <kernelconfig-building.html>`__                |
+---------------------------------------------+---------------------------------+--------------------------------------------------------------+
| 8.3. Inventario de hardware del sistema?    | `Inicio <index.html>`__         | ?8.5. Compilaci?n e instalaci?n de un kernel personalizado   |
+---------------------------------------------+---------------------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
