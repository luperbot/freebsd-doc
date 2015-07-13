=================================================
3.6. Montaje y desmontaje de sistemas de ficheros
=================================================

.. raw:: html

   <div class="navheader">

3.6. Montaje y desmontaje de sistemas de ficheros
`Anterior <disk-organization.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <basics-processes.html>`__

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

3.6. Montaje y desmontaje de sistemas de ficheros
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El sistema de ficheros se visualiza mejor como un ?rbol enraizado, tal y
como es?, en ``/``. ``/dev``, ``/usr`` y todos los dem?s directorios en
el directorio ra?z son raamas, las cuales pueden tener sus propias
ramas, como ``/usr/local`` y as? sucesivamente.

Existen varias razones para albergar algunos de estos directorios en
sistemas de ficheros separados. ``/var`` contiene los directorios
``log/``, ``spool/`` y varios tipos de ficheros temporales y pueden
llegar a desbordarse. Agotar el espacio del sistema de ficheros ra?z no
es nada bueno desde cualquier punto de vista, as? que separar ``/var``
de de ``/`` es algo que deber?a hacerse siempre que sea posible.

Otra raz?n para meter ciertos ?rboles de directorios en otros sistemas
de ficheros es si van a estar albergados en discos f?sicos separados, o
si son discos virtuales separados, como un montaje por
`NFS <network-nfs.html>`__ en el caso de unidades de CDROM.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.6.1. El fichero ``fstab``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durante el `proceso de arranque <boot.html>`__ los sistemas de ficheros
listados en ``/etc/fstab`` se montan autom?ticamente (a menos que est?n
listados con la opci?n ``noauto``).

``/etc/fstab`` contiene una lista de l?neas con el siguiente formato:

.. code:: programlisting

    dispositivo       /punto-de-montaje punto de montaje     opciones      dumpfreq     passno

.. raw:: html

   <div class="variablelist">

``dispositivo``
    Un nombre de dispositivo (*debe existir*).

``punto-de-montaje``
    Un directorio (que debe existir) en el que montar el sistema de
    ficheros.

``tipo de sistema ficheros``
    El tipo de sistema de ficheros es un par?metro que interpretar?
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
    El sistema de ficheros por omisi?n de FreeBSD es ``ufs``.

``opciones``
    Ya sea ``rw`` para sistemas de ficheros de lectura-escritura, o
    ``ro`` para sistemas de ficheros de s?lo lectura, seguido de
    cualquier otra opci?n que sea necesaria. Una opci?n muy habitual es
    ``noauto``, que se suele usar en sistemas de ficheros que no se
    deben montar durante la secuencia de arranque. Tiene otras opciones
    en la p?gina de manual de
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.

``dumpfreq``
    `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
    la usa para determinar qu? sistema de ficheros requieren volcado. Si
    el campo no est? declarado se asume un valor de cero.

``passno``
    Determina el orden en el cual los sistemas de ficheros deben
    revisarse. Los sistemas de ficheros que hayan de saltarse deben
    tener su ``passno`` a cero. El sistema de ficheros ra?z (que
    obviamente debe ser revisado antes que cualquier otro) debe tener su
    ``passno`` puesto a uno, y los dem?s sistemas de ficheros deben
    tener valores mayores que uno. Si m?s de un sistema de ficheros
    tiene el mismo ``passno``
    `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
    tratar? de revisarlos en paralelo en caso de ser posible.

.. raw:: html

   </div>

Consulte la p?gina de manual de
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
para mayor informaci?n sobre el formato del fichero ``/etc/fstab`` y las
opciones que contiene.

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

3.6.2. La orden ``mount``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
es al fin y al cabo quien monta los sistemas de ficheros.

En su forma m?s b?sica se usa lo siguiente:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mount dispositivo punto-de-montaje

.. raw:: html

   </div>

Existe una gran cantidad de opciones (las encontrar? todas en
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__)
pero las m?s comunes son:

.. raw:: html

   <div class="variablelist">

.. raw:: html

   <div class="variablelist-title">

Opciones de montaje

.. raw:: html

   </div>

``-a``
    Montar todos los sistemas de ficheros que aparezcan en
    ``/etc/fstab``, excepto aquellos marcados como ?noauto?, excluidos
    por el par?metro ``-t`` o aquellos que ya est?n montados.

``-d``
    Realizar todo excepto la llamada real de montaje del sistema. Esta
    opci?n es muy ?til en caso de problemas si se combina con la opci?n
    ``-v`` para determinar qu? es lo que
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
    est? haciendo realmente.

``-f``
    Forzar el montaje de un sistema de ficheros inestable (por ejemplo
    uno que da errores tras un reinicio s?bito, algo que es bastante
    *peligroso*), o forzar la revocaci?n de accesos de escritura cuando
    se cambia el estado de un sistema de ficheros de lectura-escritura a
    solo lectura.

``-r``
    Montar el sistema de ficheros como s?lo lectura. Esto es id?ntico a
    utilizar el argumento ``ro`` (``rdonly`` para versiones anteriores a
    FreeBSD?5.2) en la opci?n ``-o``.

``-t`` *``tipo de sistema de ficheros``*
    Montar un sistema de ficheros dado con el tipo de sistema de
    ficheros, o montar solamente sistemas de ficheros del tipo dado si
    se proporciona la opci?n ``-a``.

    ?ufs? es el sistema de ficheros por omisi?n.

``-u``
    Actualizar puntos de montaje en el sistema de ficheros.

``-v``
    Mostrar mayor informaci?n.

``-w``
    Montar el sistema de ficheros como lectura-escritura.

.. raw:: html

   </div>

La opci?n ``-o`` toma una lista las siguientes opciones separada por
comas:

.. raw:: html

   <div class="variablelist">

nodev
    No interpretar dispositivos especiales en el sistema ficheros. Es
    una opci?n de seguridad que puede ser muy ?til.

noexec
    No permitir la ejecuci?n de binarios en este sistema de ficheros.
    Esta tambi?n es una opci?n de seguridad ?til.

nosuid
    No interpretar bits setuid o setgid en el sistema de ficheros. Esta
    tambi?n es una opci?n de seguridad ?til.

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

3.6.3. La orden ``umount``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__
toma como par?metro un punto de montaje, un nombre de dispositivo, o la
opci?n ``-a`` o ``-A``.

Todas las formas toman ``-f`` para forzar el desmontaje y ``-v`` para
mostrar m?s informaci?n. Tenga muy en cuenta que usar ``-f`` no suele
ser una forma recomendable de proceder. Desmontar a la fuerza los
sistemas de ficheros puede acarrear el congelar la m?quina o da?ar los
datos en el sistema de ficheros.

``-a`` y ``-A`` se usan para desmontar todos los sistemas de ficheros
montados, con la ventaja de poder elegir el tipo de sistema de ficheros
que se use tras ``-t``. De todas maneras ``-A`` no trata de desmontar el
sistema de ficheros ra?z.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------+--------------------------------------------+
| `Anterior <disk-organization.html>`__?   | `Subir <basics.html>`__   | ?\ `Siguiente <basics-processes.html>`__   |
+------------------------------------------+---------------------------+--------------------------------------------+
| 3.5. Organizaci?n de disco?              | `Inicio <index.html>`__   | ?3.7. Procesos                             |
+------------------------------------------+---------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
