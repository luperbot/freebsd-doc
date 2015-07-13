=================================================
Perforce en el contexto del desarrollo de FreeBSD
=================================================

.. raw:: html

   <div class="article" lang="es" lang="es">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Scott Long
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| ``<scottl@FreeBSD.org>``
|  ??????????

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revisi?n: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

CVSup is a registered trademark of John D. Polstra.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

por .

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`1. Introducci?n <#intro>`__
`2. Los comienzos <#start>`__
`3. Clientes <#clients>`__
`4. Sincronizaciones <#syncing>`__
`5. Ramas <#branches>`__
`6. Integraciones <#Integrations>`__
`7. Aplicaci?n de cambios en el repositorio <#submit>`__
`8. Edici?n <#editing>`__
`9. Cambios, descripciones e historial <#changes>`__
`10. “diffs” <#diffs>`__
`11. A?adir o eliminar ficheros <#add-rm-files>`__
`12. El trabajo con “diffs” <#working-with-diffs>`__
`13. Cambiar nombres de ficheros <#renaming-files>`__
`14. Interacciones entre el CVS de FreeBSD y
Perforce <#freebsd-cvs-and-p4>`__
`15. Funcionamiento sin conexi?n de red <#offline-ops>`__
`16. Consideraciones finales para el “Google Summer of Code” <#soc>`__

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

1. Introducci?n
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El proyecto FreeBSD utiliza el sistema de control de versiones Perforce
para gestionar proyectos experimentales que todav?a no est?n listos para
ser incluidos en el repositorio principal de CVS.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1. Disponibilidad, documentaci?n y recursos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aunque que el producto Perforce es un producto comercial, el software
cliente que se encarga de interactuar con el servidor se distribuye
libremente. Pueden descargarse versiones binarias del mismo desde el
sitio web de Perforce:
``http://www.perforce.com/perforce/loadprog.html``.

Existe un cliente gr?fico, pero la mayor?a de la gente utiliza la
aplicaci?n de l?nea de ?rdenes, ``p4``. Este documento trata sobre el
uso de dicha herramienta para la l?nea de ?rdenes.

En ``http://www.perforce.com/perforce/technical.html`` encontrar?
documentaci?n “online” detallada.

Se recomienda encarecidamente leer la “gu?a de usuario” y el “manual de
Perforce”. La aplicaci?n p4 dispone de una extensa ayuda “online” a la
que puede accederse mediante la orden ``p4 help``.

El servidor FreeBSD Perforce se encuentra en ``perforce.freebsd.org``,
puerto ``1666``. Puede navegar por el repositorio desde
``http://perforce.freebsd.org``. Ciertas partes del repositorio se
exportan autom?ticamente hacia diversos servidores CVSup.

.. raw:: html

   </div>

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

2. Los comienzos
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El primer paso para utilizar Perforce consiste en obtener una cuenta en
el servidor. Si ya dispone de una cuenta en ``FreeBSD.org`` entre en
``freefall`` y ejecute el siguiente comando utilizando una contrase?a
distinta del acceso de su FreeBSD o de cualquier otro mecanismo de
autenticaci?n SSH:

.. code:: screen

    % /usr/local/bin/p4newuser

Por supuesto si no tiene una cuenta en ``FreeBSD.org`` necesitar?
coordinarse con su mentor.

El siguiente paso consiste en establecer las variables de entorno que
necesita ``p4`` y en verificar que puede conectarse al servidor. Es
necesario especificar la variable ``P4PORT`` para realizar cualquier
operaci?n. Dicha variable indica el servidor Perforce con el que se va a
trabajar. En el caso del Proyecto FreeBSD, cr?ela con el siguiente
valor:

.. code:: screen

    % export P4PORT=perforce.freebsd.org:1666

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Los usuarios con acceso “shell” al “cluster” ``FreeBSD.org`` pueden
querer encapsular el protocolo cliente-servidor de Perforce a trav?s de
un t?nel SSH, en cuyo caso la variable de arriba deber?a establecerse al
valor ``localhost``.

.. raw:: html

   </div>

El servidor FreeBSD tambi?n necesita que se establezcan las variables
``P4PASSWD`` y ``P4USER``. Utilice el nombre de usuario y la contrase?a
anteriores del siguiente modo:

.. code:: screen

    % export P4USER=nombre_de_usuario
    % export P4PASSWD=contrase?a

Compruebe que todo funciona mediante la siguiente orden:

.. code:: screen

    % p4 info

A resultas de esta orden deber?a ver informaci?n referente al servidor.
Si no es as? compruebe que la variable ``P4PORT`` tiene el valor
correcto.

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

3. Clientes
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El sistema Perforce proporciona acceso al repositorio y mantiene el
estado del cliente de forma individualizada. En t?rminos de Perforce, un
cliente es una especificaci?n que asocia
`:sup:`[1]` <#ftn.idp61655760>`__ ficheros y directorios desde el
repositorio hasta la m?quina local. Cada usuario puede poseer varios
clientes, y cada cliente puede acceder a distintas partes del
repositorio (incluso a varias partes que se solapan entre s?). El
cliente tambi?n especifica el directorio ra?z del ?rbol de directorios
sobre el que se realiza la asociaci?n y la m?quina donde efectivamente
est? dicho ?rbol. Es por esto que si pretende trabajar en varias
m?quinas tendr? que usar varios clientes.

Puede acceder a los clientes mediante ``p4 client``. Si se ejecuta esta
orden sin argumentos aparece una plantilla del cliente dentro de un
editor, permitiendo de esta forma crear un nuevo cliente. Los campos
importantes de esta plantilla se explican a continuaci?n:

.. raw:: html

   <div class="variablelist">

``Client:``
    Este es el nombre de la especificaci?n del cliente. Puede ser
    cualquier cosa, pero debe ser una cadena ?nica dentro del servidor
    Perforce. Suelen usarse nombres como
    ``nombre_de_usuario_nombre_de_m?quina``, que permite identificar
    f?cilmente a los clientes cuando se navega por ellos. Por defecto
    hay ya un nombre, que se corresponde con el nombre de la m?quina.

``Description:``
    Este campo suele consistir en un breve texto descriptivo que ayude a
    identificar al cliente.

``Root:``
    Se trata del directorio local que actuar? como directorio ra?z para
    todos los ficheros dentro de la asociaci?n en el cliente. Debe ser
    una localizaci?n ?nica dentro del sistema de ficheros que no se
    solape con otros ficheros o clientes Perforce.

``Options:``
    La mayor?a de las opciones por defecto son correctas y v?lidas para
    todo el mundo, aunque suele ser recomendable comprobar que est?n
    activadas las opciones ``compress`` y ``rmdir`` y que no tienen el
    prefijo ``no``. Los detalles de cada una de estas opciones est?n en
    la documentaci?n de Perforce.

``LineEnd:``
    Este par?metro gestiona las conversiones CR-LF y debe dejarse tal
    cual salvo que sus necesidades espec?ficas requieran cambiarlo.

``View:``
    Aqu? es donde est?n las asociaciones de ficheros servidor-a-local.
    El valor por defecto es:

    .. code:: programlisting

        //depot/... //cliente/...

    Esto asociar? por completo el repositorio Perforce al directorio
    ``Root`` del cliente. *NO USE ESTE VALOR POR DEFECTO*. El
    repositorio de FreeBSD es enorme e intentar asociarlo y
    sincronizarse con dicho repositorio tardar? much?simo y consumir?
    enormes recursos. Asocie s?lamente la secci?n del repositorio en la
    que va a trabajar. Por ejemplo, hay un ?rbol para el proyecto smpng
    en ``//depot/projects/smpng``. Una asociaci?n en ese caso ser?a algo
    as?:

    .. code:: programlisting

        //depot/projects/smpng/... //cliente/...

    Los ``...`` deben tomarse literalmente tal cual est?n. Es un
    dialecto de Perforce para decir “este directorio y todos los
    ficheros y directorios por debajo de ?l.”.

    Una “vista” (View) puede contener m?ltiples asociaciones. Vamos a
    suponer que quiere asociar los ?rboles de SMPng y de NFS. Su “View”
    ser?a algo as?:

    .. code:: programlisting

        //depot/projects/smpng/... //cliente/smpng/...
              //depot/projects/nfs/... //cliente/nfs/...

    Recuerde que *``cliente``* es el nombre del cliente que se
    especific? en la secci?n ``Client``, pero en la secci?n ``View``
    adem?s se utiliza para resolver al directorio especificado en la
    secci?n ``Root``.

    Tambi?n tenga en cuenta que el mismo fichero o directorio no puede
    asociarse m?s de una vez dentro de una ?nica vista. La orden del
    siguiente ejemplo no es correcta y producir? resultados imprevistos:

    .. code:: programlisting

        //depot/projects/smpng/... //cliente/smpng-esto/...
              //depot/projects/smpng/... //cliente/smpng-lo_otro/...

    Las “vistas” son la parte compleja del proceso de aprendizaje de
    Perforce, as? que no tenga miedo de hacer tantas preguntas como
    estime oportunas.

.. raw:: html

   </div>

Puede listar los clientes existentes mediante ``p4 clients``. Puede
listarlos sin que sufran modificaciones mediante
``p4 client -o   nombre_cliente``.

Siempre que se interactue con ficheros en Perforce la variable de
entorno ``P4CLIENT`` debe contener al nombre del cliente que se est?
utilizando, es decir:

.. code:: screen

    % export P4CLIENT=nombredemicliente

F?jese en que las asociaciones del cliente en el repositorio no son
exclusivos; varios clientes pueden estar asociados en la misma zona del
respositorio. Esto permite el trabajo en equipo sobre el mismo c?digo,
permitiendo que distintas personas accedan y modifiquen la misma parte
del respositorio.

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

4. Sincronizaciones
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez definida la especificaci?n del cliente y una vez establecida la
variable de entorno ``P4CLIENT``, el siguiente paso consiste en
recuperar los ficheros para el cliente en cuesti?n desde el servidor
hasta la m?quina local. Esto se realiza con ``p4 sync``, el cual indica
a Perforce que sincronice los ficheros locales con los del repositorio.
La primera vez que se ejecuta descargar? todos los ficheros. Las
siguientes ejecuciones s?lo descargar?n aquellos ficheros que hayan
cambiado desde la ?ltima ejecuci?n de la orden. Gracias a esto es
posible sincronizar sus fuentes con las de otras personas con las que
est? trabajando.

Las operaciones de sincronizaci?n s?lo ata?en a aquellos ficheros cuyas
modificaciones han sido transmitidas a Perforce. Si se modifica o borra
un fichero en local sin informar de ello al servidor la ejecuci?n de un
“sync” no reflejar? dichos cambios. No obstante, la ejecuci?n de
``p4 sync -f`` sincrozar? incondicionalmente todos los ficheros, sin que
importe su estado. Esto resulta ?til para solucionar problemas cuando se
cree que el ?rbol pueda haber sufrido alg?n tipo de corrupci?n.

Puede sincronizarse parte del ?rbol o del cliente especificando una ruta
relativa a la orden “sync”. Por ejemplo, para sincronizar s?lo el
directorio ``ufs`` del proyecto ``smpng`` ejecute lo siguiente:

.. code:: screen

    % cd raizdelproyecto/smpng
    % p4 sync src/sys/ufs/...

El uso de rutas locales relativas funciona en muchas otras ?rdenes
``p4``.

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

5. Ramas
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una de las caracter?sticas m?s interesantes de Perforce es la
posibilidad de crear ramas. Las ramas son muy sencillas de crear y
tambi?n resulta muy f?cil mover cambios entre distintas ramas (como se
ver? m?s adelante). Las ramas tambi?n nos permiten realizar trabajos muy
experimentales dentro de un entorno de “sandbox”, sin necesidad de tener
que preocuparnos por las colisiones con otros usuarios o por
desestabilizar el ?rbol principal. Adem?s, las ramas proporcionan el
aislamiento necesario frente a los errores que se cometen cuando se
aprende a manejar el sistema Perforce. Vistas estas ventajas es l?gico
que cada proyecto disponga de su propia rama y en FreeBSD recomendamos
encarecidamente este esquema. Tambi?n se recomienda la aplicaci?n
frecuente de los cambios realizados.

El repositorio Perforce (conocido como el “dep?sito”, o “depot” en la
jerga de Perforce) es un ?nico ?rbol plano. Se accede a cada fichero a
trav?s de una sencilla ruta bajo el directorio ``//depot``, tanto si se
trata de un fichero de nueva creaci?n como si proviene de una
ramificaci?n. Esto supone una gran diferencia con respecto a sistemas
como CVS, donde cada rama se encuentra en la misma ruta que su rama
padre. En Perforce el servidor mantiene las relaciones entre los
ficheros padre e hijo, pero los ficheros en s? est?n bajo sus propias
rutas.

El primer para para crear una rama consiste en crear una especificaci?n
de rama. Es similar a la especificaci?n de un cliente, pero se crea
mediante la orden ``p4 branch     nombre_de_rama``.

Veamos los campos m?s importantes:

.. raw:: html

   <div class="variablelist">

``Branch``
    El nombre de la rama. Puede ser cualquier nombre, pero debe ser
    ?nico en el repositorio. La convenci?n que se usa en FreeBSD es
    *``nombre_de_usuario``*\ \_\ *``nombre_del_proyecto``*.

``Description``
    Puede poner aqu? un texto simple que describa la rama.

``View``
    Esto es la asociaci?n de la rama. En lugar de asociar desde el
    “dep?sito” hacia la m?quina local como una asociaci?n de cliente, se
    crea una asociaci?n entre la rama padre y la rama hija dentro del
    “dep?sito”. Por ejemplo, puede querer crear una rama del proyecto
    smpng. La asociaci?n resultar?a en algo parecido a esto:

    .. code:: programlisting

        //depot/projects/smpng/... //depot/projects/mi-super-smpng/...

    O puede crear una rama totalmente nueva a partir de las fuentes de
    FreeBSD:

    .. code:: programlisting

        //depot/vendor/freebsd/... //depot/projects/mi-nuevo-proyecto/...

    Esto asociar? el HEAD del ?rbol de FreeBSD a su nueva rama.

.. raw:: html

   </div>

La creaci?n de la especificaci?n de rama ?nicamente graba la
especificaci?n en s? misma dentro del servidor. No modifica el
“dep?sito” ni cambia ning?n fichero. El directorio que se declara en la
rama permanece vac?o en el servidor hasta que se comience a llenar.

Para rellenar la rama primero debemos editar el cliente con la orden
``p4 client`` y asegurarnos de que el directorio de rama est? asociado
en el cliente. Puede ser necesario a?adir una l?nea ``View`` como esta:

.. code:: programlisting

    //depot/projects/mi-nuevo-proyecto/... //micliente/mi-nuevo-proyecto/...

El siguiente paso consiste en ejecutar ``p4   integrate``, como se
describe en la siguiente secci?n.

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

6. Integraciones
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

“Integraci?n” es el t?rmino que se utiliza en Perforce para describir la
acci?n de mover cambios desde una parte del “dep?sito” a otra. Se suele
realizar junto con las ?rdenes creaci?n y mantenimiento de ramas. Una
integraci?n es necesaria cuando se quiere rellenar inicialmente una rama
y cuando se quieren mover cambios realizados en la rama padre hacia la
rama hija, o de la la rama hija a la padre. Un caso muy com?n es la
integraci?n peri?dica desde el ?rbol original de FreeBSD hacia la rama
hija propia del usuario. El servidor Perforce mantiene el estado de los
cambios en cada rama y sabe cu?ndo hay cambios que pueden integrarse de
una rama a otra.

La forma m?s com?n de hacer una integraci?n se muestra en la siguiente
orden:

.. code:: screen

    % p4 integrate -b nombrederama

*``nombrederama``* es el nombre que se ha dado a la especificaci?n de
rama, tal y como se explic? en la secci?n anterior. Esta orden indica a
Perforce que busque cambios en la rama padre que todav?a no se hayan
aplicado a la rama hija. En base a los cambios encontrados se prepara un
listado de diferencias a aplicar. Si la integraci?n se realiza por
primera vez sobre una rama (por ejemplo cuando se realiza una operaci?n
de rellenado inicial) los ficheros de la rama padre simplemente se
copiar?n en la ubicaci?n en la rama hija de la m?quina local.

Una vez que la operaci?n de integraci?n ha finalizado se debe ejecutar
``p4 resolve``, que aplicar? los cambios y resolver? posibles
conflictos. Los conflictos puede surgir debido a cambios que se solapan
al encontrarse tanto en fichero de la rama padre como en la copia del
fichero de la rama hija. Normalmente no suelen aparecer conflictos y
Perforce puede calcular r?pidamente c?mo unir los cambios. Para ejecutar
una operaci?n de resoluci?n (“resolve”) utilice las siguientes ?rdenes:

.. code:: screen

    % p4 resolve -as
    % p4 resolve

La primera invocaci?n indica a Perforce que una autom?ticamente los
cambios y que acepte aquellos ficheros que no den conflictos. La segunda
invocaci?n permite inspeccionar cada fichero con conflictos y resolver
de forma manual dichas incompatiblidades.

Una vez hecha la integraci?n de los ficheros llega el momento de aplicar
los cambios al repositorio. Para ello se emplearemos la orden
``p4 submit``, cuyo uso se explica en la siguiente secci?n.

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

7. Aplicaci?n de cambios en el repositorio
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los cambios que se han realizado en local se deben aplicar en el
contenido del servidor Perforce para mayor seguridad frente a p?rdidas y
para que otras personas puedan acceder a dichos cambios; esto se hace
con la orden ``p4 submit``. Cuando se ejecuta esta orden se abre una
plantilla (“submit template”) en el editor. FreeBSD dispone de una
platilla personalizada, de la que a continuaci?n se explican los campos
m?s importantes:

.. code:: programlisting

    Description:
            <enter description here>
            PR:
            Submitted by:
            Reviewed by:
            Approved by:
            Obtained from:
            MFP4 after:

es decir

.. code:: programlisting

    Descripci?n:
           <Introduzca una descripci?n>
           PR:
           Enviado por:
           Revisado por:
           Aprobado por:
           Obtenido de:
           MFP4 tras:

Se considera una buena pr?ctica proporcionar al menos dos o tres frases
que describan los cambios entregados. Deber?a declarar aqu? qu? hacen
dichos cambios, por qu? se han hecho de esa forma o qu? problemas
intenta resolver con ellos. Tambi?n conviene explicar qu? APIs cambian y
qu? otros efectos secundarios pueden tener. Este texto debe sustituir a
la l?nea ``<enter     description here>`` que aparece en la plantilla.
Debe recubrir las l?neas y comenzar cada l?nea con una tabulaci?n. Las
etiquetas de m?s abajo son espec?ficas de FreeBSD y puede eliminarlas si
no resultan ?tiles o apropiadas en su contexto.

.. code:: programlisting

    Files:

Este campo se rellena autom?ticamente con todos los ficheros que el
cliente etiquet? en el servidor con estados de adici?n, borrado,
integraci?n o edici?n. Le aconsejamos que revise esta lista y elimine de
ella los ficheros que todav?a no esten listos.

Una vez guardada la sesi?n de su editor tiene lugar la entrega de los
datos al servidor. Esto significa que las copias locales de los ficheros
entregados se enviar?n al servidor. Si algo va mal durante este proceso
se cancelar? la entrega y se avisar? al usuario de que la entrega se ha
convertido en una lista de cambios que deben corregirse y reenviarse.
Las entregas son at?micas, es decir, si un fichero falla la entrega se
cancela en su totalidad.

Los cambios efectuados en el servidor no pueden cancelarse una vez
hechos, pero s? que pueden cancelarse si, dentro a?n del editor, se sale
de ?l sin cambiar el texto del campo ``Description``. Perforce se
quejar? la primera vez que intente salir y le devolver? al editor. Si
sale por segunda vez el editor cancelar? la operaci?n. Devolver el
repositorio al estado anterior a un cambio ya efectuado es un proceso
muy complicado y no hay un procedimiento est?ndar, por lo que depende
del caso concreto.

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

8. Edici?n
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En el servidor se almacena y mantiene el estado de cada fichero del
cliente. Para evitar colisiones entre distintas personas trabajando al
mismo tiempo en el mismo fichero Perforce presta atenci?n a qu? ficheros
est?n abiertos en modo de edici?n, y utiliza esa informaci?n para poder
gestionar posteriormente las operaciones de entrega, las
sincronizaciones y las integraciones.

Para abrir un fichero para editarlo utilice ``p4   edit`` de la
siguiente forma:

.. code:: screen

    % p4 edit nombredefichero

Esto marca el fichero en el servidor con el estado de edici?n, lo que
permite entregar el fichero posteriormente una vez realizados los
cambios oportunos, o lo etiqueta como de tratamiento especial cuando se
est? efectuando una operaci?n de integraci?n o sincronizaci?n. Tenga en
cuenta que la edici?n no es exclusiva en Perforce. Varias personas
pueden tener el mismo fichero en estado de edici?n (ser? informado de
ello si es necesario cuando ejecute ``edit``), pero podr? entregar sus
cambios incluso cuando haya otras personas que tengan ese fichero en
estado de edici?n.

Cuando alguien entregue un cambio de un fichero que usted est? editando
necesitar? cotejar sus modificaciones con las de la otra u otras
personas para poder aplicar correctamente sus modifaciones al
repositorio. La forma m?s sencilla de hacerlo es ejecutar ``p4 sync`` o
``p4 submit`` y dejar que el programa encuentre alg?n conflicto, y a
continuaci?n ejecutar ``p4 resolve`` para “resolver” manualmente los
conflictos y aceptar los cambios de la otra persona en su copia del
fichero. Hecho esto, utilice ``p4     submit`` para aplicar sus cambios
en el repositorio.

Si posee un fichero abierto para su edici?n y quiere descartar los
cambios y devolverlo a su estado original ejecute ``p4 revert`` de la
siguiente forma:

.. code:: screen

    % p4 revert nombredefichero

Esto resincroniza el fichero con el contenido del servidor y elimina en
el servidor el atributo de edici?n para ese fichero. Se perder?
cualquier cambio que haya hecho en local. Esto resulta muy ?til cuando
se han efectuado una serie de cambios en un determinado fichero y se
decide posteriormente que no se desean aplicar dichos cambios en el
servidor.

Cuando se sincroniza un fichero se marca como s?lo lectura en el sistema
de ficheros. Aunque se pueden sobreescribir f?cilmente dichos permisos
se aplican para recordar al usuario de una forma educada que para ello
se debe utilizar ``p4 edit``. Los ficheros modificados en local pero que
no est?n en estado de edici?n pueden sobreescribirse al ejecutar
``p4 sync``.

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

9. Cambios, descripciones e historial
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede ver el historial de cambios realizados al “dep?sito” de Perforce
puede consultarse mediante ``p4 changes``. Esta orden proporciona una
breve descripci?n de cada cambio, qui?n la realiz? y c?al es el n?mero
de modificaci?n. Si lo que se quiere son los detalles de un cambio en
concreto utilice ``p4 describe     numero_de_cambio``. Esta orden
proporciona el “log” y los “diffs” de dicho cambio. Normalmente se
utilizan las opciones ``-du`` o ``-dc`` para generar “diffs” unificados
o contextuales, respectivamente, en lugar del formato del “diff” nativo.

``p4 filelog nombre_de_fichero`` muestra el historial de un fichero,
incluyendo todas sus modificaciones, integraciones y ramas que contenga.

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

10. “diffs”
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen dos formas de generar “diffs” de ficheros en Perforce, bien
entre cambios locales que todav?a no se han entregado o bien entre dos
?rboles (o dentro de una misma rama) del “dep?sito”. Estos “diffs” se
generan mediante ?rdenes distintas, ``diff`` y ``diff2``:

.. raw:: html

   <div class="variablelist">

``p4 diff``
    Ese comando genera un “diff” entre los cambios locales y los cambios
    de ficheros en estado de edici?n. Los par?metros ``-du`` y ``-dc``
    permiten crear “diffs” unificados o contextuales, respectivamente.
    Tambi?n se puede establecer la variable ``P4DIFF`` para que apunte a
    un “diff” local. Le recomendamos encarecidamente usar esta orden
    para revisar sus cambios antes de aplicarlos en el servidor.

``p4 diff2``
    Esta orden crea un “diffs” entre ficheros dados en el “dep?sito”, o
    entre ficheros especificados en una especificaci?n de rama. La
    operaci?n tiene lugar en el servidor, as? que la variable ``P4DIFF``
    no surte ning?n efecto, aunque las opciones ``-du`` y ``-dc`` s?
    pueden usarse. Las dos formas de esta orden son:

    .. code:: screen

        % p4 diff2 -b nombrederama

    y

    .. code:: screen

        % p4 diff2 //depot/ruta1 //depot/ruta2

.. raw:: html

   </div>

En todos los casos los “diffs” se muestran en la salida est?ndar. Por
desgracia Perforce usa un formato de “diffs” que resulta ser ligeramente
incompatible con las herramientas Unix est?ndar ``diff`` y ``patch``. La
utilizaci?n de la variable ``P4DIFF`` para que apunte al verdadero
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
puede paliar este problema, o al menos en ciertos casos, puesto s?lo
funciona con la orden ``p4 diff``. La salida de ``diff2`` debe
procesarse para que sea de alguna utilidad (la opci?n ``-u`` de
``diff2`` producir? “diffs” unificados que ser?n *m?s o menos
compatibles*, pero no esto no incluye ficheros nuevos o borrados. Este
“script” puede serle de utilidad para este “proceso necesario”:
``http://people.freebsd.org/~scottl/awkdiff``.

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

11. A?adir o eliminar ficheros
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La integraci?n de una rama har? que se a?adan ficheros existentes en el
servidor en su ?rbol, pero quiz?s sea necesario a?adir nuevos ficheros o
eliminar alguno de los ya existentes. Para a?adir ficheros no tiene m?s
que crear el fichero y ejecutar ``p4 add`` de la siguiente forma:

.. code:: screen

    % p4 add nombredefichero

Si quiere a?adir un ?rbol completo de ficheros ejecute:

.. code:: screen

    % find . -type f |xargs p4 add

Al ejecutar ``p4 submit`` se copiar?n los ficheros al “dep?sito” del
servidor. Es muy importante a?adir s?lo ficheros y no directorios. Si se
a?ade expl?citamente un directorio, Perforce lo tratar? como fichero, lo
cual seguramente no es lo que usted ten?a previsto.

Borrar un fichero es igualmente sencillo mediante ``p4 delete``:

.. code:: screen

    % p4 delete nombredefichero

Esta orden marcar? el fichero para que sea borrado del “dep?sito” la
siguiente vez que se ejecute una entrega. Tambi?n borrar? la copia local
del fichero, as? que sea cauteloso cuando la use.

Por supuesto que borrar un fichero no significa que se borre realmente
del repositorio.

Los ficheros borrados se pueden “resucitar” mediante la sincronizaci?n
con una versi?n previa. La ?nica forma de borrar de forma permanente un
fichero es mediante la orden ``p4 obliterat``. Dicha orden es
irreversible y costosa, as? que s?lo est? al alcance del personal que
administra el repositorio.

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

12. El trabajo con “diffs”
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunas veces puede ser necesario aplicar un “diff” al ?rbol de Perfoce
que provenga de otra aplicaci?n. Si se trata de un “diff” de gran tama?o
y que afecta a muchos ficheros, puede resultar tedioso ejecutar
manualmente ``p4 edit`` sobre cada fichero. Hay un truco para hacerlo de
una forma m?s sencilla. En primer lugar, aseg?rese de que no hay
ficheros abiertos en su cliente y de que su ?rbol est? sincronizado y
actualizado a la ?ltima versi?n. A continuaci?n aplique sus cambios
mediante las herramientas habituales, y forzando los permisos de los
ficheros en caso de ser necesario. Despu?s ejecute lo siguiente:

.. code:: screen

    % p4 diff -se ... |xargs p4 edit
    % p4 diff -sd ... |xargs p4 delete
    % find . -type f |xargs p4 add

La primera orden le dice a Perforce que busque los ficheros que han
cambiado, incluso si no est?n abiertos. La segunda orden le dice a
Perforce que busque los ficheros que no existen en la m?quina local pero
que s? est?n en el servidor. La tercera orden intenta a?adir todos los
ficheros que est?n en local. Es un m?todo de fuerza bruta, pero funciona
bien porque Perforce s?lo a?adir? los ficheros que le resulten
desconocidos. El resultado de estas ?rdenes es un conjunto de ficheros
abiertos para edici?n, borrado o para ser a?adidos, seg?n el caso. Hecho
esto solo nos queda ejecutar ``p4 submit`` para entregar los cambios.

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

13. Cambiar nombres de ficheros
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Perforce no dispone de una forma predefinida de cambiar nombres a
ficheros o de moverlos a otra parte del ?rbol. Si se copia el fichero en
cuesti?n a una nueva ubicaci?n mediante ``p4     add``, y posteriormente
``p4     delete`` en la versi?n anterior, se obtiene algo muy parecido a
lo que se quer?a, pero tiene el inconveniente de que no se preserva el
historial de cambios de ese fichero. Esto puede perjudicar futuras
integraciones entre padres e hijos. Hay otro m?todo m?s recomendable,
que consiste en efectuar una integraci?n dentro del mismo ?rbol y de una
sola vez. Veamos un ejemplo:

.. code:: screen

    % p4 integrate -i ficheroprevio ficheronuevo
    % p4 resolve
    % p4 delete ficheroprevio
    % p4 submit

La integraci?n fuerza a Perforce a mantener un registro de las
relaciones entre los nombres antiguos y los nuevos, lo cual ser? muy
?til en futuras integraciones. La opci?n ``-i`` indica que se trata de
una integraci?n “sin base”, es decir, que no existe un historial de
ramas al que recurrir en la integraci?n. Este par?metro tiene sentido en
el presente ejemplo, pero no deber?a utilizarse en integraciones basadas
en ramas.

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

14. Interacciones entre el CVS de FreeBSD y Perforce
----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los repositorios de Perforce y de CVS de FreeBSD est?n completamente
separados. No obstante, los cambios que se producen en CVS se reflejan
casi en tiempo real en Perforce. Cada 2 minutos se pregunta al servidor
de CVS sobre cambios realizados en la rama HEAD, y dichos cambios se
entregan a Perforce dentro del ?rbol ``//depot/vendor/freebsd/...``. De
este modo este ?rbol permite la ramificaci?n y la integraci?n de
proyectos derivados. Cualquier proyecto que implique la modificaci?n del
c?digo fuente de FreeBSD deber?a tener este ?rbol como su rama padre (o
rama “abuela”, dependiendo de las necesidades concretas de cada
proyecto), y deber?an tener lugar integraciones peri?dicas y
sincronizaciones para que el ?rbol est? en consonancia con el desarrollo
de FreeBSD y evitar conflictos en la medida de lo posible.

El puente entre CVS y Perforce es de un s?lo sentido; los cambios del
CVS se reflejar?n en Perforce, pero los cambios en Perforce no se
reflejar?n en el CVS. Si es necesario, se pueden exportar partes del
repositorio de Perforce al CVSup y que as? se puedan distribuir. Por
favor, contacte con los administradores de Perforce de FreeBSD si ese es
su caso.

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

15. Funcionamiento sin conexi?n de red
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Uno de los inconvenientes de Perforce es que supone que siempre es
posible acceder al servidor a trav?s de la red. La mayor?a de los
estados, el historial y los metadatos se almacenan en el servidor y no
existe mecanismo alguno para replicar el servidor como los hay en
CVS/CVSup. Es posible ejecutar un servidor proxy, pero solamente ayuda
un poco si se quiere trabajar sin conexi?n al servidor.

La mejor forma de trabajar sin conexi?n de red es comprobando que el
cliente no tiene ning?n fichero abierto y que est? totalmente
sincronizado antes de dejar de estar conectado. Cuando se edite un
fichero se deber?n cambiar manualmente los permisos a lectura-escritura.
Cuando vuelva a estar conectado ejecute la orden que se mostraba en la
`Secci?n?12, “El trabajo con “diffs”” <#working-with-diffs>`__ para
identificar autom?ticamente los ficheros que se han editado, a?adido o
eliminado. Es bastante com?n encontrarse con la sorpresa de que Perforce
ha sobreescrito un fichero modificado en local que no se abri? en modo
edici?n, as? que tenga especial cuidado con esto.

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

16. Consideraciones finales para el “Google Summer of Code”
-----------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La mayor?a de los proyectos de FreeBSD dentro del programa “Google
Summer of Code” est?n en
``//depot/projects/soc2005/nombre_del_proyecto/...`` en el servidor
FreeBSD de Perforce.

Entre las responsabilidades del mentor del proyecto est? seleccionar un
nombre adecuado para dicho proyecto y hacer que el estudiante sea capaz
de trabajar con Perforce.

El acceso al servidor FreeBSD de Perforce no implica pasar a ser miembro
de la comunidad de committers del CVS de FreeBSD, aunque animamos de
todo coraz?n a todos los estudiantes que consideren la posibilidad de
unirse al proyecto cuando est?n listos para ello.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp61655760" class="footnote">

`:sup:`[1]` <#idp61655760>`__ Este t?rmino, que tambi?n puede traducirse
como asociar o asignar, suele aparecer en la jerga de la administraci?n
de sistemas como “mapear”.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
