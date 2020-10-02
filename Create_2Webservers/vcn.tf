resource "oci_core_vcn" "AbdelBassetVCN" {
    #Required
    cidr_block = var.VCN-CIDR
    compartment_id = var.compartment_ocid

    #Optional
    display_name = "AbdelBassetVCN"
    dns_label = "AbdelBassetVCN"
}
