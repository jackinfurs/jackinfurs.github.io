#!/usr/bin/env bash

cd blog_src
bundle exec jekyll clean && bundle exec jekyll build
cd ..
python3 -m http.server

