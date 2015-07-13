=================
2. C?mo Colaborar
=================

.. raw:: html

   <div class="navheader">

2. C?mo Colaborar
`Anterior <index.html>`__?
?
?\ `Siguiente <ix01.html>`__

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

2. C?mo Colaborar
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las colaboraciones al sistema generalmente pueden catalogarse en las
siguientes 5 categor?as:

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1. Informes de Errores y Comentarios Generales
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las ideas o sugerencias de inter?s t?cnico *general* deben enviarse a
`lista de correo de discusiones t?cnicas en
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__.
En consecuencia, si le interesan ese tipo de cuestiones (?y no le
importa recibir un *gran* volumen de correo!) deber?a suscribirse a la
`lista de correo de discusiones t?cnicas en
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__
enviando un correo electr?nico a ``<majordomo@FreeBSD.org>``. Consulte
el `FreeBSD
Handbook <../../books/handbook/eresources.html#ERESOURCES-MAIL>`__ para
m?s informaci?n sobre ?sta y otras listas de correo.

Si encuentra un error o quiere enviar un cambio concreto por favor
utilice el programa
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
o su `equivalente en la web <../../../../send-pr.html>`__ (N. del T.: El
interfaz web de send-pr fu? desactivado a causa del “spam”). Trate de
rellenar todos los campos del informe de errores. A menos que exceda de
65KB puede inclu?r los parches directamente en el informe. Si es posible
aplicar el parche al ?rbol de fuentes no olvide inclu?r ``[PATCH]`` en
la sin?psis del informe. Cuando incluya parches *no* “copie y pegue” ya
que las tabulaciones son transformadas en espacios, haciendo el parche
in?til. Considere la posibilidad de comprimir los parches mediante
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1>`__
si sobrepasan los 20KB.

Tras rellenar el informe deber?a recibir un mensaje de confirmaci?n
junto con un n?mero de seguimiento. Conserve ese n?mero por si en alg?n
momento pudiera a?adir nueva informaci?n sobre el problema enviando
correo a ``<FreeBSD-gnats-submit@FreeBSD.org>``. Utilice el n?mero como
asunto del mensaje (por ejemplo, ``"Re: kern/3377"``. As? deber?a
enviarse la informaci?n adicional sobre cualquier PR.

Si no recibe confirmaci?n en un per?odo de tiempo razonable (entre 3
d?as y una semana, dependiendo de su tipo de conexi?n) o si por alguna
raz?n no puede utilizar el comando
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__,
puede solicitar que alguien lo haga por usted enviando un correo a
`lista de 'problem reports' de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__.

No olvide consultar `?ste
“article” <../../articles/problem-reports/article.html>`__ sobre c?mo
escribir buenos informes de problemas.

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

2.2. Cambios en la Documentaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los cambios en la documentaci?n son revisados por la `lista de correo
del proyecto de documentaci?n de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__. Por
favor, consulte `FreeBSD Documentation Project
Primer <../../books/fdp-primer/index.html>`__ para recibir instrucciones
detalladas. Env?e nuevos contenidos o cambios sobre los ya existentes
(?incluso los peque?os son bienvenidos!) mediante
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
tal y como se detalla en `Informes de Error y Comentarios
Generales <contrib-how.html#contrib-general>`__.

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

2.3. Cambios al C?digo Fuente ya Existente
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A?adir cambios o modificar el c?digo fuente existente es un tema
delicado y depende mucho de hasta qu? punto est? usted al d?a sobre el
estado actual del desarrollo de FreeBSD. Hay una versi?n en desarrollo
permanente de FreeBSD conocida como “FreeBSD-CURRENT”, disponible de muy
diversas formas para mayor comodidad de los desarrolladores que est?n
trabajando activamente en el sistema. Consulte el `FreeBSD
Handbook <../../books/handbook/current-stable.html>`__, donde se explica
c?mo obtener y utilizar FreeBSD-CURRENT.

Si trabaja con versiones anticuadas de los fuentes desafortunadamente
significar? que sus cambios podr?an con frecuencia resultar demasiado
obsoletos o demasiado divergentes para una f?cil reintegraci?n dentro de
FreeBSD. ?sta posibilidad puede minimizarse suscribi?ndose a la `lista
de anuncios importantes del Proyecto
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__
y a la `FreeBSD-CURRENT lista de
correo <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__,
donde tienen lugar los debates sobre el estado actual del sistema.

Asumiendo que puede manejarse con seguridad con unos fuentes totalmente
actualizados sobre los que aplicar sus cambios, el siguiente paso es
generar los “diffs” que enviar? al equipo de FreeBSD. H?galo con el
comando
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__.

El formato
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
que preferimos para el env?o de parches es la salida unificada generada
por ``diff         -u``. Sin embargo, para parches que implican cambios
sustanciales en una regi?n de c?digo una salida contextual de “diff”
generada por ``diff         -c`` resultar? m?s legible y en consecuencia
preferible.

Por ejemplo:

.. code:: screen

    % diff -c ficheroant?guo ficheronuevo

o

.. code:: screen

    % diff -c -r directorioant?guo directorionuevo

generar?an un conjunto de “diffs” contextuales de fichero fuente o la
jerarqu?a de directorios.

Del mismo modo

.. code:: screen

    % diff -u ficheroant?guo ficheronuevo

o

.. code:: screen

    % diff -u -r directorioant?guo directorionuevo

nos dar?an el mismo resultado excepci?n hecha del formato unificado de
los “diffs” resultantes.

Consulte la p?gina man de
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
para m?s detalles.

Una vez que disponga de un conjunto de “diffs ” (que deber?a probar con
el comando
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1>`__)
puede enviarlos para que sean inclu?dos en FreeBSD. Utilice el programa
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
tal y como se muestra `Informes de Errores y Comentarios
Generales <contrib-how.html#contrib-general>`__. ?*No* se limite
simplemente a enviar sus “diffs” a la `lista de correo de discusiones
t?cnicas en
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__ o
se perder?n! Agradecemos inmensamente su colaboraci?n (??ste es un
proyecto que funciona gracias al trabajo desinteresado de mucha gente!).
Estamos muy ocupados, as? que no podemos atender inmediatamente todos y
cada uno de los env?os recibidos, pero permanecer?n en la “PR database”
hasta que lo hagamos. Etiquete sus env?os incluyendo ``[PATCH]`` en la
sin?psis del informe.

Si lo considera oportuno (?sto es, si ha a?adido borrado o renombrado
ficheros) empaquete sus cambios en un fichero ``tar         `` y ejecute
el programa
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1>`__
sobre ?l. Puede usar tambi?n ficheros creados con
`shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__

Si su cambio puede tener un cariz potencialmente delicado ?sto es, no
est? seguro de bajo qu? tipo de “licencia” ser?a su distribuci?n
ulterior o simplemente no est? listo para liberarlo sin una revisi?n
exhaustiva, deber?a enviarlo directamente a FreeBSD core team en lugar
de usar
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__.
El FreeBSD core team incluye un grupo de gente mucho m?s peque?o que
lleva a cabo la mayor parte del trabajo diario en FreeBSD. Tenga en
cuenta que el FreeBSD core team est? *muy ocupado* y por lo tanto s?lo
deber?a envi?rsele correo cuando sea estrictamente necesario.

Consulte la p?ginas “man” de
`intro(9) <http://www.FreeBSD.org/cgi/man.cgi?query=intro&sektion=9>`__
y
`style(9) <http://www.FreeBSD.org/cgi/man.cgi?query=style&sektion=9>`__
para saber m?s acerca del estilo de codificaci?n requerido. Le
agradecer?amos mucho que al menos tuviera en cuenta esa informaci?n
antes de enviar c?digo.

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

2.4. New Code or Major Value-Added Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En el caso de una contribuci?n significativa o de gran impacto, o si se
trata de a?adir una nueva caracter?stica importante a FreeBSD, enviar
ficheros tar tratados con “uuencode” o por el contrario ponerlos a
disposici?n de otras personas en un sitio web o FTP se convierte en algo
pr?cticamente imprescindible. Si no dispone de acceso a un sitio web o
FTP pregunte en la lista apropiada de FreeBSD para que alguien se lo
facilite.

Cuando se trabaja con un gran volumen de c?digo el espinoso tema de la
“licencia” invariablemente sale a la palestra. Las “licencias” admitidas
para la inclusi?n de c?digo en FreeBSD son:

.. raw:: html

   <div class="orderedlist">

#. 

   La licencia BSD. ?sta licencia es la preferida a causa de su
   naturaleza carente de “requerimientos a?adidos” y su atractivo
   general para la empresa. Lejos de buscar evitar el uso comercial, el
   Proyecto FreeBSD recomienda vivamente la participaci?n de entidades
   comerciales que pudieran en casos determinados dedicar parte de sus
   recursos a FreeBSD.

#. 

   La GNU General Public License, o “GPL”. ?sta licencia no es tan
   popular debido al esfuerzo a?adido que requiere de cualquiera que
   usara el c?digo con fines comerciales, pero dada la ingente cantidad
   de c?digo GPL que usamos habitualmente (el compilador, el
   ensamblador, el procesador de texto, etc) ser?a est?pido rechazar
   contribuciones bajo ?sta licencia. El c?digo bajo licencia GPL
   tambi?n se incluye bajo una parte diferenciada del ?rbol, pudiendo
   ser ``/sys/gnu`` o ``/usr/src/gnu``, y es por tanto f?cilmente
   identificable para quienes la licencia GPL suponga un problema.

.. raw:: html

   </div>

Todo lo que vaya bajo cualquier otro tipo de licencia requiere que ?sta
deba ser cuidadosamente revisada antes de que su inclusi?n en FreeBSD
sea llevada a consideraci?n. Las aportaciones bajo licencias comerciales
particularmente restrictivas en vigor por lo general son rechazadas
aunque siempre se recomienda a los autores que hagan p?blicamente
accesible su trabajo usando sus propios medios.

Para poner su trabajo bajo la licencia “BSD” inserte el siguiente texto
al principio de todos y cada uno de los ficheros de c?digo que quiera
amparar bajo la misma, reemplazando el texto entre ``%%`` con la
informaci?n apropiada:

.. code:: programlisting

    Copyright (c) %%a?os_exactos%%
            %%su_nombre%%, %%su_estado/pa?s%%  %%su_c?digo_postal%%.
        All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer as
       the first lines of this file unmodified.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY %%su_nombre%% ``AS IS'' AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL %%su_nombre%% BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
    THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

            $Id$

Para su comodidad existe una copia de ?ste texto en
``/usr/share/examples/etc/bsd-style-copyright``.

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

2.5. Dinero, Hardware o Acceso a Internet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Estamos encantados de aceptar donaciones econ?micas para ayudar a
impulsar el Proyecto FreeBSD y, como en cualquier proyecto mantenido por
voluntarios, un poco puede hacer mucho. Tambi?n son muy importantes las
donaciones de hardware para ampliar nuestra lista de hardware soportado,
dado que normalmente andamos cortos de fondos con los que comprar ese
tipo de material.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.5.1. Donaci?n de Fondos
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La Fundaci?n FreeBSD es una fundaci?n sin ?nimo de lucro y exenta de
impuestos creada para impulsar los objetivos del Proyecto FreeBSD. Como
una entidad 501(c)3, la Fundaci?n est? pr?cticamente exenta del pago del
impuesto federal de la renta de los EEUU as? como del del Estado de
Colorado. Las donaciones a una entidad libre de impuestos suelen ser
deducibles en la declaraci?n federal de impuestos.

Las donaciones pueden enviarse mediante cheque a:

.. raw:: html

   <div class="address">

| 
|  ????The?FreeBSD?Foundation
|  ????7321?Brockway?Dr.
|  ????Boulder,?CO?80303
|  ????USA
|  ??

.. raw:: html

   </div>

La Fundaci?n FreeBSD puede tambi?n aceptar donaciones via web mediante
PayPal. Para hacer una donaci?n visite la p?gina web `de la
Fundaci?n <http://www.freebsdfoundation.org>`__.

Puede encontrar m?s informaci?n sobre la Fundaci?n en `The FreeBSD
Foundation -- an
Introduction <http://people.FreeBSD.org/~jdp/foundation/announcement.html>`__.
Puede enviar correo electr?nico a la Fundaci?n a
``<bod@FreeBSDFoundation.org>``.

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

2.5.2. Donaci?n de Hardware
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El Proyecto FreeBSD acepta encantado donaciones de hardware que le
resulte ?til. Si desea donar hardware por favor p?ngase en contacto con
la `Donations Liaison Office <http://www.FreeBSD.org/donations/>`__.

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

2.5.3. Donaci?n de Acceso a Internet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nunca viene mal una nueva r?plica para sitios FTP, WWW o ``cvsup``. Si
desea ofrecer alguno de esos servicios por favor consulte el siguiente
art?culo `Mirroring FreeBSD <../../articles/hubs/index.html>`__ para m?s
informaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+--------------------------------+
| `Anterior <index.html>`__?   | ?                         | ?\ `Siguiente <ix01.html>`__   |
+------------------------------+---------------------------+--------------------------------+
| Contribuir a FreeBSD?        | `Inicio <index.html>`__   | ??ndice                        |
+------------------------------+---------------------------+--------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
