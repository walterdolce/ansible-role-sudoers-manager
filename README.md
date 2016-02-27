[![Build Status](https://travis-ci.org/walterdolce/ansible-role-sudoers-manager.svg?branch=master)](https://travis-ci.org/walterdolce/ansible-role-sudoers-manager)
[![Apache License](https://img.shields.io/badge/license-Apache%202.0-blue.svg?style=flat)](http://www.apache.org/licenses/LICENSE-2.0)

Ansible Role - Sudoers Manager
==============================

Ansible role that manages `sudoers.d` profiles.

Requirements
------------

None.

Role Variables
--------------

The role provides no default variables. It only provides a
variable you can set to manage multiple sudoers profiles.
Once the `sudoers_manager_sudoers_profiles` dictionary is properly
set, the role will create a file in the `sudoers.d` folder for
each profile it will find defined in it.

In order for the sudoers profiles to be created/managed during
provisioning, each `sudoers_manager_sudoers_profiles` dictionary
item must have three keys defined. Those are `profile_dir`,
`profile_name` and `template_path`, as you can see below.

Example:
```
# ./playbook.yml
---
- hosts: localhost
  remote_user: root
  roles:
    - {
      role: walterdolce.sudoers-manager,
      sudoers_manager_sudoers_profiles: {
        profile_1: {
              profile_dir: '/etc/sudoers.d/',
              profile_name: 'john',
              template_path: '/tmp/sudoers-manager/templates/'
           },
        profile_2: {
              profile_dir: '/etc/sudoers.d/',
              profile_name: 'alan',
              template_path: '/tmp/sudoers-manager/templates/'
           }
        }
      }
```
In the example above, we are going to create two files in the
`/etc/sudoers.d/` directory: `/etc/sudoers.d/john` and
`/etc/sudoers.d/alan`. Both will have a corresponding template
file in the `/tmp/sudoers-manager/templates/` directory, which
**you** will have to provide.

Dependencies
------------

None.

Example Playbook
----------------
```
# ./playbook.yml
---
- hosts: your-hosts-definition
  roles:
    - {
      role: walterdolce.sudoers-manager,
      sudoers_manager_sudoers_profiles: {
        profile_1: {
              profile_dir: '/etc/sudoers.d/',
              profile_name: 'john',
              template_path: '/tmp/sudoers-manager/templates/'
           },
        profile_2: {
              profile_dir: '/etc/sudoers.d/',
              profile_name: 'alan',
              template_path: '/tmp/sudoers-manager/templates/'
           }
        }
      }
```

Development
-----------

Please see the DEVELOPMENT.md file for more information.

License
-------

Apache License 2.0 - Please see the LICENSE file for more information.

Author Information
------------------

Developed and maintained by Walter Dolce <walterdolce@gmail.com>
