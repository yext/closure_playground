#!/bin/bash

TEMPLATE_DIR=$1

open http://localhost:8080/out/$TEMPLATE_DIR.html
python -m SimpleHTTPServer 8080
