==========================================
3.8. D?mons, se?ales y c?mo matar procesos
==========================================

.. raw:: html

   <div class="navheader">

3.8. D?mons, se?ales y c?mo matar procesos
`Anterior <basics-processes.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <shells.html>`__

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

3.8. D?mons, se?ales y c?mo matar procesos
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

cuando ejecuta un editor es f?cil controlarlo, decirle que cargue
ficheros y dem?s. Puede hacerse porque el editor permite ese control y
porque el editor depende de una *terminal*. Algunos programas no est?n
dise?ados para ejecutarse entradas continuas por parte del usuario, as?
que se desconectan de la terminal a la primera oportunidad. Por ejemplo,
un servidor web pasa todo el dia respondiendo peticiones web y
normalmente no necesita que usted le haga caso. Los programas que
transportan correo electr?nico de un sitio a otro son otro ejemplo de
esta clase de aplicaci?n.

Llamamos a estos programas *d?mons*. Los D?mons eran personajes de la
mitolog?a griega; no eran ni buenos ni malos, eran peque?os esp?ritus
sirvientes que, en gran medida, hac?an cosas ?tiles por la humanidad.
Algo muy parecido a c?mo los servidores web y los servidores de correo
hacen hoy d?a tantas cosas ?tiles para nosotros. Por eso, desde hace
mucho tiempo la mascota de BSD es ese d?mon de aspecto tan ufano con su
tridente y su c?modo calzado deportivo.

Hay una norma seg?n la cual se da nombre a los programas que suelen
ejecutarse como d?mons con una ?d? final. BIND es el d?mon de nombres de
Berkeley (y el programa que en realidad se ejecuta se llama ``named``);
el servidor web Apache se llama ``httpd``, el d?mon de ?spool? de
impresora de l?nea es ``lpd`` y as? sucesivamente. Se trata de un
acuerdo, no una ley f?rrea; por ejemplo el d?mon principal de correo de
Sendmail se llama ``sendmail``, y no ``maild``, como podr?a suponerse
visto lo precedente.

Algunas veces necesitar? comunicarse con un d?mon. Estas comunicaciones
se denominan *se?ales*; es posible comunicarse con un d?mon (o con
cualquier otro proceso ejecut?ndose) mand?ndole una se?al. Existen
diversos tipos de se?ales diferentes que puede mandar: algunas tienen un
significado especial, otras son interpretadas por la aplicaci?n y la
documentaci?n de la aplicaci?n le dir? c?mo interpreta la se?al esa
aplicaci?n). Solamente puede enviar una se?al a un del que sea usted
propietario. Si manda una se?al a un proceso de otro usuario con
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__ o
`kill(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=2>`__
ver? un mensaje del sistema en el que se le comunica que no tiene
permiso para hacer tal cosa. La excepci?n a esto es el usuario ``root``,
que puede mandar se?ales a los procesos de cualquier usuario del
sistema.

FreeBSD tambi?n enviar? se?ales de aplicaci?n en determinados casos. Si
una aplicaci?n est? mal escrita y trata de acceder a memoria a la que no
est? previsto que acceda FreeBSD manda al proceso la se?al *Violaci?n de
segmento* (``SIGSEGV``). Si una aplicaci?n ha utilizado la llamada de
sistema
`alarm(3) <http://www.FreeBSD.org/cgi/man.cgi?query=alarm&sektion=3>`__
para ser avisada despu?s de que un periodo de tiempo haya transcurrido
se le mandar? la se?al de alarma (``SIGALRM``), y as? sucesivamente.

Hay dos se?ales que pueden usarse para detener un proceso, ``SIGTERM`` y
``SIGKILL``. ``SIGTERM`` es la manera amable de matar un proceso; el
proceso puede *recibir* la se?al, darse cuenta que usted quiere que se
apague, cerrar cualquier fichero de log que pueda tener abierto y
generalmente terminar cualquier tarea que est? realizando en ese momento
antes de apagarse. En algunos casos un proceso puede incluso ignorar
``SIGTERM`` si se encuentra inmerso en una tarea que no puede ser
interrumpida.

Por el contrario, un proceso no puede ignorar una se?al ``SIGKILL``.
Esta es la se?al ?No me importa lo que est?s haciendo, detente ahora
mismo?. Si manda un ``SIGKILL`` a un proceso FreeBSD detendr? ese
proceso inmediatamente.`:sup:`[4]` <#ftn.idp69697360>`__.

Otras se?ales que puede usar: ``SIGHUP``, ``SIGUSR1`` y ``SIGUSR2``. Son
se?ales de prop?sito general, y aplicaciones diferentes pueden hacer
cosas diferentes cuando se utilicen.

Suponga que ha cambiado el fichero de configuraci?n de su servidor web;
es un buen momento para decirle al servidor web que lea y aplique la
configuraci?n. Podr?a detener y reiniciar ``httpd``, pero esto
implicar?a un per?odo breve de suspensi?n del servicio de su servidor
web, lo cual puede no ser asumible. La mayor?a de los d?mons fueron
creados pensando en que fueran capaces de responder a la se?al
``SIGHUP`` releyendo su fichero de configuraci?n. En lugar de matar y
reiniciar ``httpd`` le podr?a mandar la se?al ``SIGHUP``. Dado que no
hay una manera est?ndar para responder a estas se?ales, diferentes
d?mons tendr?n diferente comportamiento, as? que aseg?rese de leer la
documentaci?n del d?mon en cuesti?n.

Las se?ales se envian mediante
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__,
como puede verse en el siguiente ejemplo.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedimiento 3.1. Env?o de una se?al a un proceso

.. raw:: html

   </div>

Este ejemplo muestra como enviar una se?al a
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.
El fichero de configuraci?n de ``inetd`` es ``/etc/inetd.conf`` e
``inetd`` releer? dicho fichero de configuraci?n cuando se le env?e un
``SIGHUP``.

#. Identifique el ID de proceso del proceso al que quiere enviarle la
   se?al mediante
   `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ y
   `grep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=grep&sektion=1>`__.
   `grep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=grep&sektion=1>`__
   se usa para buscar cadenas de texto de su elecci?n en la salida
   est?ndar. Puede ejecutarse como un usuario normal, mientras que
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   se ejecuta como ``root``, as? que debe pasarle los par?metros ``ax``
   a `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__.

   .. code:: screen

       % ps -ax | grep inetd
         198  ??  IWs    0:00.00 inetd -wW

   Vemos que el PID de
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   es 198. En algunos casos ``grep inetd`` tambi?n puede aparecer en
   esta salida. Esto se debe a la manera en que
   `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
   tiene que encontrar la lista de procesos ejecut?ndose.

#. Utilice
   `kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
   para enviar la se?al. Debido a que
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   est? siendo ejecutado po ``root`` tendr? que usar primero
   `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
   para volverse ``root``.

   .. code:: screen

       % su
       Password:
       # /bin/kill -s HUP 198

   Del mismo modo que la mayor?a de ?rdenes UNIX?
   `kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
   no imprimir? ninguna salida si ha funcionado bien. Si env?a una se?al
   a un proceso del que no es el propietario ver? lo siguiente: kill:
   *``PID``*: Operation not permitted. Si no teclea bien el PID puede
   enviar la se?al a un proceso equivocado, lo cual puede ser malo, o si
   tiene suerte, habr? enviado la se?al a un proceso que no est? en uso
   y ver? el sistema le dir? kill: *``PID``*: No such process.

   .. raw:: html

      <div class="note" xmlns="">

   ?Por qu? utilizar ``/bin/kill``?:
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Muchas shells incorporan su propio ``kill``; esto es, el shell
   mandar? la se?al directamente, en lugar de ejecutar ``/bin/kill``.
   Esto puede ser ?til pero las diferentes shells tienen diferentes
   sintaxis para especificar el nombre de la se?al que env?an. En lugar
   de tratar de aprederse todas ellas, es m?s f?cil simplemente usar
   ``/bin/kill ...`` sea la que sea la shell que prefiera usar.

   .. raw:: html

      </div>

.. raw:: html

   </div>

El env?o de otras se?ales es muy similar; sustituya ``TERM`` o ``KILL``
en la l?nea de ?rdenes seg?n sea necesario.

.. raw:: html

   <div class="important" xmlns="">

Importante:
~~~~~~~~~~~

Matar procesos aleatorios en el sistema es una mala idea. En particular,
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
ID de proceso 1, es muy especial. Ejecutar ``/bin/kill -s KILL 1`` es
una manera r?pida de apagar su sistema. *Siempre* revise dos veces los
argumentos con los que ejecuta
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
*antes* de pulsar **Intro**.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp69697360" class="footnote">

`:sup:`[4]` <#idp69697360>`__\ Esto no es del todo cierto (ciertas cosas
no pueden ser interrumpidas. Por ejemplo, si el proceso est? tratando de
leer desde un fichero que est? en otro sistema de la red, y el otro
sistema no est? disponible por alguna raz?n (por estar apagada, o que la
red tenga un fallo), tenemos un caso de lo que llamamos ?proceso
ininterrumpible?. M?s tarde, al proceso se le acabar? el tiempo de
espera, generalmente pasados dos minutos. Tan pronto como esto ocurra el
proceso ser? liquidado.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------+----------------------------------+
| `Anterior <basics-processes.html>`__?   | `Subir <basics.html>`__   | ?\ `Siguiente <shells.html>`__   |
+-----------------------------------------+---------------------------+----------------------------------+
| 3.7. Procesos?                          | `Inicio <index.html>`__   | ?3.9. Shells                     |
+-----------------------------------------+---------------------------+----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
