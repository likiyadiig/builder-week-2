# status.sh

A bash script that print a one-screen health summary of an Ubuntu droplet.
Single file: status.sh. Uses only commands that come with Ubuntu by default, plus ufw. Nothing needs to be installed to run it.

## Running it

Run ./status.sh on the droplet. There is no build setup and no package manager.

## Style

- Bash, targeting Ubuntu 22.04+. The shebang is #!/bin/bash.
- Output is built from plain echo, in two shapes:
  - The header block uses inline "Label: value" on one line (Date, Uptime, Public IP).
  - Every check after that is a header line ending in a colon, then the raw command output on the following line or lines. Blank echo "" between sections.
- Bodies of if blocks are not indented. Match that when adding a check.
- Any command that can hang gets a timeout. curl uses --max-time, ping uses -W, everything else uses timeout(1).
- Keep the whole output to roughly one screen. It is around 25 lines today; the ps block at the end is the only part that grows.

## Workflow

- Run ./status.sh after every change and show me the real output. A change that has not been run is not finished.
- One logical change per commit. Commit messages that describe intent, not files touched.
- Ask before adding any dependency that needs apt install.
- Never edit or delete anything under /etc/ssh/ or the ufw rules.
- Do not commit .env, *.pem, or id_rsa.
- Do not push to main. Work on a branch and tell me when it is ready for a PR.

## Landmines

- ufw status needs sudo. In a non-interactive session it hangs waiting for a password. Use sudo -n and handle the failure.
- df column positions differ between Ubuntu 20.04 and 22.04. We target 22.04+.
