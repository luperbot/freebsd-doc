===================
4. Sincronizaciones
===================

.. raw:: html

   <div class="navheader">

4. Sincronizaciones
`Anterior <clients.html>`__?
?
?\ `Siguiente <branches.html>`__

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

4. Sincronizaciones
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez definida la especificaci?n del cliente y una vez establecida la
variable de entorno ``P4CLIENT``, el siguiente paso consiste en
recuperar los ficheros para el cliente en cuesti?n desde el servidor
hasta la m?quina local. Esto se realiza con ``p4 sync``, el cual indica
a Perforce que sincronice los ficheros locales con los del repositorio.
La primera vez que se ejecuta descargar? todos los ficheros. Las
siguientes ejecuciones s?lo descargar?n aquellos ficheros que hayan
cambiado desde la ?ltima ejecuci?n de la orden. Gracias a esto es
posible sincronizar sus fuentes con las de otras personas con las que
est? trabajando.

Las operaciones de sincronizaci?n s?lo ata?en a aquellos ficheros cuyas
modificaciones han sido transmitidas a Perforce. Si se modifica o borra
un fichero en local sin informar de ello al servidor la ejecuci?n de un
“sync” no reflejar? dichos cambios. No obstante, la ejecuci?n de
``p4 sync -f`` sincrozar? incondicionalmente todos los ficheros, sin que
importe su estado. Esto resulta ?til para solucionar problemas cuando se
cree que el ?rbol pueda haber sufrido alg?n tipo de corrupci?n.

Puede sincronizarse parte del ?rbol o del cliente especificando una ruta
relativa a la orden “sync”. Por ejemplo, para sincronizar s?lo el
directorio ``ufs`` del proyecto ``smpng`` ejecute lo siguiente:

.. code:: screen

    % cd raizdelproyecto/smpng
    % p4 sync src/sys/ufs/...

El uso de rutas locales relativas funciona en muchas otras ?rdenes
``p4``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+------------------------------------+
| `Anterior <clients.html>`__?   | ?                         | ?\ `Siguiente <branches.html>`__   |
+--------------------------------+---------------------------+------------------------------------+
| 3. Clientes?                   | `Inicio <index.html>`__   | ?5. Ramas                          |
+--------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
