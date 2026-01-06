








##### STATIC VARS CAUTION BEFORE CHANGING #####
provider-username = "cisco"
provider-userpass = "cisco"
provider-url-agg01 = "https://192.168.1.123"
provider-url-agg02 = "https://192.168.1.190"
hostname-agg01 = "Dev-Test-AGG01"
hostname-agg02 = "Dev-Test-AGG02"
#
vrf-names = ["vpc", "xx01_es_core"]
#
vlan_map = {
    "10" = {
    fabric_encap = "10"
    name         = "TEMP-TEST"
    },
    "20" = {
    fabric_encap = "20"
    name         = "TEMP-TEST2"
    },
    "1100" = {
    fabric_encap = "1100"
    name         = "xx-01_AGG_to_EDG"
    },
    "1101" = {
    fabric_encap = "1101"
    name         = "XX-01_ES_EDG"
  }
}
#