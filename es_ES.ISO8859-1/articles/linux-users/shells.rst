=========================
2. Shells: ?No est? Bash?
=========================

.. raw:: html

   <div class="navheader">

2. Shells: ?No est? Bash?
`Anterior <index.html>`__?
?
?\ `Siguiente <software.html>`__

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

2. Shells: ?No est? Bash?
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quienes vienen de Linux? se suelen sorprender de que Bash no sea la
shell por omisi?n, que en FreeBSD es
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__.
De hecho Bash ni siquiera forma parte de la instalaci?n m?nima de
FreeBSD. A pesar de esto tanto Bash como cualquiera de sus shell
favoritas est?n en la `Colecci?n de Packages y
Ports <article.html#SOFTWARE>`__ de FreeBSD.

Si instala otras shell puede usar
`chsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chsh&sektion=1>`__
como shell por omisi?n para sus usuarios, pero le recomendamos
encarecidamente que no cambie la shell por omisi?n del usuario ``root``.
La raz?n es que las shell que no forman parte de la instalaci?n base
generalmente se instalan en ``/usr/local/bin`` o en ``/usr/bin``. En
caso de problemas es posible que los sistemas de ficheros donde est?n
``/usr/local/bin`` y ``/usr/bin`` no puedan montarse. En un caso as?
``root`` no podr?a acceder a su shell por omisi?n, con lo que no podr?a
iniciar su sesi?n. Para evitar este tipo de problemas se cre? una
segunda cuenta de usuario ``root``, el usuario ``toor``. Consulte la
secci?n de seguridad de las FAQ si quiere saber m?s sobre `la cuenta
toor <../../../../doc/en_US.ISO8859-1/books/faq/security.html#TOOR-ACCOUNT>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------+------------------------------------------------------------+
| `Anterior <index.html>`__?                 | ?                         | ?\ `Siguiente <software.html>`__                           |
+--------------------------------------------+---------------------------+------------------------------------------------------------+
| Gu?a de FreeBSD para usuarios de Linux??   | `Inicio <index.html>`__   | ?3. Packages y Ports: Instalaci?n de software en FreeBSD   |
+--------------------------------------------+---------------------------+------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
