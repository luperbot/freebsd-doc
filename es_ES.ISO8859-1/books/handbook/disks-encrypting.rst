======================================
18.15. Cifrado de particiones de disco
======================================

.. raw:: html

   <div class="navheader">

18.15. Cifrado de particiones de disco
`Anterior <quotas.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <GEOM.html>`__

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

18.15. Cifrado de particiones de disco
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Lucky Green.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD ofrece un alto grado de protecci?n contra el acceso no
autorizado a los datos. Los Permisos de fichero y MAC (Mandatory Access
Control, controles de acceso obligatorio, consulte el `Cap?tulo?16,
*Mandatory Access Control* <mac.html>`__) ayudan a evitar que otros
tengan acceso no autorizado a los datos mientras el sistema operativo
est? funcionando y la computadora est? encendida. Sin embargo los
permisos impuestos por el sistema operativo son irrelevantes si un
atacante tiene acceso f?sico al sistema y puede simplemente mover el
disco duro de la computadora a otro sistema para copiar y analizar datos
sensibles.

Independientemente de c?mo un atacante pueda conseguir acceso a un disco
duro a a un sistema apagado, el cifrado de disco basado en GEOM (GEOM
Based Disk Encryption, gbde) puede proteger los datos de los sistemas de
ficheros del sistema incluso contra atacantes muy decididos y con
recursos adecuados a su disposici?n. A diferencia de otros m?todos de
cifrado m?s dif?ciles de usar, que cifran ?nicamente ficheos
individuales, gbde cifra sistemas de ficheros completos de forma
transparente. Ni un solo texto en limpio llega a tocar el disco duro.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.15.1. Habilitar gbde en el kernel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. **Convi?rtase en ``root``**

   La configuraci?n de gbde requiere privilegios de superusuario.

   .. code:: screen

       % su -
       Password:

#. **Verifique la versi?n del sistema operativo**

   `gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__
   requiere FreeBSD 5.0 o posterior.

   .. code:: screen

       # uname -r
       5.0-RELEASE

#. **A?ada soporte de
   `gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__
   al fichero de configuraci?n de su kernel**

   A?ada la siguiente l?nea al fichero de configuraci?n de su kernel con
   el editor que prefiera:

   ``options GEOM_BDE``

   Configure, recompile e instale el kernel de FreeBSD. Este proceso se
   detalla en el `Cap?tulo?8, *Configuraci?n del kernel de
   FreeBSD* <kernelconfig.html>`__.

   Reinicie con el nuevo kernel.

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

18.15.2. Preparaci?n del disco duro cifrado
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El siguiente ejemplo asume que a?ade a su sistema un disco duro nuevo
que contendr? una sola partici?n cifrada. Esta partici?n se montar? como
``/private``. gbde puede usarse tambi?n para cifrar ``/home`` y
``/var/mail``, pero esto requerir?a instrucciones m?s complejas que las
que se pretenden dar en esta introducci?n.

.. raw:: html

   <div class="procedure">

#. **A?ada el nuevo disco**

   Instale el nuevo disco en el sistema como se explic? en la
   `Secci?n?18.3, “A?adir discos” <disks-adding.html>`__. En nuestro
   ejemplo hemos a?adido una nueva partici?n de disco como
   ``/dev/ad4s1c``. Los dispositivos ``/dev/ad0s1*`` representan
   particiones FreeBSD est?ndar que i exist?an previamente en el
   sistema.

   .. code:: screen

       # ls /dev/ad*
       /dev/ad0        /dev/ad0s1b     /dev/ad0s1e     /dev/ad4s1
       /dev/ad0s1      /dev/ad0s1c     /dev/ad0s1f     /dev/ad4s1c
       /dev/ad0s1a     /dev/ad0s1d     /dev/ad4

#. **Cr?e un directorio para los ficheros “lock” de gbde**

   .. code:: screen

       # mkdir /etc/gbde

   Los ficheros “lock” de gbde contienen informaci?n que gbde requiere
   para acceder a las particiones cifradas. Sin el acceso a los ficheros
   “lock” gbde no podr? descifrar los datos alojados en la partici?n
   cifrada sin una cantidad significativa de trabajo, tarea para la que
   adem?s no le resultar? de ayuda este software. Cada partici?n cifrada
   utiliza un fichero “lock” separado.

#. **Inicialice la partici?n gbde**

   Una partici?n gbde debe inicializarse antes de que pueda utilizarse.
   Esta inicializaci?n s?lo debe hacerse una vez:

   .. code:: screen

       # gbde init /dev/ad4s1c -i -L /etc/gbde/ad4s1c

   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   abrir? su editor para que pueda configurar las opciones de
   configuraci?n que se le presentar?n en una plantilla. Para utilizar
   UFS1 o UFS2, ponga el sector\_size a 2048:

   .. code:: programlisting

       $FreeBSD: src/sbin/gbde/template.txt,v 1.1 2002/10/20 11:16:13 phk Exp $
       #
       # El tama?o de sector (sector size) es la unidad de datos m?s
       # peque?a que podr? leer o escribir.  Si la elige demasiado
       # peque?a reducir? el rendimiento y la cantidad de espacio
       # ?til.  Si la elige demasiado grande puede hacer que los sistemas
       # de ficheros no funcionen.  512 es el tama?o m?nimo y
       # siempre funciona.  Si va a usar UFS utilice
       #
       sector_size     =       2048
       [...]

   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   le pedir? dos veces que escriba la contrase?a que debe usarse para
   asegurar los datos. La contrase?a debe ser la misma las dos veces. La
   capacidad de gbde de proteger sus datos depende ?ntegramente de la
   calidad de la contrase?a que elija.
   `:sup:`[11]` <#ftn.idp78501072>`__

   El fichero ``gbde init`` crea un fichero “lock” para su partici?n
   gbde, que en nuestro ejemplo est? en ``/etc/gbde/ad4s1c``.

   .. raw:: html

      <div class="caution" xmlns="">

   Atenci?n:
   ~~~~~~~~~

   Es imprescindible que los ficheros “lock” de gbde *deben* respaldarse
   junto con el contenido de cualquier partici?n cifrada. Aunque la sola
   acci? de borrar un fichero “lock” no puede evitar que un atacante
   motivado descifre una partici?n gbde sin el fichero “lock”, el
   propietario leg?timo no podr? acceder a los datos en la partici?n
   cifrada sin una cantidad notable de trabajo, que es necesario se?alar
   que no entra dentro de las funciones de
   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   ni de su dise?ador.

   .. raw:: html

      </div>

#. **Conecte al kernel la partici?n cifrada**

   .. code:: screen

       # gbde attach /dev/ad4s1c -l /etc/gbde/ad4s1c

   Se le pedir? la contrase?a que eliji? al inicializar la partici?n
   cifrada. El nuevo dispositivo cifrado aparecer? en ``/dev`` como
   ``/dev/nombre_de_dispositivo.bde``:

   .. code:: screen

       # ls /dev/ad*
       /dev/ad0        /dev/ad0s1b     /dev/ad0s1e     /dev/ad4s1
       /dev/ad0s1      /dev/ad0s1c     /dev/ad0s1f     /dev/ad4s1c
       /dev/ad0s1a     /dev/ad0s1d     /dev/ad4        /dev/ad4s1c.bde

#. **Cr?e un sistema de ficheros en el dispositivo cifrado**

   Una vez el dispositivo cifrado est? conectado al kernel puede crear
   un sistema de ficheros en el dispositivo con
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__.
   Dado que es m?s r?pido inicializar un sistema de ficheros del nuevo
   UFS2 que un sistema de ficheros del tradicional UFS1, le recomendamos
   encarecidamente usar
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
   con la opci?n ``-O2``.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   La opci?n ``-O2`` es el valor por defecto en FreeBSD?5.1-RELEASE y
   siguientes.

   .. raw:: html

      </div>

   .. code:: screen

       # newfs -U -O2 /dev/ad4s1c.bde

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
   debe ejecutarse en una partici?n gbde conectada, que podr?
   identificar por la extensi?n ``*.bde`` del nombre del dispositivo.

   .. raw:: html

      </div>

#. **Montar la partici?n cifrada**

   Cr?e un punto de montaje para el sistema cifrado de ficheros.

   .. code:: screen

       # mkdir /private

   Montar el sistema cifrado de ficheros.

   .. code:: screen

       # mount /dev/ad4s1c.bde /private

#. **Verificar que el sistema cifrado de ficheros est? disponible**

   el sistema cifrado de ficheros deber?a ser visible para
   `df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1>`__ y
   estar listo para su uso.

   .. code:: screen

       % df -H
       Filesystem        Size   Used  Avail Capacity  Mounted on
       /dev/ad0s1a      1037M    72M   883M     8%    /
       /devfs            1.0K   1.0K     0B   100%    /dev
       /dev/ad0s1f       8.1G    55K   7.5G     0%    /home
       /dev/ad0s1e      1037M   1.1M   953M     0%    /tmp
       /dev/ad0s1d       6.1G   1.9G   3.7G    35%    /usr
       /dev/ad4s1c.bde   150G   4.1K   138G     0%    /private

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

18.15.3. Montaje de sistemas cifrados de ficheros
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Todos los sistemas cifrados de ficheros deben reconectarse al kernel
despu?s de cada arranque. Adem?s, antes de poder utilizarlo debe
revisarlo por si contuviera errores y montarlo. Todo el proceso debe ser
ejecutado por el usuario ``root``.

.. raw:: html

   <div class="procedure">

#. **Conectar la partici?n gbde al kernel**

   .. code:: screen

       # gbde attach /dev/ad4s1c -l /etc/gbde/ad4s1c

   Se le pedir? la contrase?a que eliji? en la inicializaci?n de la
   partici?n cifrada gbde.

#. **Revisi?n de errores en el sistema de ficheros**

   Como que los sistemas cifrados de ficheros no pueden aparecer en
   ``/etc/fstab`` (lo que har?a que fueran montados autom?ticamente),
   los sistemas de ficheros deben revisarse manualmente mediante
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   antes de montarlos.

   .. code:: screen

       # fsck -p -t ffs /dev/ad4s1c.bde

#. **Montar los sistemas cifrados de ficheros**

   .. code:: screen

       # mount /dev/ad4s1c.bde /private

   El sistema cifrado de ficheros est? listo para su uso.

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

18.15.3.1. Montar autom?ticamente particiones cifradas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible usar un “script” para automatizar la conexi?n, revisi?n y el
montaje de una partici?n cifrada, pero por razones de seguridad el
“script” no debe contener la contrase?a de
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__.
Se recomienda ejecutar esos “scripts” se ejecuten de forma manual
proporcionando la contrase?a v?a consola o
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__.

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

18.15.4. Protecci?n criptogr?fica que usa gbde
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
cifra el XXX sector payload usando AES de 128 bits en modo CBC. Cada
sector en el disco se cifra con una clave AES diferente. Para m?s
informaci?n sobre el dise?o criptogr?fico de gbde, incluyendo c?mo se
derivan las claves de sector a partir de la contrase?a consulte
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__.

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

18.15.5. Problemas de compatibilidad
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
es incompatible con dispositivos gbde cifrados. Todos los dispositivos
``*.bde`` deben desconectarse del kernel antes de iniciar
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
o se “congelar?” durante la prueba inicial de dispositivos. Para
desconectar el el dispositivo cifrado de nuestro ejemplo haga lo
siguiente:

.. code:: screen

    # gbde detach /dev/ad4s1c

Tenga en cuenta tambi?n que, como
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4>`__
no utiliza el subsistema
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__,
no es posible usar gbde en vol?menes vinum.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp78501072" class="footnote">

`:sup:`[11]` <#idp78501072>`__\ Si quiere ayuda para seleccionar una
contrase?a segura que adem?s sea f?cil de recordar visite el sitio web
`Diceware Passphrase <http://world.std.com/~reinhold/diceware.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------+----------------------------------------------------------------------------+
| `Anterior <quotas.html>`__?              | `Subir <disks.html>`__    | ?\ `Siguiente <GEOM.html>`__                                               |
+------------------------------------------+---------------------------+----------------------------------------------------------------------------+
| 18.14. Cuotas en sistemas de ficheros?   | `Inicio <index.html>`__   | ?Cap?tulo 19. GEOM: Marco de trabajo modular de transformaci?n de discos   |
+------------------------------------------+---------------------------+----------------------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
