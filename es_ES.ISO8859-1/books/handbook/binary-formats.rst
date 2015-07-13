=======================
3.12. Formatos binarios
=======================

.. raw:: html

   <div class="navheader">

3.12. Formatos binarios
`Anterior <basics-devices.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <basics-more-information.html>`__

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

3.12. Formatos binarios
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para poder entender por qu? FreeBSD utiliza el formato
`elf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=elf&sektion=5>`__
primero debe saber ciertas cosas sobre los tres formatos de ejecutables
?dominantes? en UNIX?:

.. raw:: html

   <div class="itemizedlist">

-  `a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5>`__

   El formato objeto de UNIX? m?s antiguo y ?cl?sico?. Utiliza una
   cabecera corta y compacta con un n?mero m?gico al inicio que se usa
   frecuentemente para identificar el formato (vea
   `a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5>`__
   para m?s informaci?n). Contiene tres segmentos cargados: .text,
   .data, y .bss adem?s de una tabla de s?mbolos y una tabla de cadena
   (?strings?).

-  COFF

   El formato objeto de SVR3. La cabecera consiste en una tabla de
   secci?n, para que pueda tener m?s contenido adem?s de las secciones
   .text, .data, y .bss.

-  `elf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=elf&sektion=5>`__

   Es el sucesor de COFF; dispone de secciones m?ltiples y valores
   posibles de 32-bits o 64-bits. Una gran desventaja: ELF fu? tambi?n
   dise?ado asumiendo que solamente existir?a una ABI por cada
   arquitectura de sistema. Esa suposici?n es en realidad bastante
   incorrecta y ni siquiera en el mundo comercial SYSV (el cual tiene al
   menos tres ABIs: SVR4, Solaris y SCO) se puede dar por buena.

   FreeBSD trata de solucionar este problema de alguna manera ofreciendo
   una herramienta para *marcar* un ejecutable ELF conocido con
   informaci?n acerca de la ABI con la que funciona. Si quiere m?s
   informaci?n consulte la p?gina de manual de
   `brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__.

.. raw:: html

   </div>

FreeBSD viene del campo ?cl?sico? y ha utilizado el formato
`a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5>`__,
una tecnolog?a usada y probada en muchas de muchas generaciones de
versiones de BSD hasta el inicio de la rama 3.X. Aunque era posible
compilar y ejecutar binarios nativos ELF (y kernels) en un sistema
FreeBSD desde alg?n tiempo antes de esto, FreeBSD al principio se
mantuvo ?contra corriente? y no cambi? a ELF como formato por defecto.
?Por qu?? Bueno, cuando el mundo Linux efectu? su dolorosa transici?n a
ELF no fu? tanto por huir del formato ``a.out`` como por su inflexible
mecanismo de bibliotecas compartidas basado en tablas de saltos, que
hac?a igual de dif?cil la construcci?n de bibliotecas compartidas tanto
para los desarrolladores como para los proveedores. Ya que las
herramientas ELF disponibles ofrec?an una soluci?n al problema de las
bibliotecas compartidas y eran vistas por mucha gente como ?la manera de
avanzar?, el costo de migraci?n fu? aceptado como necesario y se realiz?
la transici?n. El mecanismo de bibliotecas compartidas de FreeBSD est?
dise?ado de manera m?s cercana al estilo del sistema de bibliotecas
compartidas de SunOS™ de Sun y, como tal, es muy sencillo de utilizar.

Entonces, ?por qu? existen tantos formatos diferentes?

En un tiempo muy, muy lejano, exist?a hardware simple. Este hardware tan
simple soportaba un sistema peque?o, simple. ``a.out`` era id?neo para
el trabajo de representar binarios en este sistema tan simple (un
PDP-11). A medida que la gente portaba UNIX? desde este sistema simple,
retuvieron el formato ``a.out`` debido a que era suficiente para los
primeros portes de UNIX? a arquitecturas como 68k de Motorola, VAXen,
etc.

Entonces alg?n brillante ingeniero de hardware decidi? que si pod?a
forzar al software a hacer algunos trucos sucios podr?a sortear ciertos
obst?culos del dise?o y permitir al n?cleo de su CPU correr m?s
r?pidamente. Aunque estaba hecho para trabajar con este nuevo tipo de
hardware (conocido entonces como RISC), ``a.out`` no estaba bien
adaptado para este hardware, as? que varios formatos fueron
desarrollados para obtener un rendimiento mayor de este hardware que el
pod?a extraerse del limitado y simple formato ``a.out``. As? fu? c?mo
COFF, ECOFF y algunos otros formatos m?s extra?os fueron inventados y
sus limitaciones exploradas hasta que se fu? llegando a la elecci?n de
ELF.

Adem?s, el tama?o de los programas estaba volviendose gigante y los
discos (y la memoria f?sica) eran relativamente peque?os, as? que el
concepto de una biblioteca compartida naci?. El sistema VM tambi?n se
volvi? m?s sofisticado. A pesar de que todos estos avances se hicieron
utilizando el formato ``a.out``, su utilidad se iba reduciendo
paulatinamente con cada nueva opci?n. Adem?s, la gente quer?a cargar
cosas din?micamente en el momento de ejecuci?n, o descartar partes de su
programa despu?s de que el c?digo de inicio se ejecutara para ahorrar
memoria principal y espacio de swap. Al volverse m?s sofisticados los
lenguajes, la gente empez? a ver la necesidad de introducir c?digo antes
del inicio del programa de forma autom?tica. Se hicieron muchos hacks al
formato ``a.out`` para permitir que todas estas cosas sucedieran y lo
cierto es que por un tiempo funcionaron. Pero ``a.out`` no estaba para
solucionar todos estos problemas sin incrementar la carga y complejidad
del c?digo. Aunque ELF resolv?a muchos de estos problemas, en ese
momento hubiera sido terrible dejar de lado un sistema que funcionaba,
as? que ELF tuvo que esperar hasta que fu? m?s doloroso permanecer con
``a.out`` que migrar a ELF.

De todas maneras, con el paso del tiempo las herramientas de compilaci?n
de las que FreeBSD deriv? las suyas (en especial el ensamblador y el
cargador) evolucionaron en dos ?rboles paralelos. El ?rbol FreeBSD
FreeBSD a?adi? bibliotecas compartidas y corrigi? algunos errores. La
gente de GNU (que fueron quienes escribieron estos programas) los
reescribi? y a?adieron una forma m?s simple de disponer de compiladores
cruzados (?cross compilers?), el uso de diferentes formatos, etc. Aunque
mucha gente quer?a compiladores cruzados con FreeBSD como ?blanco? no
hubo suerte, porque los fuentes que que FreeBSD ten?a para as y ld no
estaban listos para cumplir esa tarea. La nueva cadena de herramientas
GNU (binutils) soporta compilaci?n cruzada, ELF, bibliotecas
compartidas, extensiones C++, etc. Adem?s, muchos proveedores est?n
liberando binarios ELF y es algo muy bueno que FreeBSD los pueda
ejecutar.

ELF es m?s expresivo que ``a.out`` y permite un sistema base m?s
extensible. Las herramientas ELF est?n mejor mantenidas y ofrecen
soporte de compilaci?n cruzada, muy importante para mucha gente. ELF
puede ser un poco m?s lento que ``a.out``, pero tratar de medirlo puede
ser dif?cil. Tambi?n existen numerosos detalles que son diferentes entre
los dos en c?mo gestionan p?ginas, c?mo gestionan c?digo de inicio, etc.
Ninguna es muy importante, pero las diferencias existen. Con el tiempo,
el soporte para ``a.out`` ser? eliminado del kernel ``GENERIC`` y es muy
posible que se elimine del kernel la posibilidad de ejecutar tales
binarios una vez que la necesidad de usar programas ``a.out`` haya
pasado.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+---------------------------+---------------------------------------------------+
| `Anterior <basics-devices.html>`__?           | `Subir <basics.html>`__   | ?\ `Siguiente <basics-more-information.html>`__   |
+-----------------------------------------------+---------------------------+---------------------------------------------------+
| 3.11. Dispositivos y nodos de dispositivos?   | `Inicio <index.html>`__   | ?3.13. M?s informaci?n                            |
+-----------------------------------------------+---------------------------+---------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
