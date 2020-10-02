resource "oci_core_subnet" "AbdelBassetSubnet" {
  cidr_block = "10.0.1.0/24"
  display_name = "AbdelBassetSubnet"
  dns_label = "AbdelBassetN1"
  compartment_id = var.compartment_ocid 
  vcn_id = oci_core_vcn.AbdelBassetVCN.id
  route_table_id = oci_core_route_table.AbdelBassetRouteTableViaIGW.id
  #dhcp_options_id = oci_core_dhcp_options.AbdelBassetDhcpOptions1.id
  security_list_ids = [oci_core_security_list.AbdelBassetSecurityList.id]
}


