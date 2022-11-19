# bashuper

## requirements
- bash
- rsync

## Increment backup example

### Local

```bash
bash start-backup.sh $PWD/example-source $PWD/example-backup
```

### Remote

On backup server use this with ssh key auth

```bash
bash start-backup.sh user@server.org:/example-source $PWD/example-backup
```

### Add to cron for example

Start editor

```bash
crontab -e
```

Add schedule

```bash
 0 4 * * * /usr/bin/bash start-backup.sh user@server.org:/example-source /example-backup
```
