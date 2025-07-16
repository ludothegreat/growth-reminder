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
function daily_nudge() {
  local msg=("Ship something ugly today."
             "Teach one thing you learned."
             "Push your README before your code."
             "Ask a question publicly.")
  echo -e "\n🔥 ${msg[$RANDOM % ${#msg[@]} + 1]}"
}
daily_nudge
