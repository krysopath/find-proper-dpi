# solve the dpi issue

>Oh noes nothing can be read anymore, zoom 300% alltabs

- got a 4K display and suddenly nothing readable?
- your desktop environment is a [stinking pile]
- you prefer low dependency footprints

The dpi value is computed via by:

```
pixels/inch
```

create a file `~/.Xresources` and set the dpi value

```
Xft.dpi: <magic-number>
```


Then restart your Xsession, so you logout and login.


# find the magic number for your screen

>and all your frames are great again.


Run this:
```
$ ./find-dpi.sh

echo 'Xft.dpi: <magic-number>' >> ~/.Xresources

```





Allow yourself some extra tweaking with these other values:
```
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: false
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
```
