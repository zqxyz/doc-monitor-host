# doc-monitor-host
This is the sister of [doc-monitor-client](https://github.com/zqxyz/doc-monitor-client). This is installed on the server. The client script is installed on your desktops and laptops.

This is an alternative to cloud storage, while achieving a similar effect. I find it useful to store files locally so programs can readily access them. This results in redunancy of my work, reducing the risk of loss, and better loading and saving times.

This is essentially a wrapper around `rsync` with a confidence check for file deletion. Deleting files on a client device will not work. It will sync right back into place. To delete a file, you must use the `doc-rm.sh` script on the host/server. The installation adds itself to your path, so you can just run `. doc-rm.sh filetodelete.txt` or `. doc-rm.sh directory2rm` _with no trailing slash_. This will remove it from the server and also from any clients that are active or from inactive clients next time they become active.

## Installation

![File diagram](https://zquint.xyz/images/docmon-host_diag.png)
