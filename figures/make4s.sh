for f in cutouts/*.jpg
do
  convert $f $f".eps"
done