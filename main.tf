# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

module "create_breakglass_users" {
  source = "git::https://github.com/sebilo/maersk-lz-modules.git//organization_policies"
}

module "permissionsets" {
  source = "git::https://github.com/sebilo/maersk-lz-modules.git//sso_global_permissionsets_creation"
  permission_sets = [
    {
      name               = "sso-gbl-lz-administrator"
      description        = "Provides full access to Maersk Landing Zone core accounts"
      relay_state        = ""
      session_duration   = "PT1H"
      policy_attachments = ["arn:aws:iam::aws:policy/AdministratorAccess"]
      inline_policy      = ""
      tags = {

      }
    },
    {
      name               = "sso-gbl-lz-readonly"
      description        = "Provides read only access to Maersk Landing Zone core accounts"
      relay_state        = ""
      session_duration   = "PT1H"
      policy_attachments = ["arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"]
      inline_policy      = ""
      tags = {

      }
    },
    {
      name               = "sso-gbl-lz-networkcontributor"
      description        = "Provides network contributor access to Maersk Landing Zone core accounts"
      relay_state        = ""
      session_duration   = "PT1H"
      policy_attachments = ["arn:aws:iam::aws:policy/job-function/NetworkAdministrator"]
      inline_policy      = ""
      tags = {

      }
    },
    {
      name               = "sso-gbl-lz-securitycontributor"
      description        = "Provides security contributor access to Maersk Landing Zone core accounts"
      relay_state        = ""
      session_duration   = "PT1H"
      policy_attachments = ["arn:aws:iam::aws:policy/AmazonGuardDutyFullAccess_v2"]
      inline_policy      = ""
      tags = {

      }
    }
  ]
}