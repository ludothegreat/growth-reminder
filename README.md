# Growth Reminder System

A simple, self-contained productivity system built into the terminal to fight perfectionism, stay consistent, and remind myself to ship, share, and grow daily — even when motivation runs dry.

## What This Is

This repo contains:
- ZSH-based terminal prompts
- Daily desktop notifications (via `cron`)
- Recurring CLI task reminders (via `Taskwarrior`)
- Philosophy, mindset, and automation patterns to keep me accountable

It’s designed for hackers, sysadmins, developers, and anyone who wants to build consistent momentum — especially those with ADHD, burnout, or a tendency to get lost in the weeds.

---

## Features

### Terminal-Based Nudges (`.zshrc`)

Random growth prompts appear every time I open a terminal. These are short reminders to publish something, teach something, or just stop tweaking and ship.

Example snippet:
```zsh
# Growth Reminder
function growth_reminder() {
echo -e "\n Reminder: SHIP SOMETHING TODAY\n- Push a script\n- Write a 2-sentence README\n- Post a failure\n"
}
growth_reminder

function daily_nudge() {
local msg=("Document one command you used today"
"Ship a broken idea"
"Refactor something then share it"
"Push your README-first project"
"Record a 60s terminal walkthrough"
"Ask a question in public")
echo -e "\n ${msg[$RANDOM % ${#msg[@]} + 1]}"
}
daily_nudge
```

---

### Daily Notifications (`cron` + `notify-send`)

Sends a desktop notification every day at 11 AM (adjustable) to snap me out of “tweak mode.”

#### Install `cronie` if needed:
```bash
sudo pacman -S cronie
sudo systemctl enable --now cronie.service
```

#### Cron entry:
```cron
0 11 * * * /home/<your-username>/scripts/remind-growth.sh
```

#### Example script (`remind-growth.sh`):
```bash
#!/bin/bash
notify-send "GROWTH CHECK" "Ship something today. Don’t polish it. Push it broken if you have to."
```

---

### Taskwarrior Recurring Prompts

Tracks recurring self-growth actions inside my terminal-based task manager.

#### Install `Taskwarrior` if needed: 
```bash
sudo pacman -S task taskwarrior-tui
```

#### Example:
```bash
task add "Post a raw idea or script" recur:daily due:tomorrow +devblog
```

View with:
```bash
task +devblog
```

---

## Mindset Rules

These drive the system:
- **Perfection is procrastination.**
- **Real artists ship.**
- **Push broken things.**
- **Teach through transparency.**
- **You’re not a gatekeeper. You’re a bridge.**

“Don't wait to feel ready. Build systems that act when you won't.”
