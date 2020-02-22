# solve the dpi issue

>Oh noes nothing can be read anymore, zoom 300% alltabs

- got a 4K display and suddenly nothing readable?
- your desktop environment is a [stinking pile]
- you prefer low dependency footprints

The dpi value is computed via by:

```
pixels/inch
```

So run this to get an calculation for x, y:
```
$ ./find-dpi.sh
Xdpi: 283
Ydpi: 282
```

choose a number by coin toss as the magic dpi number.

create a file `~/.Xresources` and set the dpi value

```
Xft.dpi: <magic-number>
```


Then restart your Xsession, so you logout and login.

>All your frames are readable.


Allow yourself some extra tweaking with these other values:
```
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: false
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
```
