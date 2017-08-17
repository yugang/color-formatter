## Build Color Formatter
```
cd path/to/color-formatter/

./autogen.sh

make
```

## Generate Test Image
The script will use ffmpeg to convert bbb-splash.jpg ito the original raw data which can be used by colorformatter
to convert the final test image files.

```
sudo apt-get install ffmpeg

cd path/to/color-formatter/resources/

sh commands.sh
```
