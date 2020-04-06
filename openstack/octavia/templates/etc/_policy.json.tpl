{
    "context_is_cloud_admin":  "role:cloud_network_admin",
    "context_is_admin":  "rule:context_is_cloud_admin",
    "owner": "project_id:%(project_id)s",
    "member": "role:loadbalancer_member and rule:owner",
    "viewer": "(role:loadbalancer_viewer or role:network_viewer)  and rule:owner",
    "admin": "(role:loadbalancer_admin or role:network_admin) and rule:owner",
    "memberadmin": "role:loadbalancer_memberadmin and rule:owner",
    "context_is_loadbalancer_admin": "rule:context_is_admin or rule:admin",
    "context_is_editor": "rule:context_is_loadbalancer_admin or rule:member",
    "context_is_viewer": "rule:context_is_editor or rule:viewer or rule:memberadmin",
    "default": "rule:context_is_admin",

    "os_load-balancer_api:flavor:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:flavor:post": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:flavor:put": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:flavor:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:flavor:delete": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:flavor-profile:get_all": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:flavor-profile:post": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:flavor-profile:put": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:flavor-profile:get_one": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:flavor-profile:delete": "rule:context_is_loadbalancer_admin",

    "os_load-balancer_api:healthmonitor:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:healthmonitor:get_all-global": "rule:context_is_editor",
    "os_load-balancer_api:healthmonitor:post": "rule:context_is_editor",
    "os_load-balancer_api:healthmonitor:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:healthmonitor:put": "rule:context_is_editor",
    "os_load-balancer_api:healthmonitor:delete": "rule:context_is_editor",

    "os_load-balancer_api:l7policy:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:l7policy:get_all-global": "rule:context_is_editor",
    "os_load-balancer_api:l7policy:post": "rule:context_is_editor",
    "os_load-balancer_api:l7policy:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:l7policy:put": "rule:context_is_editor",
    "os_load-balancer_api:l7policy:delete": "rule:context_is_editor",
    "os_load-balancer_api:l7rule:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:l7rule:post": "rule:context_is_editor",
    "os_load-balancer_api:l7rule:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:l7rule:put": "rule:context_is_editor",
    "os_load-balancer_api:l7rule:delete": "rule:context_is_editor",

    "os_load-balancer_api:listener:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:listener:get_all-global": "rule:context_is_editor",
    "os_load-balancer_api:listener:post": "rule:context_is_editor",
    "os_load-balancer_api:listener:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:listener:put": "rule:context_is_editor",
    "os_load-balancer_api:listener:delete": "rule:context_is_editor",
    "os_load-balancer_api:listener:get_stats": "rule:context_is_viewer",

    "os_load-balancer_api:loadbalancer:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:loadbalancer:get_all-global": "rule:context_is_editor",
    "os_load-balancer_api:loadbalancer:post": "rule:context_is_editor or rule:memberadmin",
    "os_load-balancer_api:loadbalancer:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:loadbalancer:put": "rule:context_is_editor",
    "os_load-balancer_api:loadbalancer:delete": "rule:context_is_editor",
    "os_load-balancer_api:loadbalancer:get_stats": "rule:context_is_viewer",
    "os_load-balancer_api:loadbalancer:get_status": "rule:context_is_viewer",
    "os_load-balancer_api:loadbalancer:put_failover": "rule:context_is_loadbalancer_admin",

    "os_load-balancer_api:member:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:member:post": "rule:context_is_editor",
    "os_load-balancer_api:member:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:member:put": "rule:context_is_editor",
    "os_load-balancer_api:member:delete": "rule:context_is_editor",

    "os_load-balancer_api:pool:get_all": "rule:context_is_viewer",
    "os_load-balancer_api:pool:get_all-global": "rule:context_is_editor",
    "os_load-balancer_api:pool:post": "rule:context_is_editor",
    "os_load-balancer_api:pool:get_one": "rule:context_is_viewer",
    "os_load-balancer_api:pool:put": "rule:context_is_editor",
    "os_load-balancer_api:pool:delete": "rule:context_is_editor or rule:memberadmin",

    "os_load-balancer_api:provider:get_all": "rule:context_is_viewer",

    "os_load-balancer_api:quota:get_all": "rule:context_is_viewer-quota",
    "os_load-balancer_api:quota:get_all-global": "rule:context_is_viewer-quota-global",
    "os_load-balancer_api:quota:get_one": "rule:context_is_viewer-quota",
    "os_load-balancer_api:quota:put": "role:resource_service",
    "os_load-balancer_api:quota:delete": "role:resource_service",
    "os_load-balancer_api:quota:get_defaults": "rule:context_is_viewer-quota",

    "os_load-balancer_api:amphora:get_all": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:amphora:get_one": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:amphora:put_config": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:amphora:put_failover": "rule:context_is_loadbalancer_admin",
    "os_load-balancer_api:amphora:get_stats": "rule:context_is_loadbalancer_admin",

    "os_load-balancer_api:provider-flavor:get_all": "rule:context_is_loadbalancer_admin"
}
