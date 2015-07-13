======================================
15. Funcionamiento sin conexi?n de red
======================================

.. raw:: html

   <div class="navheader">

15. Funcionamiento sin conexi?n de red
`Anterior <freebsd-cvs-and-p4.html>`__?
?
?\ `Siguiente <soc.html>`__

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

15. Funcionamiento sin conexi?n de red
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Uno de los inconvenientes de Perforce es que supone que siempre es
posible acceder al servidor a trav?s de la red. La mayor?a de los
estados, el historial y los metadatos se almacenan en el servidor y no
existe mecanismo alguno para replicar el servidor como los hay en
CVS/CVSup. Es posible ejecutar un servidor proxy, pero solamente ayuda
un poco si se quiere trabajar sin conexi?n al servidor.

La mejor forma de trabajar sin conexi?n de red es comprobando que el
cliente no tiene ning?n fichero abierto y que est? totalmente
sincronizado antes de dejar de estar conectado. Cuando se edite un
fichero se deber?n cambiar manualmente los permisos a lectura-escritura.
Cuando vuelva a estar conectado ejecute la orden que se mostraba en la
`Secci?n?12, “El trabajo con “diffs”” <working-with-diffs.html>`__ para
identificar autom?ticamente los ficheros que se han editado, a?adido o
eliminado. Es bastante com?n encontrarse con la sorpresa de que Perforce
ha sobreescrito un fichero modificado en local que no se abri? en modo
edici?n, as? que tenga especial cuidado con esto.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+---------------------------+----------------------------------------------------------------+
| `Anterior <freebsd-cvs-and-p4.html>`__?                 | ?                         | ?\ `Siguiente <soc.html>`__                                    |
+---------------------------------------------------------+---------------------------+----------------------------------------------------------------+
| 14. Interacciones entre el CVS de FreeBSD y Perforce?   | `Inicio <index.html>`__   | ?16. Consideraciones finales para el “Google Summer of Code”   |
+---------------------------------------------------------+---------------------------+----------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
