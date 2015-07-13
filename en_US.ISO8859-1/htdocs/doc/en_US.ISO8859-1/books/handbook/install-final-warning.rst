===================================
3.9.?Committing to the Installation
===================================

.. raw:: html

   <div class="navheader">

3.9.?Committing to the Installation
`Prev <install-media.html>`__?
Chapter?3.?Installing FreeBSD?8.\ *``X``*
?\ `Next <install-post.html>`__

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

3.9.?Committing to the Installation
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The installation can now proceed if desired. This is also the last
chance for aborting the installation to prevent changes to the hard
drive.

.. code:: screen

                           User Confirmation Requested
     Last Chance! Are you SURE you want to continue the installation?

     If you're running this on a disk with data you wish to save then WE
     STRONGLY ENCOURAGE YOU TO MAKE PROPER BACKUPS before proceeding!

     We can take no responsibility for lost disk contents!

                                 [ Yes ]    No

Select [?Yes?] and press **Enter** to proceed.

The installation time will vary according to the distribution chosen,
installation media, and the speed of the computer. There will be a
series of messages displayed, indicating the status.

The installation is complete when the following message is displayed:

.. code:: screen

                                   Message

    Congratulations! You now have FreeBSD installed on your system.

    We will now move on to the final configuration questions.
    For any option you do not wish to configure, simply select No.

    If you wish to re-enter this utility after the system is up, you may
    do so by typing: /usr/sbin/sysinstall.

                                     [ OK ]

                          [  Press enter or space  ]

Press **Enter** to proceed with post-installation configurations.

Selecting [?No?] and pressing **Enter** will abort the installation so
no changes will be made to the system. The following message will
appear:

.. code:: screen

                                    Message
    Installation complete with some errors.  You may wish to scroll
    through the debugging messages on VTY1 with the scroll-lock feature.
    You can also choose "No" at the next prompt and go back into the
    installation menus to retry whichever operations have failed.

                                     [ OK ]

This message is generated because nothing was installed. Pressing
**Enter** will return to the Main Installation Menu to exit the
installation.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-----------------------------------+
| `Prev <install-media.html>`__?          | `Up <install.html>`__   | ?\ `Next <install-post.html>`__   |
+-----------------------------------------+-------------------------+-----------------------------------+
| 3.8.?Choosing the Installation Media?   | `Home <index.html>`__   | ?3.10.?Post-installation          |
+-----------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
