# A function to update discord on Debian

Updating discord is annoying. Initially, this script automated the process. Now, it also checks headers, so that it can be added to a crontab or similar, and it only downloads the ~100 Mb discord file if it is indeed new.

## Usage

**Download and execute**

```sh
$ curl https://git.nunosempere.com/NunoSempere/update_discord/raw/branch/master/update_discord.sh -o update_discord.sh
$ cat update_discord.sh
$ bash update_discord.sh
```

**Add to .bashrc**

You might also want to add the contents of update_discord.sh to your `.bashrc` file or similar.

**Usage in cron**

I think this is how you would add this to a crontab: 

```
$ sudo crontab -e
# Then, inside the crontab
8 * * * * bash /download_path/update_discord.sh
```

However, I haven't tested this yet with a new update

## Stack

- curl
- apt—implying Debian or derivatives
- bash


## Security posture

Total disregard. If you automatically download discord updates, if they are compromised you would have no warning.
