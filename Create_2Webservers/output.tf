output "AbdelBassetWebserver1PublicIP" {
   value = [data.oci_core_vnic.AbdelBassetWebserver1_VNIC1.public_ip_address]
}
