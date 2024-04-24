# Artist-Mode

To draw a poly line, C-c C-a P to enter poly-line mode, RET
(artist-key-set-point) to start the line, move point with normal movement
commands, then hit RET again to end the segment and start a new one, C-u RET for
the final segment.

From artist-mode docstring:

Drawing with keys

 RET        Does one of the following:
            For lines/rectangles/squares: sets the first/second endpoint
            For poly-lines: sets a point (use C-u RET to set last point)
            When erase characters: toggles erasing
            When cutting/copying: Sets first/last endpoint of rect/square
            When pasting: Pastes

 C-c C-a C-o    Selects what to draw

 Move around with C-n, C-p, C-f and C-b.

 C-c C-a C-f    Sets the character to use when filling
 C-c C-a C-l    Sets the character to use when drawing
 C-c C-a C-e    Sets the character to use when erasing
 C-c C-a C-r    Toggles rubber-banding
 C-c C-a C-t    Toggles trimming of line-endings
 C-c C-a C-s    Toggles borders on drawn shapes


Arrows

 <      Sets/unsets an arrow at the beginning
        of the line/poly-line

 >      Sets/unsets an arrow at the end
        of the line/poly-line


## References
- [StackOverFlow emacs-artist-mode---no-gui](https://stackoverflow.com/questions/30861929/emacs-artist-mode-no-gui)
