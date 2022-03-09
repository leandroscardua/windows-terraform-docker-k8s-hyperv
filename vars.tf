terraform {
  required_providers {
    hyperv = {
      source = "taliesins/hyperv"
      version = "1.0.3"
    }
  }
}


provider "hyperv" {
  user            = ""
  password        = ""
  host            = ""
  port            = 5986
  https           = true
  insecure        = true
  use_ntlm        = true
  tls_server_name = ""
  cacert_path     = ""
  cert_path       = ""
  key_path        = ""
  script_path     = "C:/Temp/terraform_%RAND%.cmd"
  timeout         = "300s"
}
