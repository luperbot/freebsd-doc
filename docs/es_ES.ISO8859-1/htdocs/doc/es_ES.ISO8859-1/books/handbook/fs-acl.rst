=========================================================
14.12. Listas de control de acceso a sistemas de ficheros
=========================================================

.. raw:: html

   <div class="navheader">

14.12. Listas de control de acceso a sistemas de ficheros
`Anterior <openssh.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <security-portaudit.html>`__

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

14.12. Listas de control de acceso a sistemas de ficheros
---------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuido por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adem?s de otras mejoras del sistema de ficheros como las instant?neas
(“snapshots”), FreeBSD 5.0 y siguientes ofrecen las ACL (“Access Control
Lists”, listas de control de acceso) como un elemento m?s de seguridad.

Las listas de control de acceso extienden el modelo de permisos est?ndar
de UNIX? de una manera altamente compatible (POSIX?.1e). Esta opci?n
permite al administrador usar con gran provecho un modelo de seguridad
m?s sofisticado.

Para habilitar soporte de ACL en sistemas de ficheros UFS la siguiente
opci?n:

.. code:: programlisting

    options UFS_ACL

debe ser compilada en el kernel. Si esta opci?n no ha sido compilada, se
mostrar? un mensaje de advertencia si se intenta montar un sistema de
ficheros que soporte ACL. Esta opci?n viene incluida en el kernel
``GENERIC``. Las ACL dependen de los atributos extendidos habilitados en
el sistema de ficheros. Los atributos extendidos est?n incluidos por
defecto en la nueva generaci?n de sistemas de ficheros UNIX? UFS2.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Los atributos extendidos pueden usarse tambi?n en UFS1 pero requieren
una carga de trabajo mucho m?s elevada que en UFS2. El rendimiento de
los atributos extendidos es, tambi?n, notablemente mayor en UFS2. Por
todo esto si quiere usar ACL le recomendamos encarecidamente que use
UFS2.

.. raw:: html

   </div>

LasACL se habilitadan mediante una bandera administrativa durante el
montaje, ``acls``, en el fichero ``/etc/fstab``. La bandera de montaje
puede tambi?n activarse de forma permanente mediante
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
para modificar una bandera de superbloque ACLs en la cabecera del
sistema de ficheros. En general es preferible usar la bandera de
superbloque por varios motivos:

.. raw:: html

   <div class="itemizedlist">

-  La bandera de montaje ACL no puede cambiarse por un remontaje
   (`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
   ``-u``), sino con un completo
   `umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__
   y un
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
   Esto significa que no se pueden habilitar las ACL en el sistema de
   ficheros ra?z despu?s del arranque. Tambi?n significa que no se puede
   cambiar la disposici?n de un de ficheros una vez que se ha comenzado
   a usar.

-  Activar la bandera de superbloque provocar? que el sistema de
   ficheros se monte siempre con las ACL habilitadas incluso si no
   existe una entrada en ``fstab`` o si los dispositivos se reordenan.
   Esto es as? para prevenir un montaje accidental del sistema de
   ficheros sin tener las ACL habilitadas, que podr?a resultar en que se
   impongan de forma inadecuada las ACL, y en consecuencia problema de
   seguridad.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Podemos cambiar el comportamiento de las ACL para permitirle a la
bandera ser habilitada sin un
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
completo, pero puede salirle el tiro por la culata si activa las ACL,
luego las desactiva, y despu?s las vuelve a activar sin configurar desde
cero las atributos extendidos. En general, una vez que se han
deshabilitado las ACL en un sistema de ficheros no deben dehabilitarse,
ya que la protecci?n de ficheros resultante puede no ser compatible las
que esperan los usuarios del sistema, y al volver a activar las ACL
volver a asignar las ACL a ficheros cuyos permisos hubieran sido
cambiados, lo que puede desenbocar en un escenario impredecible.

.. raw:: html

   </div>

Los sistemas de ficheros con ACL habilitadas tienen un signo ``+`` (m?s)
al visualizar sus configuraciones de permisos. Por ejemplo:

.. code:: programlisting

    drwx------  2 robert  robert  512 Dec 27 11:54 private
    drwxrwx---+ 2 robert  robert  512 Dec 23 10:57 directorio1
    drwxrwx---+ 2 robert  robert  512 Dec 22 10:20 directorio2
    drwxrwx---+ 2 robert  robert  512 Dec 27 11:57 directorio3
    drwxr-xr-x  2 robert  robert  512 Nov 10 11:54 public_html

Aqu? vemos que los directorios ``directorio1``, ``directorio2``, y
``directorio3`` est?n usando ACL. El directorio ``public_html`` no.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.12.1. Uso de ACL
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las ACLs del sistema de ficheros pueden comprobarse con
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1>`__.
Por ejemplo, para ver las configuraciones de ACL del fichero ``test``,
uno podr?a usar lo siguiente:

.. code:: screen

    % getfacl test
        #file:test
        #owner:1001
        #group:1001
        user::rw-
        group::r--
        other::r--

Para cambiar las configuraciones de las ACL en este fichero use
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1>`__.
Observe:

.. code:: screen

    % setfacl -k test

La bandera ``-k`` eliminar? todas las ACLs definidas para un fichero o
sistema ficheros. El m?todo preferible ser?a utilizar ``-b``, ya que
deja los campos b?sicos imprescindibles para que las ACL sigan
funcionando.

.. code:: screen

    % setfacl -m u:trhodes:rwx,group:web:r--,o::--- test

La opci?n ``-m`` se usa para modificar las entradas por defecto de las
ACL. Debido a que no hab?a entradas predefinidas puesto que fueron
eliminadas por la orden anterior, restauraremos las opciones por defecto
y asignar? las opciones listadas. Tenga en cuenta que si a?ade un nuevo
usuario o grupo aparecer? el error Invalid argument en la salida
est?ndar ``stdout``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-----------------------------+-----------------------------------------------------------------+
| `Anterior <openssh.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <security-portaudit.html>`__                      |
+--------------------------------+-----------------------------+-----------------------------------------------------------------+
| 14.11. OpenSSH?                | `Inicio <index.html>`__     | ?14.13. Monitorizaci?n de fallos de seguridad de aplicaciones   |
+--------------------------------+-----------------------------+-----------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
