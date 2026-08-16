#!/usr/bin/env bash

while inotifywait -e close_write presentation.typ -e close_write theme.typ; do typst compile presentation.typ; done
