resource "oci_core_instance" "AbdelBassetWebserver2" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[2], "name")
  compartment_id = var.compartment_ocid
  display_name = "AbdelBassetWebServer2"
  shape = var.Shapes[0]
  subnet_id = oci_core_subnet.AbdelBassetSubnet.id
  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.OSImageLocal.images[0], "id")
  }
  metadata = {
      ssh_authorized_keys = file(var.public_key_oci)
  }
  create_vnic_details {
     subnet_id = oci_core_subnet.AbdelBassetSubnet.id
     assign_public_ip = true
  }
}

data "oci_core_vnic_attachments" "AbdelBassetWebserver2_VNIC1_attach" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[2], "name")
  compartment_id = var.compartment_ocid
  instance_id = oci_core_instance.AbdelBassetWebserver2.id
}

data "oci_core_vnic" "AbdelBassetWebserver2_VNIC1" {
  vnic_id = data.oci_core_vnic_attachments.AbdelBassetWebserver2_VNIC1_attach.vnic_attachments.0.vnic_id
}

output "AbdelBassetWebserver2PublicIP" {
value = [data.oci_core_vnic.AbdelBassetWebserver2_VNIC1.public_ip_address]
}

