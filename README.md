# Odoo with NFS
Odoo docker image with datadir and log directory placed on Network File System (NFS).

| Specification | Version |
|----|----|
|Python|`'3.8'` (recommended) or `'3.10'`|
|Odoo version|`'16'`|
|PostgreSQL|`'14'`|

| Python `'3.10'` has slower build time. 

# Folder Structure
There are some points you should know:
- You should add your `odoo-base` to the directory.
- Add your custom addon to `git` directory.
- Add your custom addon in the `conf` file
- Make sure in `run-odoo.sh` to use your config file and run the odoo binary inside `odoo-base`
- for `datadir` and and `log` will be generated by image builder, because it uses NFS as the persistent storage. 

```markdown
.
├── conf
├── datadir
├── dockerfile
├── entrypoint.sh
├── git
├── log
├── odoo-base
└── run-odoo.sh
```

---

Copyright © 2023 ryumada. All Rights Reserved.

Licensed under the [MIT](LICENSE) license.
