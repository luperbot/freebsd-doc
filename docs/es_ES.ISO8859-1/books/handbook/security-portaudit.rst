============================================================
14.13. Monitorizaci?n de fallos de seguridad de aplicaciones
============================================================

.. raw:: html

   <div class="navheader">

14.13. Monitorizaci?n de fallos de seguridad de aplicaciones
`Anterior <fs-acl.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <security-advisories.html>`__

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

14.13. Monitorizaci?n de fallos de seguridad de aplicaciones
------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En estos ?ltimos a?os el mundo de la seguridad ha hecho grandes avances
en cuanto a la gesti?n de las vulnerabilidades. La amenaza de asaltos a
los sistemas se incrementa cuando se instalan y configuran aplicaciones
de muy diversas procedencias en virtualmente cualquier sistema operativo
disponible.

La evaluaci?n de vulnerabilidades es un factor clave en la seguridad;
aunque FreeBSD libere avisos de seguridad relacionados con el sistema
base, llevar la gesti?n de vulnerabilidades hasta cada aplicaci?n que se
puede instalar en FreeBSD va mucho m?s all? de la capacidad del proyecto
FreeBSD. A pesar de esto existe una forma de mitigar las
vulnerabilidades de esas aplicaciones y advertir a los administradores
sobre los problemas de seguridad a medida que se detectan. Portaudit
existe para hacer ese trabajo.

El port
`security/portaudit <http://www.freebsd.org/cgi/url.cgi?ports/security/portaudit/pkg-descr>`__
consulta una base de datos, actualizada y mantenida por el equipo de
seguridad y por los desarrolladores de FreeBSD en busca de incidentes de
seguridad que hayan sido detectados.

Si quiere usar Portaudit inst?lelo desde la colecci?n de ports:

.. code:: screen

    # cd /usr/ports/security/portaudit && make install clean

Durante el proceso de instalaci?n los ficheros de configuraci?n de
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
se actualizan haciendo que Portaudit aparezca en el mensaje sobre la
seguridad del sistema que diariamente Recuerde que ese correo (que se
envia a la cuenta ``root`` es muy importante y deber?a leerlo. No hay
ninguna configuraci?n que deba modificar o crear.

Despu?s de la instalaci?n un administrador debe actualizar la base de
datos alojada en local en ``/var/db/portaudit`` mediante:

.. code:: screen

    # portaudit -F

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La base de datos ser? actualizada autom?ticamente durante la ejecuci?n
de
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__;
as? que la orden anterior es totalmente opcional. Solo se necesita para
los siguientes ejemplos.

.. raw:: html

   </div>

Si quiere comproblar si entre las aplicaciones que haya instalado desde
el ?rbol de ports en su sistema hay problemas de seguridad s?lo tiene
que ejecutar lo siguiente:

.. code:: screen

    # portaudit -a

Este es un ejemplo de la salida:

.. code:: programlisting

    Affected package: cups-base-1.1.22.0_1
    Type of problem: cups-base -- HPGL buffer overflow vulnerability.
    Reference: <http://www.FreeBSD.org/ports/portaudit/40a3bca2-6809-11d9-a9e7-0001020eed82.html>

    1 problem(s) in your installed packages found.

    You are advised to update or deinstall the affected package(s) immediately.

El administrador del sistema obtendr? mucha m?s informaci?n sobre el
problema de seguridad dirigiendo su navegador web a la URL que aparece
en el mensaje. Esto incluye versiones afectadas (por versi?n de port de
FreeBSD), junto con otros sitios web que contengan advertencias de
seguridad.

En pocas palabras, Portaudit es un programa muy poderoso y
extremadamente ?til cuando se combina con el port Portupgrade.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------+-----------------------------+-----------------------------------------------+
| `Anterior <fs-acl.html>`__?                                  | `Subir <security.html>`__   | ?\ `Siguiente <security-advisories.html>`__   |
+--------------------------------------------------------------+-----------------------------+-----------------------------------------------+
| 14.12. Listas de control de acceso a sistemas de ficheros?   | `Inicio <index.html>`__     | ?14.14. FreeBSD Security Advisories           |
+--------------------------------------------------------------+-----------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
