#cloud-config
# Copyright (c) 2020 Oracle and/or its affiliates.

runcmd:
  - yum install -y npm
  - npm install --save pirate-speak

write_files:
  # Create a file saying we're done
  - path: /home/opc/cloud-init.txt
    content: |
      All done!
