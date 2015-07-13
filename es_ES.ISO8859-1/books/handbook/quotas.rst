=====================================
18.14. Cuotas en sistemas de ficheros
=====================================

.. raw:: html

   <div class="navheader">

18.14. Cuotas en sistemas de ficheros
`Anterior <snapshots.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <disks-encrypting.html>`__

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

18.14. Cuotas en sistemas de ficheros
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las cuotas son una opci?n del sistema operativo que le permite limitar
la cantidad de espacio en disco y/o el n?mero de fichero que un usuario
o miembros de un grupo pueden crear en el sistema, pudiendo adem?s
hacerlo de forma independiente en cada sistema de ficheros. Suele usarse
principalmente en sistemas de tiempo compartido, donde se busca limitar
la cantidad de recursos que cualquier usuario o grupo pueden utilizar.
Esto evitar? que un usuario o un grupo de usuarios consuma todos el
espacio disponible en disco.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.14.1. Configuraci?n del sistema para habilitar cuotas de disco
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de intentar configurar el uso de cuotas de disco hay que
asegurarse de que las cuotas est?n activadas en el kernel. La siguiente
l?nea debe estar en el fichero de de configuraci?n del kernel:

.. code:: programlisting

    options QUOTA

El kernel ``GENERIC`` no lo tiene activado por defecto, as? que tendr?
que configurar, compilar e instalar un kernel personalizado para poder
usar cuotas de disco. Por favor, consulte el `Cap?tulo?8, *Configuraci?n
del kernel de FreeBSD* <kernelconfig.html>`__ para m?s informaci?n sobre
la configuraci?n del kernel.

A continuaci?n tendr? que habilitar las cuotas de disco en
``/etc/rc.conf``. A?adale la siguiente l?nea:

.. code:: programlisting

    enable_quotas="YES"

Hay una variable que le permitir? efectuar un control m?s exhaustivo
sobre el arranque de cuotas. Normalmente se revisa la integridad de
cuotas de cada sistema de ficheros en el arranque; el responsable es
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__.
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__
se asegura de que los datos que hay en su base de datos de cuotas
reflejen realmente los datos del sistema de ficheros. Es un proceso que
lleva mucho tiempo y que afectar? significativamente al tiempo que
tardar? su sistema en arrancar. Si desea saltarse ese paso puede usar
una variable al efecto en ``/etc/rc.conf``:

.. code:: programlisting

    check_quotas="NO"

Para concluir tendr? que editar ``/etc/fstab`` para habilitar las cuotas
de disco para cada sistema de ficheros. Es aqu? donde podr? habilitar
cuotas por usuario, por grupo, o ambos en todos sus sistemas de
ficheros.

Para habilitar cuotas por usuario en un sistema de ficheros a?ada la
opci?n ``userquota`` al campo de opciones en la entrada de
``/etc/fstab`` que corresponda al sistema de ficheros en el que quiere
habilitar las cuotas. Veamos un ejemplo:

.. code:: programlisting

    /dev/da1s2g   /home    ufs rw,userquota 1 2

En el caso de las cuotas de grupo es muy similar. Use la opci?n
``groupquota`` en lugar de ``userquota``. Para habilitar cuotas por
usuario y por grupo modifique la entrada de este modo:

.. code:: programlisting

    /dev/da1s2g    /home    ufs rw,userquota,groupquota 1 2

Por defecto los ficheros de cuota se guardan en el directorio ra?z del
sistema de ficheros con los nombres ``quota.user`` y ``quota.group``
para cuotas de usuario y grupo respectivamente. Consulte
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
para m?s informaci?n. Aunque la p?gina de manual de
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
diga que puede especificar otra ubicaci?n para los ficheros de cuota, no
se recomienda hacerlo debido a que las diversas herramientas de gesti?
cuotas no parecen sobrellevar esto adecuadamente.

Hecho todo esto puede reiniciar su sistema con el nuevo kernel.
``/etc/rc`` ejecutar? autom?ticamente los comandos apropiados para crear
los ficheros de cuota iniciales que requieran todas las entradas en en
``/etc/fstab``, as? que no hay necesidad de crear ficheros de cuota de
longitud cero.

En el curso normal de operaciones no se le deber?a pedir que ejecute
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__,
`quotaon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaon&sektion=8>`__
o
`quotaoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaoff&sektion=8>`__
manualmente. Sin embargo, tal vez quiera leer sus p?ginas de manual para
familiarizarse con su funcionamiento.

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

18.14.2. Configuraci?n de l?mites de cuota
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que tenga configurado su sistema para usar cuotas verifique que
en realidad est?n habilitadas. Una manera sencilla de hacer esto es
ejecutar:

.. code:: screen

    # quota -v

Debe ver un resumen de una sola l?nea de uso del disco y los l?mites de
cuota actuales para cada sistema de ficheros donde est?n habilitadas las
cuotas.

Ahora puede iniciar la asignaci?n de l?mites de cuota con
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.

Tiene varias opciones para imponer l?mites en el espacio de disco que un
usuario o grupo puede ocupar, y cu?ntos ficheros pueden crear. Puede
limitar el uso de disco bas?ndose en el espacio en disco (cuotas de
bloque) o en el n?mero de ficheros (cuotas de inodo) o una combinaci?n
de ambas. Cada uno de estos l?mites a su vez se divide en dos
categor?as: l?mites duros y suaves.

Un l?mite duro no puede ser excedido. Una vez que un usuario alcanza su
l?mite duro no puede realizar m?s ubicaciones en el sistema de ficheros
en cuesti?n. Por ejemplo, si el usuario tiene un l?mite duro de 500
kbytes en un sistema de ficheros y est? utilizando 490 kbytes, el
usuario solo puede ocupar otros 10 kbytes. Un intento de ocupar 11
kbytes m?s fallar?.

Los l?mites suaves pueden excederse por un periodo Este periodo de
tiempo recibe el nombre de periodo de gracia, que por defecto es una
semana. Si un usuario sobrepasa su periodo de gracia el l?mite suave se
convertir? en un l?mite duro y no se permitir?n usos de disco
adicionales. Cuando el usuario devuelve su cuota de uso de recursos a un
punto por debajo de su l?mite suave el periodo de gracia se reinicia.

Veamos un ejemplo de uso de
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.
Si se usa
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__
se entra en el el editor declarado en la variable de entorno ``EDITOR``,
o en el editor vi si no ha modificado el valor por defecto de la
variable ``EDITOR``, para que pueda editar los l?mites de cuota.

.. code:: screen

    # edquota -u test

.. code:: programlisting

    Quotas for user test:
    /usr: kbytes in use: 65, limits (soft = 50, hard = 75)
            inodes in use: 7, limits (soft = 50, hard = 60)
    /usr/var: kbytes in use: 0, limits (soft = 50, hard = 75)
            inodes in use: 0, limits (soft = 50, hard = 60)

Deber?a ver dos l?neas por cada sistema de ficheros que tenga
habilitadas las cuotas. Una l?nea para los l?mites de bloque y una l?nea
para l?mites de inodo. Por ejemplo, para elevar los l?mites de este
usuario de un l?mite suave de 50 y un l?mite duro de 75 a un l?mite
suave de 500 y un l?mite duro de 600, cambie:

.. code:: programlisting

    /usr: kbytes in use: 65, limits (soft = 50, hard = 75)

por:

.. code:: programlisting

    /usr: kbytes in use: 65, limits (soft = 500, hard = 600)

Los nuevos l?mites de cuota se aplicar?n en cuanto salga del editor.

Algunas veces se quieren activar l?mites de cuota en un rango de UIDs.
Esto puede realizarse con la opci?n ``-p`` de
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.
Primero asigne el l?mite de cuota deseado a un usuario y luego ejecute
``edquota -p protouser startuid-enduid``. Por ejemplo, si el usuario
``test`` tiene el l?mite de cuota deseado, el siguiente comando puede
usarse para duplicar esos l?mites de cuota para los UIDs de 10,000 hasta
19,999:

.. code:: screen

    # edquota -p test 10000-19999

Para m?s informaci?n consulte la p?gina de manual
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.

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

18.14.3. Revisi?n de los l?mites de cuota y uso de disco
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede usar
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
o
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8>`__
para revisar los l?mites de cuota y uso del disco. El comando
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
le permitir? revisar cuotas individuales de usuario o grupo y uso del
disco. Un usuario puede s?lamente examinar su propia cuota y la cuota de
un grupo al que pertenezca. S?lamente el superusuario puede ver las
cuotas de todos los usuarios y grupos.
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8>`__
permite obtener un resumen de todas las cuotas y uso del disco de todos
los sistemas de ficheros con cuotas habilitadas.

En el siguiente ejemplo vemos la salida de ``quota -v`` para un usuario
que tiene l?mites de cuota en dos sistemas de ficheros.

.. code:: programlisting

    Disk quotas for user test (uid 1002):
         Filesystem  usage    quota   limit   grace   files   quota   limit   grace
               /usr      65*     50      75   5days       7      50      60
           /usr/var       0      50      75               0      50      60

En el sistema de ficheros ``/usr`` del ejemplo este usuario est?
actualmente 15 kbytes sobre su l?mite suave de 50 kbytes y le quedan 5
d?as de su periodo de gracia. Observe el asterisco, ``*`` que indica que
el usuario est? actualmente por encima de su l?mite de cuota.

Normalmente los sistemas de ficheros en los que el usuario no est?
utilizando espacio en disco no se mostrar?n en la salida del comando
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__,
incluso si tiene un l?mite de cuota asignado para esos sistemas de
fichero. La opci?n ``-v`` desplegar? esos sistemas de ficheros, en
nuestro ejemplo el sistema de ficheros ``/usr/var``.

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

18.14.4. Cuotas en NFS
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las cuotas son impuestas por el subsistema de cuotas en el servidor NFS.
El d?mon
`rpc.rquotad(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.rquotad&sektion=8>`__
facilita la informaci?n a
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
en los clientes NFS, permiti?ndoles a los usuarios de esas m?quinas ver
sus estad?sticas de cuota.

Habilite ``rpc.rquotad`` en ``/etc/inetd.conf`` del siguiente modo:

.. code:: programlisting

    rquotad/1      dgram rpc/udp wait root /usr/libexec/rpc.rquotad rpc.rquotad

Y reinicie ``inetd``:

.. code:: screen

    # kill -HUP `cat /var/run/inetd.pid`

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------+---------------------------+--------------------------------------------+
| `Anterior <snapshots.html>`__?                               | `Subir <disks.html>`__    | ?\ `Siguiente <disks-encrypting.html>`__   |
+--------------------------------------------------------------+---------------------------+--------------------------------------------+
| 18.13. Instant?neas (“snapshots”) de sistemas de ficheros?   | `Inicio <index.html>`__   | ?18.15. Cifrado de particiones de disco    |
+--------------------------------------------------------------+---------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
