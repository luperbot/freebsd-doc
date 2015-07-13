======================
Introducci?n al FDP-es
======================

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

J. Vicente Carrasco Vay?
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<carvay@FreeBSD.org>``

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

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resumen

.. raw:: html

   </div>

Este documento ha sido escrito para que sirva de gu?a somera a quienes
quieren colaborar con FreeBSD traduciendo documentaci?n o alguna secci?n
de la web de FreeBSD al castellano. FreeBSD es un proyecto que crece
diariamente gracias al trabajo voluntario de miles de personas de todo
el mundo. La traducci?n de documentaci?n y de la web supone una enorme
ayuda para quienes se acercan a FreeBSD y no saben ingl?s (o alguna de
las lenguas a las que ya es? traducido todo o parte de dicho material).
Casi cualquier persona puede ayudar en alguna tarea. Si quiere colaborar
reciba nuestra m?s calurosa bienvenida y siga leyendo.

Este documento no pretende ser exhaustivo. Casi toda la informaci?n
necesaria para trabajar en el FDP est? en el libro
`fdp-primer <http://www.es.freebsd.org/doc/en_US.ISO8859-1/books/fdp-primer/>`__
(que esperamos poder tener traducido alg?n dia) y en cuya secci?n de
estilo est? basada gran parte de este texto. Si quiere ampliar los
conocimientos que aqu? se esbozan (y si va a trabajar con la
documentaci?n de FreeBSD seguramente querr? hacerlo) le rogamos que lo
lea cuidadosamente. Recuerde que cualquier duda que pudiera salirle al
paso mientras trabaja en la documentaci?n de FreeBSD puede enviarla a la
`lista de correo sobre la documentaci?n de FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__

Si tiene alguna sugerencia, cr?tica o duda relacionada con este art?culo
no dude en escribir al autor.

.. raw:: html

   </div>

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

`1. El FDP-es <#idp61470928>`__
`2. Tareas pendientes <#idp61480656>`__
`3. C?mo formar parte del FPD-es <#idp61501648>`__
`4. Gu?a de estilo <#idp61571280>`__
`5. Gu?a de sintaxis <#sintaxis>`__
`6. Trato al lector o lectora <#idp61704400>`__
`7. L?xico <#idp61707472>`__
`8. Ayuda <#idp61723728>`__
`9. Env?o de traducciones <#idp61736784>`__
`10. Voluntarios del FDP-es <#voluntarios-fdp-es>`__
`11. Agradecimientos <#idp61788112>`__

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

1. El FDP-es
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El FreeBSD Spanish Documentation Project (en adelante FDP-es) tiene las
siguientes funciones:

.. raw:: html

   <div class="itemizedlist">

-  Mantener al d?a la documentaci?n existente en castellano e ir
   traduciendo m?s siempre que los recursos lo permitan.

-  Traducir y mantener la web
   `http://www.freebsd.org/es/ <http://www.es.freebsd.org/es/>`__.

-  Desarrollar documentos propios como ?ste.

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

2. Tareas pendientes
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Glosario: Confecci?n y Mantenimiento de un Glosario de t?rminos
frecuentes en la Documentaci?n para ayuda y referencia del traductor.

P?ginas man: El Proyecto de Documentaci?n de FreeBSD tambi?n se encarga
de desarrollar, mantener y corregir las p?ginas ``man`` del sistema pero
debido a la escasez de voluntarios es una tarea que (siendo muy
optimistas) preferimos pensar que podremos acometer a medio o largo
plazo.

“Scripts” ``accent2xml`` y ``xml2accent``. Existen dos “scripts” que
traducen los caracteres que no existen en ingl?s a c?digo sgml; por
ejemplo ```` a “``?``”, ? a “``?``”, etc?tera. Ser?a muy ?til disponer
de sus hom?logos xml para facilitar el trabajo de aquellas personas que
traducen secciones de la web y (cosa poco sorprendente) no conozcan de
memoria todos los secretos de xml.

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

3. C?mo formar parte del FPD-es
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Casi cualquier persona puede formar parte del FDP-es. Igual que sucede
en el FDP no hay cuota mensual que haya que pagar ni una cantidad
mensual o anual de material que haya que traducir de forma obligatoria.
Basta con suscribirse a la `lista de correo sobre la documentaci?n de
FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__.
Puede aportar sus conocimientos de ingl?s para ayudar con las dudas de
quienes est?n traduciendo o quiz?s pueda dedicar un poco de su tiempo a
traducir.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1. Asignaci?n de trabajos
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Al depender del esfuerzo voluntario es l?gico que cada cual pueda elegir
qu? parte de la web o de la documentaci?n desea traducir. Dentro de poco
esperamos disponer de una p?gina web p?blica en la que poder consultar
qu? textos est?n asignados y desde cuando. De momento el procedimiento
es el siguiente:

.. raw:: html

   <div class="itemizedlist">

-  la persona interesada en traducir elige un texto que desea traducir y
   dos alternativas por si su primera elecci?n ya est? asignada

-  el coordinador de traducciones le asigna el texto

-  el texto traducido es revisado e inclu?do en el repositorio del
   FDP-es primero y en el del FDP despu?s.

.. raw:: html

   </div>

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

3.2. Si puede dedicar un poco de tiempo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede traducir una secci?n de la web, un cap?tulo del handbook o un
art?culo y entregarlo en formato ASCII (texto plano). Tenga en cuenta
que alguien tendr? que darle formato (DocBook o xml en el caso de la
web). Ser? de grand?sima ayuda si entrega su trabajo con los acentos,
e?es y dem?s signos caracter?sticos de nuestro idioma corregidos al
formato adecuado. Consulte la tabla que encontrar? en
http://www.theorem.ca/~mvcorks/code/charsets/latin1.html o utilice el
“script” perl ``     accent2sgml.pl`` ubicado en
``     doc/share/examples/vim/``. La parte m?s dif?cil del trabajo es
sin duda alguna la traducci?n pero si pudiera avanzar trabajo adaptando
en lo posible la sintaxis del texto a sgml o xml (o maquet?ndolo usted,
pru?belo: no es dif?cil) aligerar? notablemente la carga de trabajo de
unos cuantos (y mortales) voluntarios y voluntarias. Tenga en cuenta que
no sobra precisamente el personal para estas tareas y enfrentarse a
convertir un texto ASCII de 5.000 l?neas a DocBook puede hacer flaquear
al voluntario m?s comprometido.

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

3.3. Con un poco m?s de tiempo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La forma ideal de entrega de trabajos al FDP-es es enviarlos listos para
incluir en el ?rbol cvs de FreeBSD. Si tiene un especial inter?s en un
texto en concreto puede encargarse de su mantenimiento (es lo que
llamamos “apadrinar” ese texto). En poco tiempo se convertir? en su
mejor conocedor y no le resultar? dif?cil ir a?adiendo los cambios a
medida que se vayan produciendo en el original. De este modo al menos
una fracci?n de la documentaci?n tendr? m?s posibilidades de estar *al
dia*;-)

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

3.4. Colaboraci?n espor?dica
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En la `lista de correo sobre la documentaci?n de FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__ hay
personas que colaboran resolviendo dudas que surgen a los traductores.
Si por el motivo que fuera no quiere o no puede traducir textos no
deber?a subestimar la importancia de la ayuda que puede prestarse de
este modo. Gracias a estas personas los traductores encuentran m?s
argumentos a favor o en contra de traducir ciertos t?rminos, con lo que
la documentaci?n resulta m?s ?til; y nuestro trabajo consiste en hacer
algo ?til.

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

3.5. ?Todo el mundo puede traducir?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En principio s?, pero no necesariamente. Le recomendamos que si quiere
traducir documentaci?n se familiarice con otros textos ya traducidos y
comience por colaborar con las dudas de los traductores en la `lista de
correo sobre la documentaci?n de FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__.

La documentaci?n de FreeBSD goza de una merecida fama de calidad, lo que
hace que el trabajo de un proyecto de traducci?n como el nuestro
implique una gran responsabilidad. Es imposible mantener una fidelidad
absoluta al original, pero dentro de lo posible lo intentamos. Al
tratarse de textos t?cnicos hay que tener muy presente al traducirlos
que sin duda alguna van a ser utilizados como gu?a. Se suele *exigir* a
los reci?n llegados a FreeBSD que lean la documentaci?n relacionada con
sus dudas *antes* de preguntar dudas, as? que, al menos en teor?a, lo
que usted traduzca tendr? ?vidos lectores. Tenga esto muy presente al
traducir: mejor preguntar una duda de m?s en la `lista de correo sobre
la documentaci?n de FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__ que
incluir informaci?n err?nea en un texto.

Se estar? preguntando ?cu?l es el perfil necesario para traducir? La
verdad es que no hay un acuerdo sobre esto. Es obvio que necesita
comprender el ingl?s t?cnico (americano) en el que est? escrita la
documentaci?n de FreeBSD, `:sup:`[1]` <#ftn.idp61550800>`__ y por
supuesto s?lidos conocimientos de castellano. Dicho de otro modo, no es
imprescindible *hablar* ingl?s, basta con comprenderlo lo mejor posible,
pero es imprescindible la expresi?n escrita en castellano. La calidad de
una traducci?n es algo totalmente subjetivo, pero suele haber acuerdo
entre los miembros de la lista entre lo que es asumible
`:sup:`[2]` <#ftn.idp61554896>`__ y lo que no lo es. El trabajo de
arreglar una mala traducci?n puede ser igual de largo que traducir desde
cero un texto y es varios ?rdenes de magnitud m?s penoso. Encontrar un
buen traductor de textos t?cnicos es tanto o m?s dif?cil que encontrar
un buen programador, como sabe cualquiera que haya abierto m?s de una
docena de libros t?cnicos traducidos a nuestro idioma
`:sup:`[3]` <#ftn.idp61565392>`__ Cuando env?e un texto traducido para
su revisi?n es posible que, aunque ponga mucho cuidado para evitarlo,
aparezcan errores en el c?digo SGML o en el propio texto. El trabajo de
revisi?n consiste precisamente en eso as? que no se preocupe, dentro de
la ayuda espor?dica que algunas personas ofrecen al FDP-es est? la de
revisar textos de otros. Un voluntario depurar? el texto en caso de que
haga falta y lo dejar? listo para subir al cvs
`:sup:`[4]` <#ftn.idp61568208>`__.

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

4. Gu?a de estilo
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n est?n basada en la secci?n “writing style” del libro
“fdp-primer” que puede consultarse en
(``http://www.es.FreeBSD.org/doc/en_US.ISO8859-1/books/fdp-primer/writing-style.html``).

Es necesario intentar mantener la consistencia entre la multitud de
autores que trabajan en la Documentaci?n de FreeBSD, raz?n por la cual
se han creado unas l?neas generales. A esta b?squeda de la consistencia
se opone tambi?n la variedad de or?genes de los traductores de la
Documentaci?n, por lo que se listan aqu? unas cuantas normas que pueden
ser de ayuda. Dado que la Documentaci?n que va a traducir ya ha pasado
por m?s de una mano experta puede usarla como plantilla para su
traducci?n.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Idioma

.. raw:: html

   </div>

-  El idioma oficial del FDP-es es el castellano (o espa?ol de Espa?a),
   es\_ES; la decisi?n de tener lengua oficial no es una idea exclusiva
   nuestra puesto que en el el Proyecto de Documentaci?n de FreeBSD el
   idioma oficial es el ingl?s de los Estados Unidos de Am?rica
   (en\_US). Se intenta evitar el uso de palabras “agresivas” con otros
   castellanoparlantes como ``ordenador`` (computador, computadora,
   sistema, m?quina o incluso host) pero al iniciar los trabajos
   necesitaban una norma y l?gicamente usaron la que la que m?s cerca
   ten?an.

-  Evite frases redundantes

   Intente evitar usar frases redundantes. Por ejemplo “el comando”, “el
   fichero” y “man comando” probablemente son redundantes.

   He aqu? dos ejemplos en el caso de los comandos. El segundo ejemplo
   mostrado es el recomendable.

-  

   .. raw:: html

      <div class="informalexample">

   Utilice el comando ``cvsup`` para actualizar sus fuentes

   .. raw:: html

      </div>

-  

   .. raw:: html

      <div class="informalexample">

   Utilice ``cvsup`` para actualizar sus fuentes

   .. raw:: html

      </div>

.. raw:: html

   </div>

Veamos dos ejemplos para nombres de ficheros. Recomendamos el uso del
segundo ejemplo.

.. raw:: html

   <div class="informalexample">

… en el fichero llamado ``/etc/rc.local``\ …

.. raw:: html

   </div>

.. raw:: html

   <div class="informalexample">

… en ``/etc/rc.local``\ …

.. raw:: html

   </div>

Veamos un ejemplo sobre p?ginas man. Recomendamos el uso del segundo
caso, que usa ``citerefentry``.

.. raw:: html

   <div class="informalexample">

Para m?s informaci?n consulte ``man csh``.

.. raw:: html

   </div>

.. raw:: html

   <div class="informalexample">

Consulte
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

Dos espacios al final de cada frase
    Deje siempre dos espacios al final de cada frase. El texto ser? m?s
    legible y se facilita el uso de herramientas como Emacs.

    Puede pensarse que una may?scula tras un punto indica nueva frase
    pero no siempre es as?, sobre todo si se trata del nombre de algunas
    personas. “Jordan K. Hubbard” es un buen ejemplo de ello. Tiene una
    ``H`` may?scula tras un punto y un espacio y es evidente que no es
    una nueva frase.

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

5. Gu?a de sintaxis
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por favor, siga ?stas sencillas reglas para facilitar el trabajo de toda
la gente que mantiene el c?digo fuente de la documentaci?n.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. Min?sculas
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las etiquetas van siempre en min?sculas: ``<para>``, *no* ``<PARA>``.

El texto SGML normalmente se escribe en may?sculas: ``<!ENTITY…>`` y
``<!DOCTYPE…>``, *no* ``<!entity…>`` o ``<!doctype…>``.

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

5.2. Sangrado
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada fichero comienza con un sangrado nulo, es decir, en la columna 0,
*sin tener en cuenta* el nivel de sangrado del fichero que pueda
contenerlo.

La apertura de etiquetas incrementa el nivel de sangrado en 2 espacios.
Reemplace los bloques de 8 espacios al inicio de una l?nea con una
tabulaci?n. No use espacios antes de una tabulaci?n y no a?ada espacios
al final de una l?nea. El contenido que est? entre elementos debe
sangrarse en dos espacios si el contenido ocupa m?s de una l?nea.

Por ejemplo, el c?digo fuente de esta secci?n es algo parecido a esto:

.. code:: programlisting

    +--- ?sta es la columna 0
    V

      <sect1>
        <title>...</title>

        <sect2>
          <title>Sangrado</title>

          <para>Cada fichero comienza con un sangrado nulo, es decir,
        en la columna 0, <emphasis>sin tener en cuenta</emphasis>
        el nivel de sangrado del fichero que pueda contenerlo.</para>

          ...
        </sect2>
      </sect1>
    </chapter>

Si usa Emacs o XEmacs para editar ficheros que forman parte de la
Documentaci?n se cargar? autom?ticamente el ``sgml-mode`` y las
variables locales que Emacs encontrar? al principio de cada fichero
podr?n utilizarse.

Si usa Vim puede serle muy ?til incluir lo siguiente en la configuraci?n
de su editor:

.. code:: programlisting

    augroup sgmledit
      autocmd FileType sgml set formatoptions=cq2l " Opciones especiales de formato
      autocmd FileType sgml set textwidth=70       " Corta las l?neas a 70 espacios
      autocmd FileType sgml set shiftwidth=2       " Sangra autom?ticamente
      autocmd FileType sgml set softtabstop=2      " Tabulaci?n = 2 espacios
      autocmd FileType sgml set tabstop=8          " Reemplaza 8 espacios con Tab
      autocmd FileType sgml set autoindent         " Sangrado autom?tico
    augroup END

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

5.3. Etiquetas
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.3.1. Espacios en las etiquetas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las etiquetas que comienzan en el mismo nivel de sangrado que la
etiqueta anterior deben separarse con una l?nea en blanco, y las que no
est?n al mismo nivel de sangrado que la anterior *no*:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    <article lang='es'>
      <articleinfo>
        <title>NIS</title>

        <pubdate>Octubre 1999</pubdate>

        <abstract>
          <para>...
        ...
        ...</para>
        </abstract>
      </articleinfo>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>
    </article>

.. raw:: html

   </div>

.. raw:: html

   </div>

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

6. Trato al lector o lectora
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando hay que dirigirse al lector o lectora siempre usamos el usted,
habitual en muchos pa?ses en cualquier ?mbito y respetuoso en cualquiera
de los dem?s. Como puede verse en el t?tulo existe tambi?n el problema
del g?nero de quien lee el texto; casi siempre hay una manera de evitar
usarlo (buscando bien) pero puede alternarse el uso del g?nero. Evitamos
el uso de la forma lector/a, programador/a, etc?tera, que a costa de una
pretendida correcci?n pol?tica convierte a los textos en algo bastante
m?s dif?cil de leer.

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

7. L?xico
---------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es muy importante intentar evitar argot, giros, dichos o bromas
exclusivos de un s?lo pa?s, regi?n, ciudad o grupo social. La
Documentaci?n ser? le?da por gentes muy diversas en cualquier lugar del
mundo y puede ser muy frustrante que lo que uno quiere hacer est?
documentado pero no lo podamos entender “por no haber viajado
suficiente”.

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

8. Ayuda
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

8.1. Lista doc@es.FreeBSD.org
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La `lista de correo sobre la documentaci?n de FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__ es el
lugar ideal para enviar:

dudas de traducci?n

ideas, sugerencias, cr?ticas sobre la documentaci?n (en castellano o
relacionadas con la Documentaci?n en ingl?s)

errores en la generaci?n de documentaci?n

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

8.2. Diccionarios en Internet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen muchos diccionarios en Internet y en bastantes de ellos podemos
consultar t?rminos *gratuitamente*. Las palabras m?s t?cnicas y muchas
exclusivas de FreeBSD no aparecer?n en ninguno de estos diccionarios y
en pocos de los editados en papel, por lo que tendr? que recurrir a
otros documentos ya traducidos o a la `lista de correo sobre la
documentaci?n de FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__.

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

9. Env?o de traducciones
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Por correo electr?nico al coordinador, o bien

#. si lo considera conveniente, enviarlo a la `lista de correo sobre la
   documentaci?n de FreeBSD en
   castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__
   para su revisi?n.

#. `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__

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

10. Voluntarios del FDP-es
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Estos son los colaboradores habituales del FDP-es. Si cree que su nombre
debe (o no debe) aparecer en esta lista puede escribir al autor.

(en orden alfab?tico por apellido):

.. raw:: html

   <div class="itemizedlist">

-  Jos? Ram?n Baz ``<jr_baz@hartu.net>``

-  Jos? Vicente Carrasco Vay? ``<carvay@es.FreeBSD.org>``

-  Luis L?pez ``<cronopiolopez@terra.es>``

-  Jesus R. Camou ``<jcamou@FreeBSD.org>``

-  Jesus Rodriguez

-  Juan F. Rodriguez ``<jrh@it.uc3m.es>``

-  Enrique Mat?as S?nchez ``<cronopios@gmail.com>``

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

11. Agradecimientos
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A la `lista de correo sobre la documentaci?n de FreeBSD en
castellano <https://listas.es.FreeBSD.org/mailman/listinfo/doc>`__ por
su *infinita* paciencia durante las revisiones de este documento (y
desde mucho antes) y a Jesus Rodriguez por lo mismo y adem?s por
animarme. Que tiene delito.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp61550800" class="footnote">

`:sup:`[1]` <#idp61550800>`__\ Tambi?n puede traducir desde alguno de
los idiomas en los que hay documentaci?n de FreeBSD. Puede echar un
vistazo a los textos traducidos a distintas lenguas en
http://www.es.FreeBSD.org/doc/.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp61554896" class="footnote">

`:sup:`[2]` <#idp61554896>`__ es decir, lo que podemos subir al cvs para
que cualquiera pueda verlo repartido por los sitios web de FreeBSD del
mundo entero

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp61565392" class="footnote">

`:sup:`[3]` <#idp61565392>`__\ Si es su caso, ya sabe a ciencia cierta
que tener una o m?s carreras, t?cnicas o no, no evita que alguien sea
capaz de perpetrar “traducciones” abominables y adem?s cobrar por ello.
Nosotros no pagamos, pero somos mucho m?s estrictos.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp61568208" class="footnote">

`:sup:`[4]` <#idp61568208>`__\ es posible que el revisor le devuelva el
texto si las modificaciones que hay que hacer son muchas y usted mismo
puede hacerlas)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
