Fire Fox
=========

The goal of this project is to automatically install and configure firefox according to a users preferences.
Created this project before I discovered this one: https://github.com/alzadude/ansible-firefox

Requirements
------------

An inventory file with an entry for desktop should exist.  I use this project to spin up an Ubuntu
desktop in EC2 using terraform: https://github.com/bbux-aws/aws-packer-terraform-ansible.  This also
generates and inventory file that will work with this project.

Role Variables
--------------

os_type: 'ubuntu'

Dependencies
------------

No Dependencies

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: desktop
      roles:
        - role: firefox

Set your custom list of preference and reference them with

```bash
ansible-playbook main.yml --extra-vars "@/path/to/firefox_prefs.yml"

# also this works

ansible-playbook main.yml -e @/path/to/firefox_prefs.yml
```

/path/to/firefox_prefs.yml should have the format:

```yaml
firefox:
  prefs:
    - { name: browser.tabs.warnOnClose, value: false }
    - { name: geo.enabled,              value: false }
```

Extract existing prefs:

```bash
sed 's/user_pref("\(.*\)",\(.*\));/    - { name: \1, value:\2 }/g' \
  ~/.mozilla/firefox/*.default*/prefs.js  > /path/to/firefox_prefs.yml
```

License
-------

Apache2
