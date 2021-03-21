chromium \
    --no-sandbox \
    --headless \
    --disable-gpu \
    --use-gl=swiftshader \
    --run-all-compositor-stages-before-draw \
    --disable-extensions \
    --print-to-pdf=/data/test.pdf \
    https://donnels.github.io

# chromium \
#     --no-sandbox \
#     --headless \
#     --disable-gpu \
#     --use-gl=swiftshader \
#     --remote-debugging-port=8888 \
#     https://donnels.github.io
