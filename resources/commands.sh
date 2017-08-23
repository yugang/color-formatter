rm -rf ./resource.*
rm -rf ./test-img.*

ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt yuv420p ./resource.yuv420p.yuv
ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt yuv420p16le ./resource.yuv420p16le.yuv
ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt nv12 ./resource.nv12.yuv
ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt nv16 ./resource.nv16.yuv
ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt nv21 ./resource.nv21.yuv
ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt yuv444p ./resource.yuv444p.yuv
ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt yuyv422 ./resource.yuyv422.yuv
ffmpeg -i ./bbb-splash.jpg -s 600x400 -vf scale=600:400 -pix_fmt yuv422p ./resource.yuv422p.yuv

../colorformatter --input ./resource.yuv420p.yuv --input-format yuv420p --width 600 --height 400 --output ./test-img.yv12 --output-format yv12
../colorformatter --input ./resource.yuv420p.yuv --input-format yuv420p --width 600 --height 400 --output ./test-img.y8 --output-format y8
../colorformatter --input ./resource.yuv420p16le.yuv --input-format yuv420p16le --width 600 --height 400 --output ./test-img.y16 --output-format y16
../colorformatter --input ./resource.nv12.yuv --input-format nv12 --width 600 --height 400 --output ./test-img.ycbcr_420_888 --output-format ycbcr_420_888
../colorformatter --input ./resource.nv21.yuv --input-format nv21 --width 600 --height 400 --output ./test-img.ycrcb_420_sp --output-format ycrcb_420_sp
#below command line need check if ycbcr_444_888 is plane format?
../colorformatter --input ./resource.yuv444p.yuv --input-format yuv444p --width 600 --height 400 --output ./test-img.ycbcr_444_888 --output-format ycbcr_444_888
../colorformatter --input ./resource.nv12.yuv --input-format nv12 --width 600 --height 400 --output ./test-img.nv12_y_tiled_intel --output-format nv12_y_tiled_intel
../colorformatter --input ./resource.nv12.yuv --input-format nv12 --width 600 --height 400 --output ./test-img.nv12_linear_cam_intel --output-format nv12_linear_cam_intel
../colorformatter --input ./resource.yuyv422.yuv --input-format yuyv422 --width 600 --height 400 --output ./test-img.ycbcr_422_i --output-format ycbcr_422_i
#below command line need check if ycbcr_422_888 is plane format?
../colorformatter --input ./resource.yuv422p.yuv --input-format yuv422p --width 600 --height 400 --output ./test-img.ycbcr_422_888 --output-format ycbcr_422_888
../colorformatter --input ./resource.nv16.yuv --input-format nv16 --width 600 --height 400 --output ./test-img.ycbcr_422_sp --output-format ycbcr_422_sp
../colorformatter --width 600 --height 400 --output ./test-img.raw10 --output-format raw10
../colorformatter --width 600 --height 400 --output ./test-img.raw12 --output-format raw12
../colorformatter --width 600 --height 400 --output ./test-img.raw16 --output-format raw16
../colorformatter --width 600 --height 400 --output ./test-img.rawblob --output-format rawblob
../colorformatter --width 600 --height 400 --output ./test-img.rawopaque --output-format rawopaque
