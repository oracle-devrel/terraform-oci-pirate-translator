# Copyright (c) 2021 Oracle and/or its affiliates.

resource "oci_core_vcn" "translator" {
  provider       = oci
  compartment_id = var.compartment_ocid
  display_name   = "translator"

  cidr_blocks = [
    "172.16.0.0/24"
  ]
  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]]
  }
  defined_tags = {
    "${oci_identity_tag_namespace.devrel.name}.${oci_identity_tag.release.name}" = local.release
  }
  dns_label      = "translator"
  is_ipv6enabled = false
}