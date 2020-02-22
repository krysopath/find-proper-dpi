#!/bin/bash

screen0=$(xrandr \
	| grep -w connected \
	| egrep -o 'connected ([0-9]*x[0-9]*)')

x_pixel=$(cut -d' ' -f2 <<< $screen0| cut -d'x' -f1)

y_pixel=$(cut -d' ' -f2 <<< $screen0| cut -d'x' -f2)

inches=$(xrandr \
	| grep -w connected \
	| egrep -o '([0-9]*?mm)' \
	| egrep -o '([0-9]*?)' \
	| while read number; 
		do echo "($number/10)/2.54" | bc -l; done \
	| tr '\n' ' ')


xdpi=$(bc -l <<< "$x/$(awk '{ print $1 }' <<<"$inches")")
ydpi=$(bc -l <<< "$y/$(awk '{ print $2 }' <<<"$inches")")

echo "Xdpi: $(awk '{print int($1)}' <<<$xdpi)"
echo "Ydpi: $(awk '{print int($1)}' <<<$ydpi)"
