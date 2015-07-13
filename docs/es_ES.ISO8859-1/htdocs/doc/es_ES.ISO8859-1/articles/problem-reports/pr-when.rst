======================================
2. Cu?ndo enviar informes de problemas
======================================

.. raw:: html

   <div class="navheader">

2. Cu?ndo enviar informes de problemas
`Anterior <index.html>`__?
?
?\ `Siguiente <pr-prep.html>`__

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

2. Cu?ndo enviar informes de problemas
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen varios tipos de problemas y no todos ellos se merecen la
creaci?n de un informe de problemas. Por supuesto, nadie es perfecto, y
existir?n ocasiones en las que estaremos convencidos de haber encontrado
un “bug” en un programa cuando realmente hemos malinterpretado la
sintaxis o el funcionamiento de dicho programa, o simplemente hemos
cometido un error tipogr?fico en un fichero de configuraci?n (aunque en
este ?ltimo caso podr?a tratarse de un indicador de documentaci?n escasa
o que la aplicaci?n peca de una gesti?n de errores defectuosa. Incluso
teniendo estos aspectos en cuenta existen varios casos en los cuales el
env?o de un informe de problemas resulta claramente *no ser* la mejor
forma de proceder, ya que dicho env?o puede servir para frustrar tanto a
quien env?a el informe como a quien desarroll? la aplicaci?n. Por el
contrario, tambi?n existen casos en los que puede resultar apropiado
enviar un informe de problemas sobre algo m?s aparte de “bugs”: una
mejora o una solucitud nuevas caracter?sticas, por citar un par de
ejemplos.

As? que ?c?mo podemos determinar qu? constituye un “bug” y qu? no? Como
regla para principiantes podemos decir que su problema *no* es un “bug”
si se puede expresar como una pregunta (normalmente del estilo de “?c?mo
hago X?” o “?donde puedo encontrar Y?”). No siempre las cosas son
blancas o negras, pero la regla de las preguntas suele cubrir una gran
mayor?a de casos. Si lo que se quiere es una respuesta a una consulta,
se pueden enviar dichas preguntas a la `lista de correo para preguntas
generales sobre
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.

A continuaci?n se muestran algunos casos en los que resulta apropiado
enviar un informe de problemas sobre algo que no se considera un “bug”:

.. raw:: html

   <div class="itemizedlist">

-  Solucitudes para mejora de caracter?sticas. Normalmente es una buena
   idea airear estas propuestas en las listas de distribuci?n antes de
   enviar un informe de problemas.

-  Notificaci?n de actualizaciones de software que se mantiene
   externamente (principalmente ports, pero tambi?n componentes del
   sistema base al cargo de proyectos independientes de FreeBSD, como
   BIND o diversas utilidades GNU)

.. raw:: html

   </div>

Otro tema es que si el sistema donde se experiment? el “bug” no est?
medianamente actualizado se debe considerar muy seriamente su
actualizaci?n e intentar reproducir el problema en un sistema
actualizado antes de emitir el informe. Existen pocas cosas que molesten
m?s a un desarrollador que recibir un informe de problemas sobre un
problema que ya ha resuelto.

Por ?ltimo, un “bug” que no se puede reproducir dif?cilmente puede
arreglarse. Si el “bug” s?lo ocurri? una vez y no somos capaces de
reproducirlo, y parece que no le ocurre a nadie m?s, es muy probable que
ni siquiera los desarrolladores puedan reproducirlo y por lo tanto ni
siquiera puedan imaginarse qu? es lo que falla. Esto no significa que el
“bug” no haya ocurrido, sino que las probabilidades de que nuestro
informe de errores sirva para corregir un defecto son muy peque?as. Para
complicar m?s las cosas, a menudo estas clases de errores se producen
debido a fallos en los discos duros o al sobrecalentamiento del
procesador: debe intentar siempre descubrir estos fallos, siempre que
sea posible, antes de enviar un PR.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+---------------------------+-----------------------------------+
| `Anterior <index.html>`__?                      | ?                         | ?\ `Siguiente <pr-prep.html>`__   |
+-------------------------------------------------+---------------------------+-----------------------------------+
| C?mo enviar informes de problemas de FreeBSD?   | `Inicio <index.html>`__   | ?3. Preparativos                  |
+-------------------------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
