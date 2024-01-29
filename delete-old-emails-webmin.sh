#!/bin/bash

paths=(
  "/home/someuser"
  "/home/another"
)

for path in "${paths[@]}"; do
	echo "$path"
	find $path -type f -iwholename "**/Maildir/cur/*" -mtime +30 -exec rm -f "{}" \;
	find $path -type f -iwholename "**/Maildir/new/*" -mtime +30 -exec rm -f "{}" \;
	find $path -type f -wholename "**/.INBOX*/cur/*" -mtime +30 -exec rm -f "{}" \;
	find $path -type f -wholename "**/.INBOX*/new/*" -mtime +30 -exec rm -f "{}" \;
done
