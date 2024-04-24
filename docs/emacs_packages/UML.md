# UML Package
uml-mode.el can be used to make ascii uml sequence diagrams like this:

## How to use UML

   person1                    person2     kitchen
      |                          |           |
      |   make me a sandwich     |           |
      |------------------------->|           |
      |                          |           |
      |         no way           |           |
      |< - - - - - - - - - - - - |           |
      |                          |           |
      | sudo make me a sandwich  |           |
      |------------------------->|           |
      |                          |           |
      |                          |    go     |
      |                          |---------->|
      |                          |           |
      |                          |           | --.
      |                          |           |<--' make it
      |                          |           |
      |                          |< - - - - -|
      |                          |           |
      |        sandwich          |           |
      |< - - - - - - - - - - - - |           |
      |                          |           |

## features

   - only supports sequence diagrams
   - provides key bindings for more easily moving around sequence
     diagrams, and aligning and redrawing them
   - diagrams can be embedded in source code comments

## installation

## melpa

   1. run @@html:<kbd>@@M-x@@html:</kbd>@@ ~package-install~ @@html:<kbd>@@RET@@html:</kbd>@@ ~uml-mode~

## manual install

   1. download [[https://raw.github.com/ianxm/emacs-uml/master/uml-mode.el][uml-mode.el]]
   2. run @@html:<kbd>@@M-x@@html:</kbd>@@ ~package-install-file~ @@html:<kbd>@@RET@@html:</kbd>@@
   3. choose ~uml-mode.el~

## tutorial

### timelines

if you move the point over a line with some names and hit
@@html:<kbd>@@C-c C-c@@html:</kbd>@@ to redraw it, the list of
names will be spread out and centered over timelines.

put the following content in a buffer, enabled uml-mode
(@@html:<kbd>@@M-x@@html:</kbd>@@ ~uml-mode~), and hit
@@html:<kbd>@@C-c C-c@@html:</kbd>@@ while the point is on the
line.

timeline1 timeline2 timeline3

the above line will be replaced with:

  timeline1   timeline2   timeline3
      |           |           |

you can modify the diagram at any point and run redraw again and
uml-mode will clean it up.

### arrow to neighbor

arrows can be added by putting a single dash next to a timeline
(pipe character below a timeline name).  this will draw an arrow
to the nearest neighbor in that direction.

add a dash next to a timeline, as shown below, and run redraw to
create an arrow to its neighbor.

  timeline1   timeline2   timeline3
      |-           |           |
  becomes

  timeline1   timeline2   timeline3
      |           |           |
      |---------->|           |
      |           |           |

arrow to any timeline

an angle bracket near a timeline indicates the other end of the
arrow.  both the angle bracket and the dash are used to determine
which timelines to connect.  there can only be one arrow per line.

   timeline1     timeline2     timeline3
      |-           |          >|

  becomes

   timeline1     timeline2     timeline3
      |           |           |
      |---------------------->|
      |           |           |

###  arrow to the left

    create arrows that go to the left by reversing the angle bracket
    and dash.

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |<           |          -|
#+END_SRC

  becomes

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |           |           |
      |<----------------------|
      |           |           |
#+END_SRC

***** dashed arrows

    arrows will be dashed if there is a non-consecutive missing dash
    at any point in the line.

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |- -          |          >|
#+END_SRC

  or

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |- ---------------------->|
#+END_SRC

  becomes

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |           |           |
      | - - - - - - - - - - ->|
      |           |           |
#+END_SRC

***** labels

    labels can be entered on the line above or the same line as the
    arrow.  there can only be one label per line.

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      | call          |          |
      |-           |          |
#+END_SRC

  or

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |- call        |          |
#+END_SRC

  becomes

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |           |           |
      |   call    |           |
      |---------->|           |
      |           |           |
#+END_SRC

***** self arrows

    self arrows are made by keeping the angle bracket and any dashes
    under the same timeline.

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |< call         |          |
#+END_SRC

  becomes

#+BEGIN_SRC
   timeline1     timeline2     timeline3
      |           |           |
      | --.       |           |
      |<--' call  |           |
      |           |           |
#+END_SRC

***** comments

     diagrams can be embedded in source code comments.

#+BEGIN_SRC
#
# timeline1 timeline2
#    |-

;;
;; timeline1 timeline2
;;   |-
;;

//
// timeline1 timeline2
//   |-
//

/*
 * timeline1 timeline2
 *   |-
 */
#+END_SRC

becomes

#+BEGIN_SRC

#  timeline1   timeline2
#      |           |
#      |---------->|
#      |           |

;;   timeline1     timeline2
;;      |           |
;;      |---------->|
;;      |           |
;;

//  timeline1   timeline2
//      |           |
//      |---------->|
//      |           |
//

/*
 *  timeline1   timeline2
 *      |           |
 *      |---------->|
 *      |           |
 */
#+END_SRC

** reference

***** default keymap

| key                                    | action                                         |
|----------------------------------------+------------------------------------------------|
| @@html:<kbd>@@C-c C-c@@html:</kbd>@@   | redraw the diagram at the point                |
| @@html:<kbd>@@M-f@@html:</kbd>@@       | move forward to the next word or timeline      |
| @@html:<kbd>@@M-b@@html:</kbd>@@       | move backward to the previous word or timeline |
| @@html:<kbd>@@M-left@@html:</kbd>@@    | shift a timeline to the left                   |
| @@html:<kbd>@@M-right@@html:</kbd>@@   | shift a timeline to the right                  |
| @@html:<kbd>@@M-S-left@@html:</kbd>@@  | delete the timeline at the point               |
| @@html:<kbd>@@M-S-right@@html:</kbd>@@ | insert a timeline to the right                 |

***** syntax rules

    timeline names can contain special characters but cannot contain
    spaces. timeline names can be multiple lines, but be sure to keep
    the names that are part of the same timeline lined up vertically.

    labels must start with a letter or number but can contain any
    special characters except pipe (|), dash (-), or angle brackets
    (<>).

    comment prefixes can be any length and can contain any special
    characters, but cannot contain letters or numbers. comment
    prefixes can contain leading spaces but cannot contain spaces in
    the middle or at the end.











## References
- [ ](https://github.com/ianxm/emacs-uml)
