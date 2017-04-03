#!/bin/bash

puppet apply \
   --show_diff \
   --detailed-exitcodes \
   --modulepath=modules \
   --hiera_config=hiera.yaml \
   --execute "include php"
