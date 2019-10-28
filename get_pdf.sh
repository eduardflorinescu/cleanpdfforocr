#!/bin/bash
mkdir "$1_temp"

cp "$1" "$1_temp"/to_do.pdf
cd "$1_temp"
pdftk to_do.pdf burst output pg_%04d.pdf
ls ./pg*.pdf | xargs -L1 -I {}  inkscape {} -z --export-dpi=300 --export-area-drawing --export-png={}.png
rm *.pdf
#ls ./p*.png | xargs -L1 -I {} convert {}  -quality 100 -density 300 -fill white -fuzz 80% +opaque "#000000" -density 300  {}.jpg
ls ./p*.png | xargs -L1 -I {} convert {}  -quality 75 -density 300 -fill white -fuzz 20% +opaque "#000000" -density 300  {}.jpg
#ls ./p*.png | xargs -L1 -I {} convert {} -strip -interlace JPEG -sampling-factor 4:2:0  -colorspace Gray -gaussian-blur 0.05 -quality 55 -density 300 -fill white -fuzz 40% +opaque "#000000" -density 300 {}.jpg
#ls ./p*.png | xargs -L1 -I {} convert {} -strip -interlace JPEG -sampling-factor 4:2:0 -adaptive-resize 60%   -gaussian-blur 0.05 -colorspace Gray -quality 10 -density 300 -fill white -fuzz 40% +opaque "#000000" -density 300 {}.jpg
#ls ./p*.png | xargs -L1 -I {} convert {} -strip -interlace JPEG -sampling-factor 4:2:0 -adaptive-resize 60% -set colorspace Gray  -quality 55 -density 300 -fill white -fuzz 40% +opaque "#000000" -density 300 {}.jpg
#ls ./p*.png | xargs -L1 -I {} convert {}  -set colorspace Gray  -density 300 -fill white -fuzz 40% +opaque "#000000" -density 300 {}.clean.png

rm *.pdf
ls -1 ./*jpg | xargs -L1 -I {} img2pdf {} -o {}.pdf
rm *.jpg
pdftk *.pdf cat output combined.pdf


#ls ./*.jpg | xargs -L1 -I {} convert {} -colorspace Gray -quality 10 -density 300 -fill white -fuzz 40% +opaque "#000000" -density 300 {}.png


#ls ./*.jpg | xargs -L1 -I {} convert {} +dither -colors 2 -type bilevel -density 300 -fill white -fuzz 40% +opaque "#000000" -density 300 {}.m.png

#ls ./*.png | xargs -L1 -I {} convert {} -strip -interlace JPEG -sampling-factor 4:2:0 -adaptive-resize 40%   -gaussian-blur 0.05 -colorspace Gray -quality 10 -density 300 {}.jpg


