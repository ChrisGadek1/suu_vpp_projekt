#!/bin/bash

for i in {1..5}
do
   docker compose run -e ID=$i node
done