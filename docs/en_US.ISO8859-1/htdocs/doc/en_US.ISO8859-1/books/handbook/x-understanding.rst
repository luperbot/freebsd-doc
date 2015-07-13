================
6.2.?Terminology
================

.. raw:: html

   <div class="navheader">

6.2.?Terminology
`Prev <x11.html>`__?
Chapter?6.?The X Window System
?\ `Next <x-install.html>`__

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

6.2.?Terminology
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While it is not necessary to understand all of the details of the
various components in the X Window System and how they interact, some
basic knowledge of these components can be useful:

.. raw:: html

   <div class="variablelist">

X server
    X was designed from the beginning to be network-centric, and adopts
    a “client-server” model. In this model, the “X server” runs on the
    computer that has the keyboard, monitor, and mouse attached. The
    server's responsibility includes tasks such as managing the display,
    handling input from the keyboard and mouse, and handling input or
    output from other devices such as a tablet or a video projector.
    This confuses some people, because the X terminology is exactly
    backward to what they expect. They expect the “X server” to be the
    big powerful machine down the hall, and the “X client” to be the
    machine on their desk.

X client
    Each X application, such as XTerm or Firefox, is a “client”. A
    client sends messages to the server such as “Please draw a window at
    these coordinates”, and the server sends back messages such as “The
    user just clicked on the OK button”.

    In a home or small office environment, the X server and the X
    clients commonly run on the same computer. It is also possible to
    run the X server on a less powerful computer and to run the X
    applications on a more powerful system. In this scenario, the
    communication between the X client and server takes place over the
    network.

window manager
    X does not dictate what windows should look like on screen, how to
    move them around with the mouse, which keystrokes should be used to
    move between windows, what the title bars on each window should look
    like, whether or not they have close buttons on them, and so on.
    Instead, X delegates this responsibility to a separate window
    manager application. There are `dozens of window
    managers <http://xwinman.org/>`__ available. Each window manager
    provides a different look and feel: some support virtual desktops,
    some allow customized keystrokes to manage the desktop, some have a
    “Start” button, and some are themeable, allowing a complete change
    of the desktop's look-and-feel. Window managers are available in the
    ``x11-wm`` category of the Ports Collection.

    Each window manager uses a different configuration mechanism. Some
    expect configuration file written by hand while others provide
    graphical tools for most configuration tasks.

desktop environment
    KDE and GNOME are considered to be desktop environments as they
    include an entire suite of applications for performing common
    desktop tasks. These may include office suites, web browsers, and
    games.

focus policy
    The window manager is responsible for the mouse focus policy. This
    policy provides some means for choosing which window is actively
    receiving keystrokes and it should also visibly indicate which
    window is currently active.

    One focus policy is called “click-to-focus”. In this model, a window
    becomes active upon receiving a mouse click. In the
    “focus-follows-mouse” policy, the window that is under the mouse
    pointer has focus and the focus is changed by pointing at another
    window. If the mouse is over the root window, then this window is
    focused. In the “sloppy-focus” model, if the mouse is moved over the
    root window, the most recently used window still has the focus. With
    sloppy-focus, focus is only changed when the cursor enters a new
    window, and not when exiting the current window. In the
    “click-to-focus” policy, the active window is selected by mouse
    click. The window may then be raised and appear in front of all
    other windows. All keystrokes will now be directed to this window,
    even if the cursor is moved to another window.

    Different window managers support different focus models. All of
    them support click-to-focus, and the majority of them also support
    other policies. Consult the documentation for the window manager to
    determine which focus models are available.

widgets
    Widget is a term for all of the items in the user interface that can
    be clicked or manipulated in some way. This includes buttons, check
    boxes, radio buttons, icons, and lists. A widget toolkit is a set of
    widgets used to create graphical applications. There are several
    popular widget toolkits, including Qt, used by KDE, and GTK+, used
    by GNOME. As a result, applications will have a different look and
    feel, depending upon which widget toolkit was used to create the
    application.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+--------------------------------+
| `Prev <x11.html>`__?              | `Up <x11.html>`__       | ?\ `Next <x-install.html>`__   |
+-----------------------------------+-------------------------+--------------------------------+
| Chapter?6.?The X Window System?   | `Home <index.html>`__   | ?6.3.?Installing Xorg          |
+-----------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
