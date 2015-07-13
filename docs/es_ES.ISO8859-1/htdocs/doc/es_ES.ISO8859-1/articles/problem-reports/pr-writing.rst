===================================
4. Escribir el informe de problemas
===================================

.. raw:: html

   <div class="navheader">

4. Escribir el informe de problemas
`Anterior <pr-prep.html>`__?
?
?\ `Siguiente <pr-followup.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4. Escribir el informe de problemas
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ahora que hemos determinado que el problema que estamos experimentando
se merece la redacci?n de un informe de problemas y que se trata de un
problema de FreeBSD, es la hora de comenzar a escribir dicho informe.
Antes de pasar a describir los mecanismos utilizados por el programa
encargado de generar los informes PR, vamos a describir una serie de
trucos y consejos que nos asegurar?n la mayor efectividad posible de
nuestro informe.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1. Consejos y trucos para escribir un buen informe de problemas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  *No deje la l?nea de “Synopsis” vac?a*. Los PRs se dirigen tanto a
   una lista de correo mundial (donde se utiliza el campo “Synopsis”
   para rellenar la l?nea ``Subject:`` del correo) como a una base de
   datos (GNATS). Cualquier persona que consulte la base de datos por el
   campo ``sinopsis`` y encuentre un PR con una l?nea de ``Asunto``
   vac?a tiende simplemente a pasar por alto el informe. Recuerde que un
   PR permanece en la base de datos hasta que alguien se encarga de
   cerrar el informe; un informe an?nimo normalmente se perder? para
   siempre entre el ruido y tardar? mucho en cerrarse.

-  *Evite utilizar una l?nea de “Synopsis” d?bil.*. No debe suponerse
   que quien lea el PR conoce el contexto adecuado en el que su mensaje
   tiene sentido, as? que cuanta m?s informaci?n se proporcione, mejor
   que mejor. Por ejemplo, ?qu? parte del sistema se ve afectado por el
   informe?, ?el problema aparece cuando se est? instalando o cuando se
   est? ejecutando?. Para ejemplificar, en lugar de
   ``Synopsis: portupgrade is         broken``, se pueden ver las
   ventajas que proporciona una l?nea como la siguiente:
   ``Synopsis: port sysutils/portupgrade produce un         coredump en -current``.
   (En el caso concreto de los ports, resulta especialmente ?til poseer
   tanto la categor?a como el nombre del port en la l?nea “Synopsis”.)

-  *Si se dispone de un parche, d?galo.* Un PR con un parche incluido
   tiene muchas m?s posibilidades de ser tratado que uno que no lo
   tiene. Si se include dicho parche, escriba la cadena ``[patch]`` al
   comienzo de la l?nea “Synopsis”. (Aunque no es obligatorio utilizar
   dicha cadena, se trata de un est?ndar de facto que se utiliza de
   forma mayoritaria.)

-  *Si es mantenedor del port, d?galo.* Si se est? manteniendo el c?digo
   fuente de una aplicaci?n (por ejemplo, de un port), se puede
   considerar la adici?n de la cadena ``[maintainer update]`` al
   comienzo de la l?nea de sinopsis, y adem?s se deber?a asignar el
   campo “Class” del PR a la cadena ``maintainer-update``. De esta forma
   cualquier committer que maneje el PR no tendr? que realizar
   comprobaciones.

-  *Sea concreto.* Cuanta m?s informaci?n se proporcione sobre el
   problema que se tiene, m?s posiblidades de obtener una respuesta.

   .. raw:: html

      <div class="itemizedlist">

   -  Incluya la versi?n del FreeBSD que se est? ejecutando (existe un
      lugar donde escribir esta esta informaci?n, vea m?s abajo) y en
      qu? arquitectura. Se debe incluir si se est? ejecutando desde una
      release (e.g. desde un CDROM o descarga), o si es desde un sistema
      mantenido mediante
      `cvsup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvsup&sektion=1>`__
      (y, si esto ?ltimo se cumple, con qu? frecuencia se realiza la
      actualizaci?n). Si se est? siguiendo la rama FreeBSD-CURRENT, se
      trata de la primera pregunta que nos har?n, debido a que los
      parches (sobre todo para problemas de alto nivel) tienden a
      aplicarse muy r?pidamente, y se espera de los usuarios de
      FreeBSD-CURRENT un seguimiento cercano de las actualizaciones
      aplicadas.

   -  Incluya qu? opciones globales se han especificado en el archivo
      ``make.conf``. Aviso: Es bien conocido por todos que especificar
      ``-O2`` y valores superiores para
      `gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
      produce fallos y resulta ser proclive a errores en muchas
      situaciones. Aunque los desarrolladores de FreeBSD normalmente dan
      por buenos y aceptan los parches proporcionados por el creador del
      informe de problemas, normalmente no desean investigar dichas
      condiciones extra?as debido simplemente a la falta de tiempo y de
      voluntarios, y puede que respondan diciendo simplemente que dicha
      opci?n de compilaci?n no se encuentra soportada.

   -  Si se trata de un problema del kernel, prep?rese para proporcionar
      la siguiente informaci?n. (No es necesario incluir esta
      informaci?n por defecto, puesto que lo ?nico que produce es un
      crecimiento desmesurado de la base de datos GNATS, pero s? puede
      merecer la pena incluir res?menes que usted considere
      importantes):

      .. raw:: html

         <div class="itemizedlist">

      -  La configuraci?n del kernel (incluyendo los dispositivos
         hardware que se tienen instalados)

      -  Si se tienen opciones de depuraci?n activadas (tales como
         ``WITNESS``), y en tal caso, si el problema persiste cuando se
         cambia el valor de dichas opciones

      -  Una traza de depuraci?n, si se pudo generar.

      -  El hecho de que se ha leido detenidamente el archivo
         ``src/UPDATING`` para constatar que el problema no se ha
         identificado all? (se garantiza que algui?n le preguntar? sobre
         este punto)

      -  Si se puede o no se puede ejecutar otro kernel sin problemas
         (se trata de identificar problemas relacionados con el hardware
         como discos con errores o CPUs sobrecalentadas, que pueden
         confundirse f?cilmente con problemas del kernel)

      .. raw:: html

         </div>

   -  Si se trata de un problema relacionado con los ports, prep?rese
      para poder proporcionar la informaci?n que se muestra a
      continuaci?n. (No es necesario incluir esta informaci?n por
      defecto, ya que s?lo produce un crecimiento indeseado de la base
      de datos, pero s? se pueden incluir res?menes de aquellos datos
      que usted considere relevantes):

      .. raw:: html

         <div class="itemizedlist">

      -  Los ports que se tiene instalados

      -  Cualesquiera variables de entorno que sobreescriban los valores
         por defecto del archivo ``bsd.port.mk``, tales como
         ``PORTSDIR``

      -  El hecho de que se ha leido ``ports/UPDATING`` y que nuestro
         problema no se encuentra identificado en dicho archivo (se
         garantiza que alguien puede preguntar este hecho).

      .. raw:: html

         </div>

   .. raw:: html

      </div>

-  *Evitar peticiones de caracter?sticas vagas.* Los PRs del estilo de
   “alguien deber?a implementar algo que haga esto y aquello y lo de m?s
   all?” son informes con pocas probabilidades de obtener resultados
   positivos. Las caracter?sticas deben ser muy concretas y espec?ficas.
   Recuerde que el c?digo fuente se encuentra disponible para todo el
   mundo, de tal forma que si usted necesita una caracter?stica, la
   mejor forma de verla incluida en futuras versiones de la herramienta
   consiste en ponerse usted mismo a trabajar sobre ella, manos a la
   obra. Tambi?n tenga en cuenta que para discutir este tipo de
   problemas resulta m?s adecuado utilizar la lista
   ``freebsd-questions``, como ya se ha comentado anteriormente.

-  *Aseg?rese que nadie m?s ha enviado un PR similar.* Aunque esto ya se
   ha mencionado anteriormente, merece la pena que se repita en este
   punto. S?lamente lleva uno o dos minutos realizar una b?squeda basada
   en un motor web en
   ``http://www.FreeBSD.org/cgi/query-pr-summary.cgi?query``. (Por
   supuesto, a todo el mundo se le puede olvidar realizar esto de vez en
   cuando, pero por esa misma raz?n merece la pena hacer incapi? en
   ello)

-  *Evite peticiones controvertidas.* Si nuestro PR se dirige hacia un
   ?rea o tema controvertido en el pasado, debemos prepararnos no s?lo a
   ofrecer parches, si no tambi?n a justificar por qu? motivo los
   parches proporcionados son la “Forma Correcta de Hacerlo”. Como se
   avis? anteriormente, una b?squeda meticulosa en las listas de correo
   en los archivos hist?ricos sitos en
   ``http://www.FreeBSD.org/search/search.html#mailinglists`` resulta
   siempre una buena idea y sirve para preparar nuestro razonamiento y
   aprender de la experiencia y de las decisiones tomadas en el pasado.

-  *Sea educado.* Casi cualquier persona que se encarge de tratar
   nuestro informe de problemas trabajar? en el como un voluntario. A
   nadie le gusta que le digan c?mo hacer las cosas cuando ya se est?n
   haciendo de una forma determinada, especialmente cuando la motivaci?n
   para realizarlas no es monetaria. Este hecho es bueno tenerlo en
   mente y aplicarlo para cualquier proyecto de Software Libre.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2. Antes de comenzar.
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de ejecutar el programa
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__,
aseg?rese de que la variable de entorno ``VISUAL`` (o ``EDITOR`` si la
variable ``VISUAL`` no se encuentra definida) se encuentra apuntando a
algo con sentido.

Es importante comprobar que la entrega de correo funciona correctamente.
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
utiliza mensajes de correo para enviar y realizar un seguimiento de los
informes de problemas. Si no se puede generar correo electr?nico desde
la m?quina en la que se ejecuta
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__,
el informe jam?s llegar? a la base de datos GNATS. Si quiere saber m?s
sobre la configuraci?n del correo en FreeBSD consulte el cap?tulo de
“Correo Electr?nico” del manual de FreeBSD en
``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mail.html``.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3. Adjuntar parches o archivos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El programa
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
posee la capacidad de adjuntar archivos al informe de problemas. Se
pueden adjuntar tantos archivos como se quiera siempre y cuando se
utilice un nombre distinto para cada archivo (e.g. el nombre del archivo
despu?s de eliminar el path). Simplemente basta con utilizar la opci?n
``-a`` de l?nea de comandos para especificar los nombres de todos los
archivos que se desean adjuntar:

.. code:: screen

    % send-pr -a /var/run/dmesg -a /tmp/errors

No se preocupe por los archivos binarios, dichos archivos se codifican
autom?ticamente para no interferir con el agente de correo.

Si se adjunta un parche, aseg?rese que se utiliza la opci?n ``-c`` o la
opci?n ``-u`` de
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
para crear un contexto unificado (el contexto suele ser el preferido por
quienes lo han de recibir) y adem?s aseg?rese de especificar los n?meros
de revisi?n de CVS de los archivos que se modifican para que los
desarrolladores que lean el informe puedan aplicar dichos parches
f?cilmente. Para problemas relacionados con el kernel o con las
utilidades del sistema base, se prefiere un parche contra
FreeBSD-CURRENT (la rama HEAD del ?rbol CVS) ya que cualquier c?digo
nuevo debe probar se primeramente en dicha rama. Despu?s de comprobar su
correcto funcionamiento de una forma sustancial y extensa, eventualmente
dicho c?digo pasar? a formar parte de FreeBSD-STABLE, mediante uni?n o
migraci?n.

Si se env?a un parte en l?nea, en vez de como adjunto, tenga en cuenta
que el principal problema de esta forma de enviar los parches es que,
dependiendo del lector de correo utilizado, algunos lectores muestran
los tabuladores como espacios, lo cual arruina completamente el formato
y la indentaci?n del parche, e invalida totalmente un parche que forme
parte de un Makefile.

Tambi?n tenga en cuenta que mientras que la inclusi?n de parches en un
PR se considera como algo positivo—particularmente cuando se soluciona
el problema que describe el informe—partes grandes y especialmente
c?digo nuevo que puede requerir una sustancial revisi?n antes de ser
aplicado deber?a hacerse accesible a trav?s de otros medios, como
p?ginas web o servidores de ftp, y en vez de incluir el parche en el
informe se puede incluir la URL. Los parches de gran tama?o en los
correos electr?nicos tienden a mezclarse o partirse, especialmente
cuando GNATS los trata, y cuanto m?s grande es el parche m?s dif?cil
resulta recuperar el original. Tambi?n existe una ventaja a?adida a la
inclusi?n del parche a trav?s de una URL, ya que de este modo se puede
modificar el parche sin tener que reenviar el informe como una respuesta
al informe inicial.

Se debe prestar atenci?n tambi?n al hecho de que, a menos que se
especifique expl?citamente lo contrario en el PR o en el propio parche,
cualquier parche enviado se supone licenciado bajo los mismos t?rminos y
condiciones que el archivo original que modifica.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.4. Rellenar la plantilla
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando se ejecuta
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
se nos presenta en pantalla una plantilla. Esta plantilla consiste en
una lista de campos, algunos de los cuales se encuentran ya rellenados,
mientras que otros poseen comentarios donde se explica su prop?sito o se
comentan los valores aceptables. No se preocupe por los comentarios,
puesto que se borran autom?ticamente antes de generar el informe.

Al comienzo de la plantilla, justo debajo de las l?neas de ``SEND-PR:``,
se encuentran las cabeceras de correo electr?nico. Dichas cabeceras
normalmente no se tienen que modificar, a menos que se est? rellenando
el informe desde una m?quina que puede enviar correo pero no puede
recibirlo directamente, en cuyo caso usted tendr? que editar los campos
``From:`` y ``Reply-To:`` para escribir la direcci?n de correo v?lida.
Tambi?n puede enviarse una copia a usted mismo o a cualquier otra
persona rellenando el campo ``Cc:``.

A continuaci?n aparecen una serie de campos de una sola l?nea:

.. raw:: html

   <div class="itemizedlist">

-  *Submitter-Id:* No cambie este campo. El valor por defecto
   ``current-users`` es correcto, incluso si se est? ejecutando
   FreeBSD-STABLE.

-  *Originator:* Se rellena autom?ticamente con el campo ``gecos`` del
   usuario que est? actualmente dentro del sistema. Por favor,
   especifique su nombre real, opcionalmente acompa?ado por su direcci?n
   de correo electr?nico entre < >.

-  *Organization:* Escriba lo que usted quiera. Este campo no se utiliza
   para nada significativo.

-  *Confidential:* Esto se rellena autom?ticamente con el literal
   ``no``. Cambiar este valor carece de sentido ya que no existe ning?n
   informe de problemas de FreeBSD confidencial—la base de datos de PR
   se distribuye a todo el mundo de forma p?blica mediante CVSup.

-  *Synopsis:* Rellene este campo con una descripci?n corta y precisa
   del problema. La sinopsis se utiliza como subject del correo
   electr?nico del informe de problemas, y tambi?n se utiliza en los
   listados y res?menes de informes de la base de datos; informes de
   problemas con obscuras sinopsis tienden a ser completamente
   ignorados.

   Como se avis? anteriormente, si su informe de problemas incluye un
   parche, por favor incluya en la sinopsis la etiqueta ``[patch]`` al
   comienzo; si usted es un mantenedor de software, tambi?n puede a?adir
   la cadena ``[maintainer         update]`` y asignar el campo “Class”
   del informe al valor ``maintainer-update``.

-  *Severity:* Los valores aceptados son ``non-critical``, ``serious`` o
   ``critical``. No sea exagerado; evite etiquetar el problema como
   ``critital`` a menos que sea realmente algo cr?tico (e.g. escalada de
   permisos hacia ``root``, kernel panic f?cilmente reproducible).
   Incluso debe pensarse detenidamente etiquetar algo como ``serious`` a
   menos que se trate de algo que afecte a muchos usuarios (problemas
   con drivers de dispositivos particulares o con utilidades del
   sistema). Los desarrolladores de FreeBSD no van a resolver el
   problema m?s r?pido por el hecho de variar esta etiqueta, debido a
   que existe mucha gente que infla este campo inadecuadamente. De
   hecho, los desarrolladores prestan muy poca atenci?n al valor de este
   campo y del siguiente precisamente por esto ?ltimo.

-  *Priority:* Los valores aceptados son ``low``, ``medium`` o ``high``.
   ``high`` debe reservarse para problemas que afecten a la mayor?a de
   los usuarios de FreeBSD y ``medium`` para aquellos problemas que
   afecten a varios usuarios.

-  *Category:* Seleccione uno de los siguientes valores (extra?dos de
   ``/usr/gnats/gnats-adm/categories``):

   .. raw:: html

      <div class="itemizedlist">

   -  ``advocacy:`` para problemas relacionados con la imagen p?blica de
      FreeBSD. Raras veces utilizado.

   -  ``alpha:`` para problemas espec?ficos de la plataforma Alpha.

   -  ``amd64:`` para problemas espec?ficos de la plataforma AMD64.

   -  ``bin:`` para problemas con aplicaciones de la zona de usuario del
      sistema base.

   -  ``conf:`` para problemas de archivos de configuraci?n, valores por
      defecto, etc.

   -  ``docs:`` para problemas con las p?ginas de manual o la
      documentaci?n online.

   -  ``gnu:`` para problemas realacionados con aplicaciones gnu de
      FreeBSD tales como
      `gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
      o
      `grep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=grep&sektion=1>`__.

   -  ``i386:`` para problemas espec?ficos de la plataforma i386™.

   -  ``ia64:`` para problemas espec?ficos de la plataforma ia64.

   -  ``java:`` para problemas relacionados con Java™.

   -  ``kern:`` para problemas relacionados con el kernel o con (no
      especif?cos de ninguna plataforma) controladores de dispositivos.

   -  ``misc:`` para cualquier cosa que no encaja en ninguna de las
      anteriores categor?as. (Tenga en cuenta que es muy f?cil que los
      problemas bajo esta categor?a se pierdan en el olvido).

   -  ``ports:`` para problemas relacionados con el ?rbol de ports.

   -  ``powerpc:`` para problemas espec?ficos de la plataforma PowerPC?.

   -  ``sparc64:`` para problemas espec?ficos de la plataforma Sparc64?.

   -  ``standards:`` para problemas relativos a la adecuaci?n con
      est?ndares.

   -  ``threads:`` para problemas relacionados con la implementaci?n de
      threads de FreeBSD (especialmente en FreeBSD-CURRENT).

   -  ``www:`` para cambios o mejoras del sitio web de FreeBSD.

   .. raw:: html

      </div>

-  *Class:* Se puede seleccionar uno entre los siguientes:

   .. raw:: html

      <div class="itemizedlist">

   -  ``sw-bug:`` bugs de software.

   -  ``doc-bug:`` errores en la documentaci?n.

   -  ``change-request:`` peticiones de caracter?sticas adicionales o de
      cambios en las caracter?sticas existentes.

   -  ``update:`` actualizaciones de ports o de software contribuido por
      terceros.

   -  ``maintainer-update:`` actualizaciones de ports de los cuales
      usted es mantenedor.

   .. raw:: html

      </div>

-  *Release:* La versi?n de FreeBSD que se est? ejecutando. El programa
   `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
   rellena autom?ticamente este campo, por lo que s?lamente resulta
   necesaria su modificaci?n cuando estemos rellenando un informe de
   problemas desde un sistema distinto al sistema donde se ha producido
   dicho problema.

.. raw:: html

   </div>

Por ?ltimo, existen una serie de campos multil?nea:

.. raw:: html

   <div class="itemizedlist">

-  *Environment:* Este campo debe describir, tan preciso como sea
   posible, el entorno en el cual se ha observado el problema. Esto
   incluye la versi?n del sistema operativo, la versi?n del programa que
   contiene el problema y cualquier otro asunto relevante tales como la
   configuraci?n del sistema o cualquier otro software instalado que
   pueda influir en la ejecuci?n del primero, etc. Resumiendo todo lo
   anterior, se debe especificar todo lo que un desarrollador necesita
   conocer para poder reconstruir el entorno en el cual se ha producido
   el problema.

-  *Description:* Una descripci?n completa y precisa del problema que se
   est? sufriendo. Intente evitar especular sobre las posibles causas
   del problema a menos que se tenga la seguridad de que el camino
   descrito es el correcto, puesto que puede inducir al desarrollador a
   realizar falsas presunciones.

-  *How-To-Repeat:* Un resumen de las acciones que deben llevarse a cabo
   para reproducir el problema.

-  *Fix:* Preferentemente un parche, o al menos una soluci?n temporal
   (la cual no s?lo ayuda a otras personas que experimenten el mismo
   problema, sino que puede ayudar tambi?n al desarrollador para que
   investigue sobre las verdaderas causas del problema). No obstante, si
   no se dispone de ninguna de estas opciones, lo mas sabio es dejar
   vac?o este campo y sobre todo no hacer especulaciones.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.5. Env?o del informe de problemas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que hemos terminado de rellenar la plantilla, hemos salvado y
hemos salido del editor,
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
nos dar? a conocer las siguientes opciones:
``s)end, e)dit     or a)bort?``. Es en estos momentos cuando podemos
teclear **``s``** para continuar y enviar el informe de problemas,
**``e``** para relanzar el editor y realizar m?s modificaciones a la
plantilla o **``a``** para abortar el programa. Si se selecciona esta
?ltima alternativa, el informe de problemas no ser? destruido, sino que
permanecer? en disco
(`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
nos indicar? el nombre del fichero antes de finalizar), de tal forma que
se puede editar de forma individual (sin
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__)
en cualquier momento, o tambi?n se puede transferir a otro sistema con
mejor conectividad para finalmente enviarlo utilizando la opci?n ``f``
de l?nea de comandos de
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__:

.. code:: screen

    % send-pr -f ~/my-problem-report

Esto leer? el archivo especificado, validando sus contenidos, y
eliminar? los comentarios para finalmente enviarlo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+---------------------------------------+
| `Anterior <pr-prep.html>`__?   | ?                         | ?\ `Siguiente <pr-followup.html>`__   |
+--------------------------------+---------------------------+---------------------------------------+
| 3. Preparativos?               | `Inicio <index.html>`__   | ?5. Follow-up                         |
+--------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
