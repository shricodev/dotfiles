## Custom Scripts

This repo holds some of my custom build scripts. My custom functions and aliases are all in my [dotfiles](https://github.com/shricodev/dotfiles.git) repository.

### Root Cron jobs

Cron job for the `root` user.

```bash
# m h dom mon dow
@reboot (sleep 3; echo 18 > /sys/class/backlight/nvidia_0/brightness) &

# First day of every month at 4:30 pm
30 16 1 * * /usr/bin/trash-empty --all-users -f

# Every Sunday at 4pm
0 16 * * 0 /usr/bin/reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

### User Cron jobs

Cron job for regular user with `sudo` privilege.

```bash
# m h dom mon dow

# Run every 3 hour
0 */3 * * * /bin/bash /home/shricodev/bin/gnome-change-wallpaper

# Run every Sunday at 4pm
0 16 * * 0 XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -t 10000 "Time for System Update?" "It's time to update the Arch system."
```
