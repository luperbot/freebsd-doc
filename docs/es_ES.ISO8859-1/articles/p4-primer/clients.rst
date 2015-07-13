===========
3. Clientes
===========

.. raw:: html

   <div class="navheader">

3. Clientes
`Anterior <start.html>`__?
?
?\ `Siguiente <syncing.html>`__

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
`:sup:`[1]` <#ftn.idp63539664>`__ ficheros y directorios desde el
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

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp63539664" class="footnote">

`:sup:`[1]` <#idp63539664>`__ Este t?rmino, que tambi?n puede traducirse
como asociar o asignar, suele aparecer en la jerga de la administraci?n
de sistemas como “mapear”.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+-----------------------------------+
| `Anterior <start.html>`__?   | ?                         | ?\ `Siguiente <syncing.html>`__   |
+------------------------------+---------------------------+-----------------------------------+
| 2. Los comienzos?            | `Inicio <index.html>`__   | ?4. Sincronizaciones              |
+------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
