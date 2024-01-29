# delete-old-emails-webmin.sh

A bash script to delete old emails. Works with Postfix.

### Why

Postfix saves emails in the directory /home/$useraccount/Maildir/new (or cur), but additional folders are created when using IMAP. Additionally, Webmin/Usermin generates extra folders for each email account created under the main account, complicating the deletion of older emails. This script will search for all these folders and remove emails that are older than a specified number of days.

### Installation

By default it will find and delete emails older than **30 days**. If you want to modify the period, replace +30 with +90 in the script.

Just place it in /root/, make it executable, and run it via cron every midnight:

```
0 0 * * * /root/delete-older-emails.sh > /root/deleted-emails.log 2>&1
```

or, without logging:

```
0 0 * * * /root/delete-older-emails.sh > /dev/null 2>&1
```

#### Note

The script uses a predefined list of folders. If you want it to run for all folders under '/home', replace the 'paths' array with the code below:
```
paths=()

for dir in /home/*/; do
  if [ -d "$dir" ]; then
    paths+=("$dir")
  fi
done
```


*Disclaimer: This script is provided as-is, without any warranties or guarantees. The use of this script is at your own risk. The author is not responsible for any damage, loss of data, or other issues that may arise from the use of this script. It is recommended to thoroughly review and understand the script before implementation. Use caution and make backups before executing any potentially destructive operations.*
