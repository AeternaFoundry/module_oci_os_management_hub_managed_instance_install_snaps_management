resource "oci_os_management_hub_managed_instance_install_snaps_management" "os_management_hub_managed_instance_install_snaps_managements" {
  for_each = var.os_management_hub_managed_instance_install_snaps_managements

  managed_instance_id = each.value.managed_instance_id

  dynamic "snap_details" {
    for_each = each.value.snap_details != null ? each.value.snap_details : []
    content {
      channel   = snap_details.value.channel
      is_signed = snap_details.value.is_signed
      mode      = snap_details.value.mode
      name      = snap_details.value.name
      revision  = snap_details.value.revision
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "work_request_details" {
    for_each = each.value.work_request_details != null ? [each.value.work_request_details] : []
    content {
      description  = work_request_details.value.description
      display_name = work_request_details.value.display_name
    }
  }
}

