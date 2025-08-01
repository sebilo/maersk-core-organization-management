# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

module "create_breakglass_users" {
  source = "git::https://github.com/sebilo/maersk-lz-modules.git//organization_policies"
}

module "assign_permissionsets" {
  source = "git::https://github.com/sebilo/maersk-lz-modules.git//sso_global_permissionsets_assignment"
  account_assignments = [
    {
      account             = "417447013857",
      permission_set_arn  = "arn:aws:sso:::permissionSet/ssoins-698724b2167b9294/ps-0704b729029e5657",
      permission_set_name = "sso-gbl-lz-administrator",
      principal_type      = "GROUP",
      principal_name      = "LandingZone-Automation",
    },
  ]
}