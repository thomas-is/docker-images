#!/bin/bash

docker build -t slrn .

docker run --rm -it --hostname no.invalid slrn
