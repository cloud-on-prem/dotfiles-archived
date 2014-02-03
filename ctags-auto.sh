#!/bin/bash
if [ -f ".gitignore" ]; then
  ctags -R --exclude='.git' .
fi
