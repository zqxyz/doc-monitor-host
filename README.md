# doc-monitor-host
This is the sister of [doc-monitor-client](https://github.com/zqxyz/doc-monitor-client). This is installed on the server. The client script is installed on your desktops and laptops.

This is an alternative to cloud storage, while achieving a similar effect. I find it useful to store files locally so programs can readily access them. This results in redunancy of my work, reducing the risk of loss, and better loading and saving times.

This is essentially a wrapper around `rsync` with a confidence check for file deletion. Deleting files on a client device will not work. It will sync right back into place. To delete a file, you must use the `doc-rm.sh` script on the host/server. The installation adds itself to your path, so you can just run `. doc-rm.sh filetodelete.txt` or `. doc-rm.sh directory2rm` _with no trailing slash_. This will remove it from the server and also from any clients that are active or from inactive clients next time they become active.

## Installation
Before using this, consider that this was an educational exercise for me. It meets my needs, but it may not meet yours. If you don't understand the code, it might not be the best fit for you.

This is installed _before_ [doc-monitor-client](https://github.com/zqxyz/doc-monitor-client).

```
cd ~
git clone https://github.com/zqxyz/doc-monitor-host.git
cd doc-monitor-host
. install.sh
cd ../ && rm -rf doc-monitor-host
```

This will place `doc-monitor-host.sh`, `doc-monitor-config.sh`, and `doc-rm.sh` into `/opt/doc-monitor`. You will be prompted to examine the minimal configuration. It will create a cronjob at boot time to run `doc-monitor-host.sh`. It will start `doc-monitor-host.sh` in the background.

Once running, two dotfiles will be generated for storing data. `.doc_mod_time` stores the most recent modification of any file on the server (local to the script). `.rmlist` stores files to be deleted from clients.

![File diagram](https://zquint.xyz/images/docmon-host_diag.png)

**Next, set up [doc-monitor-client](https://github.com/zqxyz/doc-monitor-client).**

## TODO
- Enable recreation of files with names on the `.rmlist`
  - Option 1: register clients, and when all clients have rm'd file/dir, purge from rmlist
  - Option 2: purge rmlist entries after period of time (2 months?) or number of entries (2000?)
  - Option 3 (best option): Option 2 plus compare timestamp of file with same name with rmlist file timestamp, and if the rmlist timestamp is older, purge entry from rmlist and allow file to sync to server (and therefore to propagate to clients)
