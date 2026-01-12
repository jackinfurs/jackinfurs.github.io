#!/usr/bin/env bash

QUALITY=80
OPUS_BITRATE="96k"

set -euo pipefail

echo "converting img to webp..."
find . -type f \( \
    -iname "*.png" -o \
    -iname "*.jpg" -o \
    -iname "*.jpeg" \
\) | while read -r img; do
    webp="${img%.*}.webp"

    if [[ -f "$webp" ]]; then
        orig_size=$(stat -c %s "$img")
        webp_size=$(stat -c %s "$webp")

        if (( webp_size < orig_size )); then
            rm "$img"
            continue
        fi
    fi

    if cwebp -q "$QUALITY" -m "6" "$img" -o "$webp" >/dev/null; then
        rm "$img"
    else
        echo "  conversion failed: $img"
        rm -f "$webp"
    fi
done

echo "converting audio to opus..."
find . -type f \( \
    -iname "*.mp3" -o \
    -iname "*.wav" -o \
    -iname "*.flac" -o \
    -iname "*.aac" -o \
    -iname "*.m4a" -o \
    -iname "*.ogg" \
\) | while read -r audio; do
    opus="${audio%.*}.opus"

    if [[ -f "$opus" ]]; then
        continue
    fi

    if ffmpeg -nostdin -y -loglevel error \
        -i "$audio" \
        -c:a libopus \
        -b:a "$OPUS_BITRATE" \
        -application "audio" \
        "$opus"; then
        rm "$audio"
    else
        echo "  conversion failed: $audio"
        rm -f "$opus"
    fi
done

echo "updating html + md refs..."
find . -type f \( -iname "*.html" -o -iname "*.md" \) | while read -r file; do
    sed -i \
        -e 's/\.\(png\|jpg\|jpeg\)\b/.webp/gI' \
        -e 's/\.\(mp3\|wav\|flac\|aac\|m4a\|ogg\)\b/.opus/gI' \
        "$file"
done

cd blog_src
bundle exec jekyll clean && bundle exec jekyll build
cd ..

python3 -m http.server
