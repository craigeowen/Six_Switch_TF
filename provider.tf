provider "nxos" {
  alias = "twe-agg01"
  username = "cisco"
  password = "cisco"
  url      = "https://192.168.1.123"
}
provider "nxos" {
  alias = "twe-agg02"
  username = "cisco"
  password = "cisco"
  url      = "https://192.168.1.190"
}