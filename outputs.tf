# Copyright (c) 2021 Oracle and/or its affiliates.

output "pub_ip" {
  value = oci_core_instance.translator.public_ip
}
