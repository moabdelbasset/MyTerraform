resource "oci_core_instance" "AbdelBassetWebserver1" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  compartment_id = var.compartment_ocid
  display_name = "AbdelBassetWebServer1"
  fault_domain = "FAULT-DOMAIN-1"
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

