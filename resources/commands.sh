rm -rf ./resource.*
rm -rf ./test-img.*

ffmpeg -i ./bbb-splash.jpg -s 640x480 -vf scale=640:480 -pix_fmt yuv420p ./resource.yuv420p.yuv
ffmpeg -i ./bbb-splash.jpg -s 640x480 -vf scale=640:480 -pix_fmt yuv420p16le ./resource.yuv420p16le.yuv
ffmpeg -i ./bbb-splash.jpg -s 640x480 -vf scale=640:480 -pix_fmt nv12 ./resource.nv12.yuv
ffmpeg -i ./bbb-splash.jpg -s 640x480 -vf scale=640:480 -pix_fmt nv21 ./resource.nv21.yuv
ffmpeg -i ./bbb-splash.jpg -s 640x480 -vf scale=640:480 -pix_fmt yuv444p ./resource.yuv444p.yuv


../colorformatter --input ./resource.yuv420p.yuv --input-format yuv420p --width 640 --height 480 --output ./test-img.yv12 --output-format yv12
../colorformatter --input ./resource.yuv420p.yuv --input-format yuv420p --width 640 --height 480 --output ./test-img.y8 --output-format y8
../colorformatter --input ./resource.yuv420p16le.yuv --input-format yuv420p16le --width 640 --height 480 --output ./test-img.y16 --output-format y16
../colorformatter --input ./resource.nv12.yuv --input-format nv12 --width 640 --height 480 --output ./test-img.ycbcr_420_888 --output-format ycbcr_420_888
../colorformatter --input ./resource.nv21.yuv --input-format nv21 --width 640 --height 480 --output ./test-img.ycbcr_420_sp --output-format ycbcr_420_sp
../colorformatter --input ./resource.yuv444p.yuv --input-format yuv444p --width 640 --height 480 --output ./test-img.ycbcr_444_888 --output-format ycbcr_444_888
../colorformatter --input ./resource.nv12.yuv --input-format nv12 --width 640 --height 480 --output ./test-img.nv12_y_tiled_intel --output-format nv12_y_tiled_intel
