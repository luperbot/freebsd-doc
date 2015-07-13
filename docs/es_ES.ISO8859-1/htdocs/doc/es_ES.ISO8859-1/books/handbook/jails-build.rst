==================================
15.4. Creaci?n y gesti?n de jaulas
==================================

.. raw:: html

   <div class="navheader">

15.4. Creaci?n y gesti?n de jaulas
`Anterior <jails-intro.html>`__?
Cap?tulo 15. Jaulas
?\ `Siguiente <jails-tuning.html>`__

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

15.4. Creaci?n y gesti?n de jaulas
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos administradores dividen las jaulas en dos tipos: jaulas
“completas”, que recrean un sistema FreeBSD real, y jaulas “de
servicio”, que son aquellas que est?n dedicadas a una sola aplicaci?n o
servicio, en muchos casos ejecut?ndose sin privilegios. Se trata de una
divisi?n exclusivamente conceptual, por lo que el proceso de generaci?n
de una jaula no se ve afectado por ella. La p?gina de manual
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
explica claramente el procedimiento a seguir para generar una jaula:

.. code:: screen

    # setenv D /aqu?/est?/la/jaula
    # mkdir -p $D 
    # cd /usr/src
    # make world DESTDIR=$D 
    # cd etc/ [9]
    # make distribution DESTDIR=$D 
    # mount_devfs devfs $D/dev 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#jailpath>`__                  | El mejor punto de partida es la      |
|                                      | elecci?n del punto del sistema de    |
|                                      | ficheros del servidor donde estar?   |
|                                      | f?sicamente ubicada la jaula.        |
|                                      | ``/usr/jail/nombredelajaula`` es un  |
|                                      | buen sitio. *``nombredelajaula``* es |
|                                      | el nombre de m?quina que identifica  |
|                                      | a la jaula. El sistema de ficheros   |
|                                      | ``/usr/`` suele tener espacio        |
|                                      | suficiente para albergar el sistema  |
|                                      | de ficheros de la jaula que, cuando  |
|                                      | se trata de jaulas “completas”, es   |
|                                      | esencialmente lo necesario para      |
|                                      | alojar todos y cada uno de los       |
|                                      | sistemas de ficheros en una          |
|                                      | instalaci?n del sistema base por     |
|                                      | omisi?n de FreeBSD.                  |
+--------------------------------------+--------------------------------------+
| `|2| <#jailworld>`__                 | Este comando crear? el contenido     |
|                                      | necesario (binarios, bibliotecas,    |
|                                      | p?ginas de manual, etc.) y lo        |
|                                      | copiar? al “sub?rbol” elegido como   |
|                                      | ubicaci?n f?sica de la jaula. Todo   |
|                                      | se hace al t?pico estilo FreeBSD: se |
|                                      | compila todo y luego se instala en   |
|                                      | la ruta de destino.                  |
+--------------------------------------+--------------------------------------+
| `|3| <#jaildistrib>`__               | Al pasar el “target”                 |
|                                      | ``distribution`` a make se instalan  |
|                                      | todos los ficheros de configuraci?n  |
|                                      | necesarios. En pocas palabras,       |
|                                      | instala cada fichero instalable que  |
|                                      | haya en ``/usr/src/etc/`` en el      |
|                                      | directorio ``/etc`` de la jaula, es  |
|                                      | decir, en ``$D/etc/``.               |
+--------------------------------------+--------------------------------------+
| `|4| <#jaildevfs>`__                 | No es imprescindible montar el       |
|                                      | sistema de ficheros                  |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | dentro de la jaula aunque por otra   |
|                                      | parte (casi) todas las aplicaciones  |
|                                      | necesitan acceso al menos a un       |
|                                      | dispositivo, dependiendo esto del    |
|                                      | prop?sito de la aplicaci?n. Es muy   |
|                                      | importante el control del acceso a   |
|                                      | dispositivos desde la jaula, puesto  |
|                                      | que una configuraci?n descuidada     |
|                                      | puede permitir que un atacante haga  |
|                                      | de las suyas. El control sobre       |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | se gestiona mediante reglas que se   |
|                                      | detallan en las p?ginas de manual    |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | y                                    |
|                                      | `devfs.conf(5) <http://www.FreeBSD.o |
|                                      | rg/cgi/man.cgi?query=devfs.conf&sekt |
|                                      | ion=5>`__.                           |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Una vez instalada la jaula puede arrancarla mediante
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
usa los cuatro argumentos que se detallan en la `Secci?n?15.3.1, “Qu? es
una jaula” <jails-intro.html#jails-what>`__. Puede pasarle otros
argumentos adem?s de estos, por ejemplo para ejecutar procesos
enjaulados bajo los permisos de un usuario espec?fico. El argumento
``comando`` depende del tipo de jaula; si se trata de un *virtual
system* ``/etc/rc`` es una buena elecci?n, puesto que ejecutar? la
secuencia de arranque de un sistema FreeBSD real. Si se trata de una
jaula *de servicio* depende del servicio o aplicaci?n que se quiera
ejecutar mediante la jaula.

Con frecuencia las jaulas se arrancan durante el arranque del servidor
que las aloja; el sistema ``rc`` de FreeBSD permite hacerlo de un modo
muy sencillo.

.. raw:: html

   <div class="procedure">

#. Puede crear una lista de jaulas que quiera arrancar en el inicio del
   sistema en el fichero
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__:

   .. code:: programlisting

       jail_enable="YES"   # Ponga NO si quiere desactivar el arranque de jaulas
       jail_list="www"     # Lista de nombres de jaulas separados por espacios

#. Tendr? que a?adir par?metros espec?ficos para cada jaula al fichero
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__:

   .. code:: programlisting

       jail_www_rootdir="/usr/jail/www"     # directorio raiz de la jaula
       jail_www_hostname="www.example.org"  # nombre de m?quina de la jaula
       jail_www_ip="192.168.0.10"           # direcci?n IP de la jaula
       jail_www_devfs_enable="YES"          # montar devfs en la jaula
       jail_www_devfs_ruleset="www_ruleset" # reglas a aplicar a devfs dentro de la jaula

   El arranque de jaulas por omisi?n que se configure en
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   ejecutar? el script ``/etc/rc`` de la jaula y asumir? que es un
   sistema virtual completo. Si se trata de una jaula de servicio el
   comando de arranque por omisi?n tendr? que cambiarse configurando la
   opci?n ``jail_nombredejaula``\ \_exec\_start seg?n convenga.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Si quiere consultar la lista completa de opciones consulte la p?gina
   de manual
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Puede arrancar o parar a mano una jaula mediante el script
``/etc/rc.d/jail`` siempre y cuando la jaula aparezca en ``rc.conf``:

.. code:: screen

    # /etc/rc.d/jail start www
    # /etc/rc.d/jail stop www

De momento no hay una forma limpia de apagar una jaula
(`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__)
debido a que los comandos que se usan normalmente para producir un
apagado limpio del sistema no pueden usarse dentro de una jaula. La
mejor forma de parar una jaula es ejecutar el siguiente comando desde
dentro de la propia jaula o bien mediante
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
desde fuera:

.. code:: screen

    # sh /etc/rc.shutdown

Para m?s informaci?n consulte la p?gina de manual
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp76818000" class="footnote">

`:sup:`[9]` <#idp76818000>`__\ Este paso no es necesario en FreeBSD 6.0
y versiones posteriores.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------+---------------------------------------------------+
| `Anterior <jails-intro.html>`__?   | `Subir <jails.html>`__    | ?\ `Siguiente <jails-tuning.html>`__              |
+------------------------------------+---------------------------+---------------------------------------------------+
| 15.3. Introducci?n?                | `Inicio <index.html>`__   | ?15.5. Administraci?n y personalizaci?n a fondo   |
+------------------------------------+---------------------------+---------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
