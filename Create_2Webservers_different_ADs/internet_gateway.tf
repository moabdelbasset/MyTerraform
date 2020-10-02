resource "oci_core_internet_gateway" "AbdelBassetInternetGateway" {
    compartment_id = var.compartment_ocid
    display_name = "AbdelBassetInternetGateway"
    vcn_id = oci_core_vcn.AbdelBassetVCN.id
}

