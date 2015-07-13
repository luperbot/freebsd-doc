============================
13.7. Limitar a los usuarios
============================

.. raw:: html

   <div class="navheader">

13.7. Limitar a los usuarios
`Anterior <users-modifying.html>`__?
Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
?\ `Siguiente <users-personalizing.html>`__

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

13.7. Limitar a los usuarios
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En un sistema multiusuario es probable que no conf?es en que el sistema
no vaya a ser da?ado por ning?n usuario.

Las cuotas de disco permiten al administrador decirle al sistema de
ficheros qu? cantidad de espacio de disco puede utilizar un usuario;
adem?s, ofrecen una manera r?pida de comprobar el uso de disco de un
usuario sin tener que calcularlo cada vez. Las cuotas se estudian en el
cap?tulo de quotas.

El resto de l?mites de recursos incluyen cantidad de CPU, memoria, y
otros recursos que el usuario puede utilizar.

Las clases de login se definen en ``/etc/login.conf``. La sem?ntica
precisa est? fuera del alcance de esta secci?n, pero se describe con
detalle en la p?gina de manual
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.
Es suficiente decir que cada usuario es asignado a una clase de login
(``default`` por defecto), y que cada clase de login tiene un conjunto
de capacidades asociado. Una capacidad de login es un par
``nombre=valor``, donde *``nombre``* es un identificador conocido y
*``valor``* una cadena de texto arbitraria que se procesa en funci?n del
nombre. Establecer clases y capacidades de login es bastante sencillo y
tambi?n se describe en
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.

Los l?mites de recursos son diferentes de las capacidades de login en
dos sentidos. En primer lugar, para cada l?mite existe un l?mite blando
(actual) y uno duro. Un l?mite blando puede ser ajustado por el usuario
o una aplicaci?n, pero no puede ser m?s alto que el l?mite duro. ?ste
?ltimo puede ser disminuido por el usuario pero nunca aumentado. En
segundo lugar, la mayor?a de los l?mites de recursos aplican a un
usuario concreto por proceso, no globalmente. N?tese, no obstante, que
estas diferencias vienen impuestas por c?mo se tratan los l?mites
espec?ficamente, no por la implementaci?n del marco de capacidades de
login (es decir, en realidad no constituyen un caso especial de
capacidades de login).

Sin m?s, a continuaci?n veremos los l?mites de recursos m?s com?nmente
usados (el resto, junto con el resto de capacidades de login, puede
encontrarse en
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__).

.. raw:: html

   <div class="variablelist">

``coredumpsize``
    El tama?o de un fichero core generado por un programa est?, por
    razones obvias, subordinado a otros l?mites sobre uso de disco (p.
    ej., ``filesize``, o cuotas de disco). Aun y as?, se usa
    frecuentemente como un m?todo menos severo de controlar consumo de
    espacio de disco, dado que los usuarios no generan ficheros core por
    ellos mismos, y a menudo no los borran, activar este l?mite puede
    evitar que agoten el espacio de disco de que disponen si alg?n
    programa grande (p. ej., emacs) deja de funcionar abruptamente.

``cputime``
    ?sta es la m?xima cantidad de tiempo de CPU que los procesos de un
    usuario pueden consumir.

    .. raw:: html

       <div class="note" xmlns="">

    Nota:
    ~~~~~

    ?ste es un l?mite sobre el *tiempo* de CPU consumido, no el
    porcentaje de uso de CPU que se muestra en algunos campos de
    `top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
    y `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__.
    Un l?mite de ese tipo no es posible a d?a de hoy, y ser?a bastante
    in?til: un compilador —probablemente una tarea leg?tima— puede usar
    pr?cticamente el 100% de la CPU durante alg?n tiempo con facilidad.

    .. raw:: html

       </div>

``filesize``
    ?ste es el tama?o m?ximo que puede llegar a tener un fichero del
    usuario. A diferencia de las cuotas de disco, este l?mite se
    especifica para ficheros individuales, no para el conjunto de todos
    los archivos que posee.

``maxproc``
    ?ste es el m?ximo n?mero de procesos que un usuario puede ejecutar a
    la vez, incluidos tanto los procesos en primer plano como los
    procesos en segundo plano. Por razones obvias, este l?mite no puede
    ser mayor que el l?mite de sistema especificado por ``kern.maxproc``
    ``sysctl``. Obs?rvese tambi?n que si asignamos un valor demasiado
    bajo a este l?mite podemos mermar la productividad de un usuario:
    frecuentemente es ?til entrar m?ltiples veces en el sistema o
    ejecutar pipelines. Algunas tareas, como compilar largos programas,
    lanzan m?ltiples procesos (p. ej.,
    `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__,
    `cc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cc&sektion=1>`__, y
    dem?s preprocesadores intermedios).

``memorylocked``
    ?sta es la m?xima cantidad de memoria que un proceso puede haber
    solicitado tener bloqueada en memoria principal (p. ej., ver
    `mlock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mlock&sektion=2>`__).
    Algunos programas cr?ticos para el sistema, como
    `amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__,
    se quedan bloqueados en la memoria principal de manera que en caso
    de ser llevados a swap no contribuyan a la basura del sistema si hay
    alg?n problema.

``memoryuse``
    ?sta es la mayor cantidad de memoria que un proceso puede consumir
    en todo momento. Incluye tanto memoria normal como uso de swap. No
    se trata de un l?mite para restringir el consumo de memoria en
    general, pero es un buen comienzo.

``openfiles``
    ?sta es la m?xima cantidad de archivos que un proceso puede tener
    abiertos. En FreeBSD, los archivos se usan tambien para representar
    sockets y canales IPC; as?, cuida de no poner este l?mite demasiado
    bajo. A nivel de sistema, el l?mite para esto lo define
    ``kern.maxfiles`` ``sysctl``.

``sbsize``
    ?ste es el l?mite de cantidad de memoria de red, y por lo tanto
    mbufs, que un usuario puede consumir. Se origin? como respuesta a un
    viejo ataque DoS que creaba muchos sockets, pero puede ser usado en
    general para limitar las comunicaciones por red.

``stacksize``
    ?ste es el tama?o m?ximo que puede alcanzar la pila de un proceso.
    Por s? solo no es suficiente para limitar la cantidad de memoria que
    puede usar un programa; en consecuencia, deber?a ser usado junto con
    otros l?mites.

.. raw:: html

   </div>

Hay unas pocas cosas m?s a recordar cuando establecemos l?mites de
recursos. A continuaci?n vienen algunas recomendaciones, sugerencias, y
comentarios varios.

.. raw:: html

   <div class="itemizedlist">

-  Los procesos que se ponen en marcha cuando arranca el sistema por
   ``/etc/rc`` est?n asignados a la clase de login ``daemon``.

-  Aunque el ``/etc/login.conf`` que viene con el sistema tiene valores
   razonables para la mayor?a de los l?mites, s?lo t?, el administrador,
   puedes saber lo que es apropiado para tu sistema.

-  A los usuarios del X Window System (X11) probablemente se les deber?a
   conceder m?s recursos que al resto. X11 de por s? consume muchos
   recursos, pero adem?s contribuye a que los usuarios ejecuten m?s
   programas simult?neamente.

-  Recuerda que hay muchos l?mites que aplican a procesos individuales,
   no al usuario en general. Por ejemplo, poner ``openfiles`` a 50
   significa que cada uno de los procesos que ejecute un usuario puede
   abrir a lo m?ximo 50 ficheros. As?, la cantidad de ficheros que un
   usuario puede abrir es el valor de ``openfiles`` multiplicado por el
   valor de ``maxproc``. Esto tambi?n aplica al uso de memoria.

.. raw:: html

   </div>

Para m?s informaci?n acerca de l?mites de recursos y clases y
capacidades de login en general, consulta las p?ginas de manual
relevantes:
`cap\_mkdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cap_mkdb&sektion=1>`__,
`getrlimit(2) <http://www.FreeBSD.org/cgi/man.cgi?query=getrlimit&sektion=2>`__,
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+-----------------------------------------------+
| `Anterior <users-modifying.html>`__?   | `Subir <users.html>`__    | ?\ `Siguiente <users-personalizing.html>`__   |
+----------------------------------------+---------------------------+-----------------------------------------------+
| 13.6. Modificaci?n de cuentas?         | `Inicio <index.html>`__   | ?13.8. Personalizar a los usuarios            |
+----------------------------------------+---------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
