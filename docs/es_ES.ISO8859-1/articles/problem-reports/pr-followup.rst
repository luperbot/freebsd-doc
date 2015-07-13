============
5. Follow-up
============

.. raw:: html

   <div class="navheader">

5. Follow-up
`Anterior <pr-writing.html>`__?
?
?\ `Siguiente <pr-further.html>`__

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

5. Follow-up
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez enviado el informe de problemas, se recibe una confirmaci?n por
correo electr?nico en la que se incluye el n?mero asignado al informe y
la URL que puede utilizarse para consultar su estado. Con un poquito de
suerte, alguien mostrar? inter?s en el problema y tratar? de
solucionarlo, o de explicar por qu? raz?n no se considera un problema,
como ha ocurrido en muchas ocasiones. Recibiremos autom?ticamente una
notificaci?n relativa a cualquier cambio de estado, adem?s de recibir
copias de cualquier comentario o de los parches que se generen
relacionados con nuestro informe.

Si alguien solicita informaci?n adicional sobre el problema, o de
repente descubre o recuerda algo que no tuvo ocasi?n de mencionar en el
informe inicial, puede utilizar una de las siguientes opciones para
enviar una continuaci?n (“followup”) a dicho informe:

.. raw:: html

   <div class="itemizedlist">

-  La forma m?s sencilla consiste en utilizar el enlace followup que
   aparece en la p?gina web asociada a nuestro informe de problemas, la
   cual se puede alcanzar a partir de la p?gina de b?squedas de PRs en
   ``http://www.FreeBSD.org/cgi/query-pr-summary.cgi?query`` . Al
   pinchar en dicho enlace se mostrar? una pantalla con las l?neas de
   To: y Subject correctamente rellenadas (siempre y cuando el navegador
   soporte esta caracter?stica de autorelleno).

-  Alternativamente, se puede enviar un correo eletr?nico directamente a
   ``<bug-followup@FreeBSD.org>``, asegurando que el n?mero de
   seguimiento se incluye en el asunto para que el sistema de
   seguimiento de informes pueda adjuntar la respuesta al informe
   apropiado.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Si *no* se incluye el n?mero de seguimiento, GNATS no reconocer? el
   informe inicial y crear? un PR totalmente nuevo, que quedar? asignado
   al administrador de GNATS, de tal forma que el followup quedar? en el
   vac?o hasta que alguien resuelva el entuerto, lo cual puede tardar
   dias o semanas.

   Forma incorrecta:

   .. code:: programlisting

       Subject: ese PR que
               envi? en su d?a

   Forma correcta:

   .. code:: programlisting

       Subject: Re: ports/12345:
               problema de compilaci?n en foo/bar

   .. raw:: html

      </div>

.. raw:: html

   </div>

Si el informe de problemas permanece abierto una vez que dicho problema
ha desaparecido, simplemente env?e un followup (de la forma descrita
anteriormente) diciendo que el informe de problemas se puede cerrar y, a
ser posible, tambi?n conviene explicar la forma en que el problema se
resolvi?.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+--------------------------------------+
| `Anterior <pr-writing.html>`__?        | ?                         | ?\ `Siguiente <pr-further.html>`__   |
+----------------------------------------+---------------------------+--------------------------------------+
| 4. Escribir el informe de problemas?   | `Inicio <index.html>`__   | ?6. Lecturas recomendadas            |
+----------------------------------------+---------------------------+--------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
