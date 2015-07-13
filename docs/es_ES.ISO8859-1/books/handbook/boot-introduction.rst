====================================================
12.2. El problema que representa arrancar el sistema
====================================================

.. raw:: html

   <div class="navheader">

12.2. El problema que representa arrancar el sistema
`Anterior <boot.html>`__?
Cap?tulo 12. El proceso de arranque en FreeBSD
?\ `Siguiente <boot-blocks.html>`__

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

12.2. El problema que representa arrancar el sistema
----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El encender una computadora e iniciar el sistema operativo, trae consigo
un dilema interesante. Por definici?n, la computadora no sabe hacer
nada, hasta que el sistema operativo ha sido cargado. Esto incluye la
ejecuci?n de programas desde el disco duro. As? que este es el dilema;
si la computadora no sabe hacer nada hasta que se cargue el sistema
operativo, y el sistema operativo es un conjunto de programas que
residen en el disco duro, ?C?mo es que arranca el sistema operativo?

Este problema se asemeja a un problema del libro *Las Aventuras del
Bar?n Munchausen*. Donde un personaje ha caido parcialmente en un hoyo,
y ha podido salir al tomarse de las cintas de sus botas y jalarse hacia
fuera. En los a?os mozos de la computaci?n, el t?rmino utilizado para
hablar sobre el proceso de carga del sistema operativo era *mecanismo de
arranque* (bootstrap), que por efectos de simplificaci?n ahora conocemos
como “arranque” (booting).

En equipos con arquitectura x86, el Sistema B?sico de Entrada/Salida
(BIOS) es el responsable de cargar el sistema operativo. Para hacer
esto, el BIOS busca en el disco duro el Registro Maestro de Arranque
(RMA) (N de T. Conocido como MBR—Master Boot Record), el cual debe
localizarse en un lugar espec?fico del disco. El BIOS cuenta con
suficiente informaci?n, para cargar y ejecutar el RMA, y asumir que el
RMA puede encargarse del resto de las tareas necesarias en la carga del
sistema operativo.

Si usted s?lo cuenta con un sistema operativo instalado en su disco
duro, el RMA est?ndar ser? suficiente. Este RMA buscar? la primer
partici?n del disco que pueda arrancar, y posteriormente ejecutar? el
c?digo restante de dicha partici?n, para efecto de completar la carga
del sistema operativo.

Si usted cuenta con varios sistemas operativos instalados en su disco,
entonces puede hacer uso de un RMA diferente, uno que despliegue una
lista de los diferentes sistemas operativos, y le permita escoger cual
de ellos desea que se cargue. FreeBSD cuenta con un RMA de este tipo que
puede ser instalado, as? como otros distribuidores de sistemas
operativos cuentan con RMAs alternativos.

En el caso de FreeBSD, el resto del mecanismo de arranque, est? dividido
en tres etapas. La primer etapa es ejecutada por al RMA, que sabe lo
suficiente como para poner a la computadora en un estado espec?fico y
ejecutar la segunda etapa. La segunda etapa puede hacer un poco m?s que
esto, antes de ejecutar la tercer etapa. La tercer etapa finaliza el
trabajo de carga del sistema operativo. El trabajo es dividido en tres
etapas, debido a las limitantes que tiene una PC, en cuanto al tama?o de
los programas a ejecutar, durante las etapas uno y dos. El encadenar
estas tareas, le permiten a FreeBSD contar con un arrancador m?s
flexible.

Posteriormente el kernel es inicializado y comienza con la comprobaci?n
de dispositivos, y prepararlos para su uso. Una vez que el proceso de
arranque del kernel ha finalizado, el kernel transfiere el control al
proceso de usuario
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
quien se asegura de que los discos se encuentren en buen estado para su
uso. Posteriormente
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
inicia la configuraci?n fuente a nivel de usuario, que monta los
sistemas de ficheros, configura las tarjetas de red para que pueden
comunicarse en la red, y comunmente inicia todos los procesos que
normalmente son ejecutados en un sistema FreeBSD al arrancar el mismo.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+---------------------------+----------------------------------------------------------+
| `Anterior <boot.html>`__?                         | `Subir <boot.html>`__     | ?\ `Siguiente <boot-blocks.html>`__                      |
+---------------------------------------------------+---------------------------+----------------------------------------------------------+
| Cap?tulo 12. El proceso de arranque en FreeBSD?   | `Inicio <index.html>`__   | ?12.3. El RMA y las etapas de arranque uno, dos y tres   |
+---------------------------------------------------+---------------------------+----------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
