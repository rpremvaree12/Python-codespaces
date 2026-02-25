# Run Python GUI inside GitHub Codespaces

This repository provides setup scripts and examples that make it possible to run Python GUI applications inside GitHub Codespaces.

It uses:

- Xvfb: to create a virtual display in a headless environment
- noVNC: to stream the desktop directly in your browser

This is especially useful for running and testing GUI libraries like Pygame, CMU Graphics, Tkinter, or other Python GUI frameworks inside Codespaces.

## What's in this repo

`.devcontainer/`
This folder tells Codespaces how to set up your environment automatically when you open the repo. It installs all the necessary packages, starts the virtual display, and makes sure port 6080 is forwarded so you can view your GUI in the browser — all without any manual steps.

`.start-gui.sh`
A shell script that starts the virtual desktop manually. You won't need this if you're using Codespaces (the devcontainer handles it), but it's useful if you want to restart the display without rebuilding your environment.

## Getting Started

Fork or clone this repo and open it in a Codespace. The environment will configure itself automatically using the included `.devcontainer` setup — no manual installation needed.

Once the Codespace finishes loading:

1. Port `6080` should appear automatically in the **Ports** tab and open in your browser. If it doesn't, manually add port `6080`, set its visibility to **Public**, and open the URL.
2. If the GUI desktop hasn't loaded, click `vnc.html` or `vnc_auto.html` on the noVNC page.
3. Open a new terminal in your Codespace and run your script:
```bash
python3 your_script.py
```

4. Switch to the noVNC browser tab to see your GUI output.

## Environment Variables

The following environment variables are set automatically by the devcontainer, so you don't need to export them manually:

- `DISPLAY=:1` — points your script to the virtual display
- `SDL_VIDEODRIVER=x11` — ensures pygame and SDL-based libraries use the correct driver

If you ever open a terminal outside the devcontainer context and your GUI won't display, run:
```bash
export DISPLAY=:1
export SDL_VIDEODRIVER=x11
```

## Notes

- ALSA audio warnings can be ignored — Codespaces doesn't provide sound output.
- Press ESC or close the window in the GUI tab to exit your app cleanly.
- You can adapt this setup for any GUI toolkit, not just Pygame.