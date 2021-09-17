# Copyright (c) 2021 Oracle and/or its affiliates.

locals {
  nsg_types = {
    cidr : "CIDR_BLOCK",
    svc : "SERVICE_CIDR_BLOCK",
    nsg : "NETWORK_SECURITY_GROUP"
  }

  # see https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_drg_attachment
  drg_attachment_types = {
    ipsec = "IPSEC_TUNNEL",
    rpc   = "REMOTE_PEERING_CONNECTION",
    vcn   = "VCN",
    vc    = "VIRTUAL_CIRCUIT"
  }

  dest_types = {
    cidr = "CIDR_BLOCK",
    svc  = "SERVICE_CIDR_BLOCK"
  }

  #Transform the list of images in a tuple
  list_images = { for s in data.oci_core_images.this.images :
    s.display_name =>
    { id               = s.id,
      operating_system = s.operating_system
    }
  }

  private_key = try(file(var.private_key_path), var.private_key)
  release     = "1.0"

  ssh_pub_key = try(file(var.ssh_pub_key_path), var.ssh_pub_key)
}