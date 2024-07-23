# Pirate Translator on OCI

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-pirate-translator)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-pirate-translator)

## Introduction
Time to have some fun turning normal text into pirate talk!  This deploys a really simple topology that uses an [open-source pirate translator](https://github.com/mikewesthad/pirate-speak) on an OCI instance so you can have fun translating to pirate talk.

Translated:



## Getting Started
You must have an OCI account.  [Click here](https://www.oracle.com/cloud/free/?source=:ex:tb:::::WWMK211203P00003&SC=:ex:tb:::::WWMK211203P00003&pcode=WWMK211203P00003) to create a new cloud account.

Clone this repo:

```
git clone https://github.com/oracle-devrel/terraform-oci-pirate-translator
```

Copy `terraform.tfvars.template` to `terraform.tfvars`, then modify the contents (fill-in-the-blanks for your tenancy).

Run `terraform init` then `terraform apply`.

SSH to your instance (the public IP will be shown when `terraform apply` is done), then run node:

```
node
var ps = require('pirate-speak');
console.log(ps.translate('Hello world!'));
.exit
```

### Prerequisites
You must have an OCI account.  [Click here](https://www.oracle.com/cloud/free/?source=:ex:tb:::::WWMK211203P00003&SC=:ex:tb:::::WWMK211203P00003&pcode=WWMK211203P00003) to create a new cloud account.

## Notes/Issues
None at this time.

## URLs
* https://github.com/mikewesthad/pirate-speak (this is what is used to do the actual translating!)

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2024 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.
