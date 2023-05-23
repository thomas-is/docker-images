#!/bin/bash
for CATEGORY in volume image builder; do
  CMD="docker $CATEGORY prune -f"
  echo $CMD
  $CMD
done
