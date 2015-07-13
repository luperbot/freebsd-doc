=============
3.7. Procesos
=============

.. raw:: html

   <div class="navheader">

3.7. Procesos
`Anterior <mount-unmount.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <basics-daemons.html>`__

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

3.7. Procesos
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD es un sistema operativo multitarea. Esto significa que parece
como si m?s de un programa se estuviera ejecutando al mismo tiempo. Cada
programa uno de esos programas que se est? ejecutando en un momento dado
se denomina *proceso*. Cada orden que ejecuta iniciar? al menos un
proceso nuevo, y hay muchos procesos que se est?n que se est?n
ejecutando en todo momento, manteniendo el sistema en funcionamiento.

Cada proceso tiene un identificador individual consistente en un n?mero
llamado *ID del proceso*, o *PID*, y al igual que sucede con los
ficheros, cada proceso tiene un propietario y un grupo. La informaci?n
de propietario y grupo se usa para determinar qu? ficheros y
dispositivos puede abrir el proceso mediante los permisos de fichero
explicados anteriormente. La mayor?a de los procesos tambi?n tiene un
proceso padre. El proceso padre es el proceso que los inici?. Por
ejemplo, si est? tecleando ?rdenes en la shell, la shell es un proceso,
y cualquier orden que usted ejecute tambi?n lo ser?. De este modo cada
proceso que ejecute tendr? como proceso padre a su shell. La excepci?n
es un proceso especial llamado
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__.
``init`` es siempre el primer proceso, as? que su PID siempre es 1. El
kernel arranca autom?ticamente ``init`` en el arranque de FreeBSD.

Hay dos ?rdenes particularmente ?tiles para ver los procesos en el
sistema,
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ y
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__.
``ps`` se usa para mostrar una lista est?tica de los procesos que se
ejecutan en el sistema en es momento, y puede mostrar sus PID, cu?nta
memoria est? usando, la l?nea de ?rdenes con la que fueron iniciados y
muchas m?s cosas. ``top`` despliega todos los procesos que se est?n
ejecutando y actualiza la pantalla cada pocos segundos para que pueda
ver lo que est? haciendo su sistema.

Por omisi?n ``ps`` solo le muestra las ?rdenes que est?n ejecutando *y*
que sean propiedad de su usuario. Por ejemplo:

.. code:: screen

    % ps
      PID  TT  STAT      TIME COMMAND
      298  p0  Ss     0:01.10 tcsh
     7078  p0  S      2:40.88 xemacs mdoc.xsl (xemacs-21.1.14)
    37393  p0  I      0:03.11 xemacs freebsd.dsl (xemacs-21.1.14)
    48630  p0  S      2:50.89 /usr/local/lib/netscape-linux/navigator-linux-4.77.bi
    48730  p0  IW     0:00.00 (dns helper) (navigator-linux-)
    72210  p0  R+     0:00.00 ps
      390  p1  Is     0:01.14 tcsh
     7059  p2  Is+    1:36.18 /usr/local/bin/mutt -y
     6688  p3  IWs    0:00.00 tcsh
    10735  p4  IWs    0:00.00 tcsh
    20256  p5  IWs    0:00.00 tcsh
      262  v0  IWs    0:00.00 -tcsh (tcsh)
      270  v0  IW+    0:00.00 /bin/sh /usr/X11R6/bin/startx -- -bpp 16
      280  v0  IW+    0:00.00 xinit /home/nik/.xinitrc -- -bpp 16
      284  v0  IW     0:00.00 /bin/sh /home/nik/.xinitrc
      285  v0  S      0:38.45 /usr/X11R6/bin/sawfish

Como puede ver en este ejemplo la salida de
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ est?
organizada en columnas. ``PID`` es el ID de proceso anteriormente
expuesto. Los PIDs se asignan a partir del 1 y hasta 99999, y vuelven a
comenzar desde el 1 otra cuando se terminan los n?meros. La columna
``TT`` muestra la tty en la que el programa se est? ejecutando; podemos
ignorarla tranquilamente por el momento. ``STAT`` muestra el estado del
programa; de momento tambi?n podemos ignorarlo. ``TIME`` es la cantidad
de tiempo que el programa ha se ha estado ejecutando en la CPU
(generalmente no es el tiempo transcurrido desde que se inici? el
programa, ya que la mayor?a de los programas pasan mucho tiempo
esperando antes de que necesiten gastar tiempo en la CPU. Finalmente,
``COMMAND`` es la l?nea de ?rdenes que se emple? para ejecutar el
programa.

`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ admite
muchas opciones sobre la informaci?n que se desea ver. Uno de los
conjuntos m?s ?tiles es ``auxww``. ``a`` muestra informaci?n acerca de
todos los procesos ejecut?ndose, no solamente los suyos. ``u`` despliega
el nombre de usuario del propietario del proceso, as? como el uso de
memoria. ``x`` despliega informaci?n acerca de los procesos d?mon y
``ww`` hace que
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
despliegue la l?nea de ?rdenes completa, en lugar de truncarla cuando es
demasiado larga para caber en la pantalla.

La salida de
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__ es
similar. Veamos un ejemplo:

.. code:: screen

    % top
    last pid: 72257;  load averages:  0.13,  0.09,  0.03    up 0+13:38:33  22:39:10
    47 processes:  1 running, 46 sleeping
    CPU states: 12.6% user,  0.0% nice,  7.8% system,  0.0% interrupt, 79.7% idle
    Mem: 36M Active, 5256K Inact, 13M Wired, 6312K Cache, 15M Buf, 408K Free
    Swap: 256M Total, 38M Used, 217M Free, 15% Inuse

      PID USERNAME PRI NICE  SIZE    RES STATE    TIME   WCPU    CPU COMMAND
    72257 nik       28   0  1960K  1044K RUN      0:00 14.86%  1.42% top
     7078 nik        2   0 15280K 10960K select   2:54  0.88%  0.88% xemacs-21.1.14
      281 nik        2   0 18636K  7112K select   5:36  0.73%  0.73% XF86_SVGA
      296 nik        2   0  3240K  1644K select   0:12  0.05%  0.05% xterm
    48630 nik        2   0 29816K  9148K select   3:18  0.00%  0.00% navigator-linu
      175 root       2   0   924K   252K select   1:41  0.00%  0.00% syslogd
     7059 nik        2   0  7260K  4644K poll     1:38  0.00%  0.00% mutt
    ...

La salida est? dividida en dos secciones. La cabecera (las primeras
cinco l?neas) muestra el PID del ?ltimo proceso en ejecutarse, la carga
promedio del sistema (una medida de la carga del sistema), el ?uptime?
del sistema (tiempo desde el ?ltimo reinicio) y la hora actual. Las
otras cifras en la cabecera se relacionan con cu?ntos procesos hay en
ejecuci?n en el sistema (47 en este caso), cu?nta memoria y espacio de
intercambio (swap) est? en uso, y cu?nto tiempo est? el sistema en
diferentes estados de CPU.

M?s abajo hay una serie de columnas con informaci?n similar a la salida
de `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__.
Igual que antes, puede usted ver el PID, el nombre de usuario, la
cantidad de tiempo de CPU en uso y la orden que se ejecut?.
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
tambi?n mostrar? por omisi?n la cantidad de espacio de memoria que
emplea cada proceso. Est? dividido en dos columnas, una para el tama?o
total y otra para el tama?o residente (el tama?o total es cu?nta memoria
ha necesitado la aplicaci?n y el tama?o residente es cu?nta se est?
usando en ese momento concreto). En este ejemplo puede verse que
Netscape? requerido casi 30?MB de RAM, pero actualmente solo est? usando
9?MB.

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
actualiza autom?ticamente el listado cada dos segundos, pero este lapso
puede cambiarse mediante la opci?n ``s``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+---------------------------+-----------------------------------------------+
| `Anterior <mount-unmount.html>`__?                   | `Subir <basics.html>`__   | ?\ `Siguiente <basics-daemons.html>`__        |
+------------------------------------------------------+---------------------------+-----------------------------------------------+
| 3.6. Montaje y desmontaje de sistemas de ficheros?   | `Inicio <index.html>`__   | ?3.8. D?mons, se?ales y c?mo matar procesos   |
+------------------------------------------------------+---------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
