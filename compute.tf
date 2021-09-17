# Copyright (c) 2021 Oracle and/or its affiliates.

resource "oci_core_instance" "translator" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  display_name        = "translator"
  shape               = var.always_free_compute == true ? "VM.Standard.E2.1.Micro" : "VM.Standard2.1"

  create_vnic_details {
    assign_private_dns_record = true
    assign_public_ip          = true
    display_name              = "translator"
    hostname_label            = "translator"
    nsg_ids = [
      oci_core_network_security_group.translator.id
    ]
    skip_source_dest_check = false
    subnet_id              = oci_core_subnet.translator.id
  }
  metadata = {
    ssh_authorized_keys = local.ssh_pub_key
    user_data = "${base64encode(file("translator.tpl"))}"
  }
  source_details {
    source_id   = local.list_images[var.compute_image_name].id
    source_type = "image"

    boot_volume_size_in_gbs = 50
  }
  preserve_boot_volume = false

  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]]
  }
  defined_tags = {
    "${oci_identity_tag_namespace.devrel.name}.${oci_identity_tag.release.name}" = local.release
  }
}
