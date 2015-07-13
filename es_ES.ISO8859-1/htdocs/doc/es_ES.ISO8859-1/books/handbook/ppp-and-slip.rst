=======================
Cap?tulo 25. PPP y SLIP
=======================

.. raw:: html

   <div class="navheader">

Cap?tulo 25. PPP y SLIP
`Anterior <serialconsole-setup.html>`__?
Parte?IV.?Comunicaciones en red
?\ `Siguiente <userppp.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Cap?tulo 25. PPP y SLIP
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reestructurado, reorganizado, y actualizado por Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`25.1. Sinopsis <ppp-and-slip.html#idp80093520>`__
`25.2. Uso de User PPP <userppp.html>`__
`25.3. Uso de Kernel PPP <ppp.html>`__
`25.4. Uso de PPP sobre Ethernet (PPPoE) <pppoe.html>`__
`25.5. Uso de PPP sobre ATM (PPPoA) <pppoa.html>`__
`25.6. Uso de SLIP <slip.html>`__

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

25.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD cuenta con un gran numero de formas para conectar una
computadora a otra. Para establecer una red o una conecci?n a Internet
por medio de un m?dem, o bien, permitir a otras computadoras conectarse
por medio de este, se requiere del uso de PPP o SLIP. Este cap?tulo
describe en detalle como configurar los servicios de comunicaci?n para
llevar esto a cabo.

Una vez que haya leido este cap?tulo, usted sabr?:

.. raw:: html

   <div class="itemizedlist">

-  Como configurar User PPP.

-  Como configurar Kernel PPP.

-  Como configurar PPPoE (PPP over Ethernet\*).

-  Como configurar PPPoA (PPP over ATM\*).

-  Como instalar y configurar un cliente y servidor SLIP.

.. raw:: html

   </div>

N. de T.: En estricto sentido esto se refiere a contar con la conexi?n
por medio de un dispositivo Ethernet, o bien ATM, pero debido a que
usted encontrar? estos metodos en su sistema, como PPPoE o bien PPPoA,
se han dejado los conceptos “literales” del documento original. Espero
que no sea un problema.

Antes de leer este cap?tulo, usted debiese:

.. raw:: html

   <div class="itemizedlist">

-  Estar familiarizado con la terminolog?a b?sica de redes.

-  Comprender lo b?sico y el prop?sito de una conecci?n por m?dem SLIP
   y/o PPP.

.. raw:: html

   </div>

Puede ser que usted se pregunte cual es la principal diferencia entre
User PPP y kernel PPP. La respuesta es sencilla; el m?todo User PPP
procesa la entrada y salida de datos en userland (ver nota siguiente) en
lugar de hacerlo en el kernel. Esto es algo desgastante, en t?rminos del
manejo de datos entre userland y el kernel, pero permite, por mucho, un
mejor desempe?o e implementaci?n de PPP. User PPP utiliza el dispositivo
``tun`` para comunicarse con el mundo exterior, mientras que kernel—ppp,
utiliza el dispositivo ``ppp``.

En el desarrollo de este cap?tulo, se har? referencia a User PPP,
simplemente como *ppp*, a menos de que sea necesaria hacer una
distinci?n entre este y otro software de PPP, como es el caso de
``pppd``. As? mismo, si en el desarrollo del cap?tulo no se se?ala lo
contrario, todos los comandos explicados, deber?n ser ejecutados como
``root``.

N. de T. : Cuando se habla de "userland" se hace referencia a todo
aquello que \*no\* forma parte del kernel y que en el caso de c?digo de
programa, se ejecuta en modo usuario, ya que el c?digo del kernel se
ejecuta en modo kernel, supervisor, o bien en modo privilegiado de
ejecuci?n. En lo sucesivo este t?rmino ser? utilizado tal cual.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+------------------------------------------+-----------------------------------+
| `Anterior <serialconsole-setup.html>`__?   | `Subir <network-communication.html>`__   | ?\ `Siguiente <userppp.html>`__   |
+--------------------------------------------+------------------------------------------+-----------------------------------+
| 24.6. Configurando la consola serie?       | `Inicio <index.html>`__                  | ?25.2. Uso de User PPP            |
+--------------------------------------------+------------------------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
