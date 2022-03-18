resource "hyperv_vhd" "ws2022_vhd" {
  path = "d:\\vhdx\\ws2022.vhdx"
  size = 40737418240 #40GB
}

resource "hyperv_machine_instance" "ws2022" {
  name = "w8s-n1"
  generation = 1
  processor_count = 2
  static_memory = true
  memory_startup_bytes = 8594128896
  wait_for_state_timeout = 10
  wait_for_ips_timeout = 10
  checkpoint_type = "Disabled"

  network_adaptors {
      name = "lan"
      switch_name = "LAN"
      wait_for_ips = false  
  }

  hard_disk_drives {
    controller_type = "Ide"
    path = hyperv_vhd.ws2022_vhd.path
    controller_number = 0
    controller_location = 0
  }

  dvd_drives {
    controller_number = 0
    controller_location = 1
    path = "d:/iso/windows-server-2022.iso"
  }
  
  dvd_drives {
    controller_number = 1
    controller_location = 1
    path = "d:/iso/Autounattend.iso"
  }

}
