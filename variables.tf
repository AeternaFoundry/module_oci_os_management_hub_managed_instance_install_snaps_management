variable "os_management_hub_managed_instance_install_snaps_managements" {
  description = <<EOT
Map of os_management_hub_managed_instance_install_snaps_managements, attributes below
Required:
    - managed_instance_id
Optional:
    - snap_details (block):
        - channel (optional)
        - is_signed (optional)
        - mode (optional)
        - name (required)
        - revision (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - work_request_details (block):
        - description (optional)
        - display_name (optional)
EOT

  type = map(object({
    managed_instance_id = string
    snap_details = optional(list(object({
      channel   = optional(string)
      is_signed = optional(bool)
      mode      = optional(string)
      name      = string
      revision  = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    work_request_details = optional(object({
      description  = optional(string)
      display_name = optional(string)
    }))
  }))
}

