#!/bin/bash

pixdim2dpi () {
	bc -l <<< "$1/$2" | awk '{ print int($1) }'
}

resolution=$(xrandr \
	| grep -w connected \
	| egrep -o 'connected ([0-9]*x[0-9]*)'\
	| cut -d' ' -f2)

x_pixel=$(cut -d'x' -f1 <<<$resolution)
y_pixel=$(cut -d'x' -f2 <<<$resolution)


inches=$(xrandr \
	| grep -w connected \
	| egrep -o '([0-9]*?mm)' \
	| egrep -o '([0-9]*?)' \
	| while read number; 
		do echo "($number/10)/2.54" | bc -l; done \
	| tr '\n' ' ')


dpi=$(pixdim2dpi $x_pixel $(awk '{ print $1 }' <<<"$inches"))
echo -e "\necho 'Xft.dpi: $dpi' >> ~/.Xresources"
