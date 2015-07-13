=============================
13.6. Modificaci?n de cuentas
=============================

.. raw:: html

   <div class="navheader">

13.6. Modificaci?n de cuentas
`Anterior <users-user.html>`__?
Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
?\ `Siguiente <users-limiting.html>`__

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

13.6. Modificaci?n de cuentas
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existe una variedad de comandos disponible en el entorno Unix para
modificar cuentas de usuario. Los comandos m?s comunes se hallan
resumidos a continuaci?n, seguidos de ejemplos m?s detallados de su uso.

.. raw:: html

   <div class="informaltable">

+---------------+--------------------------------------------------------------------------------------------------+
| Comando       | Resumen                                                                                          |
+===============+==================================================================================================+
| ``adduser``   | La aplicaci?n de l?nea de comandos recomendada para a?adir nuevos usuarios.                      |
+---------------+--------------------------------------------------------------------------------------------------+
| ``rmuser``    | La aplicaci?n de l?nea de comandos recomendada para eliminar usuarios.                           |
+---------------+--------------------------------------------------------------------------------------------------+
| ``chpass``    | Una herramienta flexible para modificar la base de datos de usuarios.                            |
+---------------+--------------------------------------------------------------------------------------------------+
| ``passwd``    | Una herramienta de l?nea de comandos simple para cambiar contrase?as de usuario.                 |
+---------------+--------------------------------------------------------------------------------------------------+
| ``pw``        | Una herramienta potente y flexible para modificar cualquier aspecto de las cuentas de usuario.   |
+---------------+--------------------------------------------------------------------------------------------------+

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

13.6.1. adduser
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``adduser`` es un programa simple para a?adir usuarios. Crea entradas en
los archivos de sistema ``passwd`` y ``group``. Tambi?n crea un
directorio home para el nuevo usuario, copia all? ficheros de
configuraci?n por defecto (“dotfiles”) de ``/usr/share/skel``, y
opcionalmente puede enviar al usuario un mensaje de bienvenida.

Para crear el fichero inicial de configuraci?n usa
``adduser -s -config_create``. `:sup:`[7]` <#ftn.idp74731472>`__ A
continuaci?n configuramos valores por defecto para adduser y creamos
nuestra primera cuenta de usuario, dado que utilizar ``root`` para uso
normal del sistema es pernicioso y peligroso.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.1. Configuraci?n de adduser

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # adduser -v
    Use option ``-silent'' if you don't want to see all warnings and questions.
    Check /etc/shells
    Check /etc/master.passwd
    Check /etc/group
    Enter your default shell: csh date no sh tcsh zsh [sh]: zsh
    Your default shell is: zsh -> /usr/local/bin/zsh
    Enter your default HOME partition: [/home]:
    Copy dotfiles from: /usr/share/skel no [/usr/share/skel]:
    Send message from file: /etc/adduser.message no
    [/etc/adduser.message]: no
    Do not send message
    Use passwords (y/n) [y]: y

    Write your changes to /etc/adduser.conf? (y/n) [n]: y

    Ok, let's go.
    Don't worry about mistakes. I will give you the chance later to correct any input.
    Enter username [a-z0-9_-]: jru
    Enter full name []: J. Random User
    Enter shell csh date no sh tcsh zsh [zsh]:
    Enter home directory (full path) [/home/jru]:
    Uid [1001]:
    Enter login class: default []:
    Login group jru [jru]:
    Login group is ``jru''. Invite jru into other groups: guest no
    [no]: wheel
    Enter password []:
    Enter password again []:

    Name:     jru
    Password: ****
    Fullname: J. Random User
    Uid:      1001
    Gid:      1001 (jru)
    Class:
    Groups:   jru wheel
    HOME:     /home/jru
    Shell:    /usr/local/bin/zsh
    OK? (y/n) [y]: y
    Added user ``jru''
    Copy files from /usr/share/skel to /home/jru
    Add another user? (y/n) [y]: n
    Goodbye!
    #

.. raw:: html

   </div>

.. raw:: html

   </div>

En resumen, cambiamos la shell por defecto a zsh (una shell alternativa
incluida en la colecci?n de ports), y deshabilitamos el env?o de un
mensaje de bienvenida a nuevos usuarios. Luego grabamos la
configuraci?n, creamos una cuenta para ``jru``, y nos aseguramos de que
``jru`` est? en el grupo ``wheel`` (de modo que puede asumir el papel de
``root`` v?a el comando ``su``).

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La contrase?a que escribes no se muestra, tampoco se muestran
asteriscos. Aseg?rate de no entrar dos veces una contrase?a equivocada.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Usa ``adduser`` sin argumentos en adelante, no necesitar?s cambiar las
opciones por defecto. Si el programa te pide modificarlas sal y prueba
con la opci?n ``-s``.

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

13.6.2. rmuser
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puedes usar ``rmuser`` para eliminar completamente del sistema a un
usuario. ``rmuser`` efect?a los siguientes pasos:

.. raw:: html

   <div class="procedure">

#. Elimina la entrada del usuario en
   `crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1>`__
   (si tiene alguna).

#. Elimina las tareas
   `at(1) <http://www.FreeBSD.org/cgi/man.cgi?query=at&sektion=1>`__
   pertenecientes al usuario.

#. Mata todos los procesos pertenecientes al usuario.

#. Elimina al usuario del fichero local de contrase?as del sistema.

#. Borra el directorio home del usuario (si le pertenece).

#. Elimina los archivos de correo entrante del usuario de ``/var/mail``.

#. Borra todos los ficheros del usuario de ?reas en las que se guardan
   archivos temporales como ``/tmp``.

#. Finalmente, elimina el nombre de usuario de todos aquellos grupos a
   los que pertenece en ``/etc/group``.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Si un grupo queda vac?o y el nombre del grupo coincide con el del
   usuario, el grupo es eliminado; esto complementa la creaci?n de
   grupos por usuario de
   `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__.

   .. raw:: html

      </div>

.. raw:: html

   </div>

``rmuser`` no puede ser usado para eliminar cuentas de superusuario,
dado que algo as? es casi siempre se?al de masiva destrucci?n.

Por defecto existe un modo interactivo que intenta asegurar que uno sabe
lo que hace.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.2. Eliminaci?n interactiva de cuenta con rmuser

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # rmuser jru
    Matching password entry:
    jru:*:1001:1001::0:0:J. Random User:/home/jru:/usr/local/bin/tcsh
    Is this the entry you wish to remove? y
    Remove user's home directory (/home/jru)? y
    Updating password file, updating databases, done.
    Updating group file: trusted (removing group jru -- personal group is empty) done.
    Removing user's incoming mail file /var/mail/jru: done.
    Removing files belonging to jru from /tmp: done.
    Removing files belonging to jru from /var/tmp: done.
    Removing files belonging to jru from /var/tmp/vi.recover: done.
    #

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

13.6.3. chpass
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``chpass`` cambia informaci?n de los usuarios en base de datos como
contrase?as, shells y datos personales.

Los administradores del sistema, como el superusuario, son los ?nicos
que pueden modificar la informaci?n y contrase?as de otros usuarios con
``chpass``.

Cuando no le pasamos m?s opciones, salvo un nombre de usuario opcional,
``chpass`` muestra un editor con informaci?n de usuario. Cuando se sale
del editor la base de datos de usuarios se actualiza con la nueva
informaci?n.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.3. chpass interactivo ejecutado por el superusuario

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    #Changing user database information for jru.
    Login: jru
    Password: *
    Uid [#]: 1000
    Gid [# or name]: 1000
    Change [month day year]:

    Expire [month day year]:
    Class:
    Home directory: /home/jru
    Shell: /usr/local/bin/tcsh
    Full Name: J. Random User
    Office Location:
    Office Phone:
    Home Phone:
    Other information:

.. raw:: html

   </div>

.. raw:: html

   </div>

Un usuario normal puede modificar un peque?o subconjunto de esta
informaci?n, y s?lo para s? mismo.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.4. chpass interactivo ejecutado por un usuario normal

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    #Changing user database information for jru.
    Shell: /usr/local/bin/tcsh
    Full Name: J. Random User
    Office Location:
    Office Phone:
    Home Phone:
    Other information:

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

``chfn`` y ``chsh`` son enlaces a ``chpass``, como tambi?n lo son
``ypchpass``, ``ypchfn``, e ``ypchsh``. El soporte para NIS es
autom?tico, por lo que no es necesario especificar el ``yp`` antes del
comando. Si esto te resulta algo confuso no te preocupes, NIS ser?
tratado en el `Cap?tulo?29, *Networking
avanzado* <advanced-networking.html>`__.

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

13.6.4. passwd
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``passwd`` es el comando que se usa normalmente para cambiar tu propia
contrase?a como usuario o, como superusuario, la de otros usuarios.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Los usuarios han de introducir su contrase?a original antes de cambiarla
para prevenir que gente no autorizada pueda hacerlo cuando no se
encuentren en la consola.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.5. Cambio de tu contrase?a

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % passwd
    Changing local password for jru.
    Old password:
    New password:
    Retype new password:
    passwd: updating the database...
    passwd: done

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.6. Cambio de la contrase?a de otro usuario como superusuario

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # passwd jru
    Changing local password for jru.
    New password:
    Retype new password:
    passwd: updating the database...
    passwd: done

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Como ocurre con ``chpass``, ``yppasswd`` es un enlace a ``passwd``, de
manera que NIS funciona con ambos comandos.

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

13.6.5. pw
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ es una
utilidad de l?nea de comandos para crear, eliminar, modificar, y mostrar
usuarios y grupos. Hace de interfaz a los archivos del sistema de
usuarios y grupos. ``pw`` tiene un conjunto de opciones de l?nea de
comandos bastante potente que lo hacen adecuado para su uso en scripts
de shell, aunque los nuevos usuarios puede que lo encuentren algo m?s
complicado que el resto de comandos que presentamos aqu?.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp74731472" class="footnote">

`:sup:`[7]` <#idp74731472>`__\ La ``-s`` hace que ``adduser`` sea
silencioso por defecto. M?s tarde usamos ``-v`` cuando queremos cambiar
valores por defecto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------+------------------------------------------+
| `Anterior <users-user.html>`__?   | `Subir <users.html>`__    | ?\ `Siguiente <users-limiting.html>`__   |
+-----------------------------------+---------------------------+------------------------------------------+
| 13.5. Cuentas de usuario?         | `Inicio <index.html>`__   | ?13.7. Limitar a los usuarios            |
+-----------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
