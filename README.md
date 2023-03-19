![Steam Deck](assets/steamdeck.svg)

# Steam Deck Optimization Guide

This guide contains descriptions of settings and utilities for safely improving the performance, and useful information for advanced Steam Deck users.

---

- [Basic](#basic)
  - [Gaming Mode](#gaming-mode)
  - [Desktop Mode](#desktop-mode)
  - [Switch Modes](#switch-modes)
  - [Shortcuts](#shortcuts)
- [Pre-Settings](#pre-settings)
  - [Developer Mode](#developer-mode)
  - [Beta Channel](#beta-channel)
  - [Root Password](#root-password)
  - [Enable SSH](#enable-ssh)
- [Homebrew](#homebrew)
  - [Decky](#decky)
- [Tweaks](#tweaks)
  - [CryoUtilities](#cryoutilities)
  - [VRAM](#vram)
  - [BTRFS](#btrfs)
  - [40 FPS/Hz](#40-fpshz)
  - [GE-Proton](#ge-proton)
  - [In-Game Settings](#in-game-settings)
- [References](#references)

---

## Basic

### Gaming Mode

This is an optimized mode for launching your games, similar to Big Picture on PC.

![Steam Deck Gaming Mode](assets/basic-gaming-mode.jpg) 

---

### Desktop Mode

In this mode, SteamOS is installed (based on the [Arch Linux](https://archlinux.org/) distribution with [KDE Plasma](https://kde.org/plasma-desktop/) as the desktop environment), and you have the full PC experience — connect keyboard/mouse/devices, install any apps, use a console, and many more...

![Steam Deck Desktop Mode](assets/basic-desktop-mode.jpg)

---

### Switch Modes

By default, your Steam Deck loads on `Gaming Mode`.

To switch to `Desktop Mode`, follow these steps:
1. Press the <kbd>Steam</kbd> button and select `Power`
2. Scroll and click `Switch to Desktop`
3. Restart your Steam Deck when prompted

![Switch Mode on Steam Deck](assets/basic-switch-mode.jpg)

To return to `Gaming Mode`: 
- Restart your Steam Deck
- Double-click the `Return to Gaming Mode` icon on Desktop

---

### Shortcuts

To show the keyboard on `Desktop Mode` and `Gaming Mode`, use the <kbd>Steam</kbd> + <kbd>X</kbd> button combination.

> Hold the <kbd>Steam</kbd> button on `Gaming Mode` to see a list of all available shortcuts.

---

## Pre-Settings

### Developer Mode

First, to install homebrew apps, you need to enable `Developer Mode`:
1. Switch your Steam Deck to `Gaming Mode`
2. Press <kbd>Steam</kbd> button and select `Settings`
3. Scroll down and click `Developer`
4. Enable `Developer Mode`
5. Scroll down and enable `CEF Remote Debugging`
6. Restart your Steam Deck when prompted

![Enabled Developer Mode on Steam Deck](assets/settings-dev-mode.jpg)

---

### Beta Channel

Now, one thing you are going to want to do is move to the beta channel. The reason is that Valve is constantly pushing out updates and new features (like a stable 40 FPS now, and many more), and being in the beta channel ensures you get all the latest updates as they're released.

To enable the `Beta Channel`, follow these steps:
1. Switch your Steam Deck to `Gaming Mode`
2. Press <kbd>Steam</kbd> button and select `Settings`
3. Scroll up and click `System`
4. Change `System Update Channel` to `Beta`
5. Change `OS Update Channel` to `Steam Deck Beta`
6. Restart your Steam Deck when prompted

![Change update channel on Steam Deck](assets/settings-beta-channel.jpg)

---

### Root Password

By default, the Steam Deck user is shipped with no password. This is a secure setting that prevents access via SSH and can't be used to run commands via `sudo` for installing homebrew apps.

To set the password, follow these steps:
1. Switch your Steam Deck to `Desktop Mode`
2. Open the application menu and select `System`
3. Run the `Konsole` app

Type this command and hit <kbd>Enter</kbd>:
```shell
passwd
```

Type your new password (*typed characters do not appear on the screen!*) and hit <kbd>Enter</kbd>. After retyping the password, hit <kbd>Enter</kbd> again.

![Set Root Password on Steam Deck](assets/settings-root-password.jpg)

---

### Enable SSH

SSH allows you to remotely interact with your Steam Deck, so you can transfer games from another Windows/MacOS/Linux computer directly to your Steam Deck. You can also do helpful things like install mods, manage game configs, keep tabs on running processes, and other fun maintenance things.

To enable SSH, follow these steps:
1. Switch your Steam Deck to `Desktop Mode`
2. Open the application menu and select `System`
3. Run the `Konsole` app

This would make the SSH server start at boot:

```shell
sudo systemctl enable sshd
```

After that, run this command to start the server immediately:

```shell
sudo systemctl start sshd
```

Now, on your computer, you should be able to access your Steam Deck terminal with this command and type password:

```shell
ssh deck@steamdeck.local
```

> **Note**: If your router is not catching up with the domain name, you must type the Steam Deck's IP address manually instead of the `steamdeck.local`.
> 
> You can easily check the IP address by typing `ip addr` on the `Konsole` app.

---

## Homebrew

### Decky

> Decky Loader is a homebrew plugin launcher for the Steam Deck. It can be used to stylize your menus, change system sounds, adjust your screen saturation, change additional system settings, and more.

[![](https://flat.badgen.net/badge/icon/decky-loader?icon=github&label)](https://github.com/SteamDeckHomebrew/decky-loader)

To install `Decky`:
1. Switch your Steam Deck to `Desktop Mode`
2. Open `Firefox` and go to [https://deckbrew.xyz](https://deckbrew.xyz)
3. Download the `.desktop` file into your Desktop
4. Double-click the `Install Decky` icon on Desktop
5. Enter your password when prompted

Alternatively, you can install `Decky` via console:

```shell
curl -L https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/install_release.sh | sh
```

...and go to `Decky`:
1. Switch your Steam Deck to `Gaming Mode`
2. Press the <kbd>...</kbd> button
3. Select `Decky`
4. Install plugins <sup>[preview](https://beta.deckbrew.xyz)</sup>

![Decky](assets/homebrew-decky.jpg)

Recommended plugins:
- `vibrantDeck` — adjust color settings
- `DeckSettings` — browse recommended game settings
- `HLTB for Deck` — show game lengths according to [HowLongToBeat](https://howlongtobeat.com)
- `ProtonDB Badges` — show tappable [ProtonDB](https://www.protondb.com) badges on your game pages

---

## Tweaks

These are basic settings for additional optimization.

### CryoUtilities

> Scripts and utilities to enhance the Steam Deck experience — swap tuner, memory parameters and storage manager optimized.

[![](https://flat.badgen.net/badge/icon/steam-deck-utilities?icon=github&label)](https://github.com/CryoByte33/steam-deck-utilities)

<details>
  <summary>Compare results:</summary>

  ![CryoUtilities compare](assets/tweaks-cryoutilities-compare.png)
</details>

To install `CryoUtilities`:
1. Switch your Steam Deck to `Desktop Mode`
2. Open `Firefox` and go to [https://github.com/CryoByte33/steam-deck-utilities#install](https://github.com/CryoByte33/steam-deck-utilities#install)
3. Download the `.desktop` file into your Desktop
4. Double-click `Install CryoUtilities` icon on Desktop

Alternatively, you can install `CryoUtilities` via console:

```shell
curl -L https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/install.sh | sh
```

And run the `CryoUtilities` installer:
1. Open the application menu and select `Utilities`
2. Run the `CryoUtilities` app
3. Enter your password when prompted
4. Select `Recommended Settings`

![CryoUtilities](assets/tweaks-cryoutilities.jpg)

---

### VRAM

By default, the Steam Deck uses 1GB of VRAM. This means the CPU will use the remaining 15GB of RAM. The GPU can use more than the 1GB reserved, but priority will always be given to the CPU.

<details>
  <summary>Compare results:</summary>

   ![Steam Deck with 4Gb VRAM](assets/tweaks-vram-compare.png)
</details>

To change the VRAM size needed to run UEFI (aka BIOS):
1. Turn off your Steam Deck
2. Hold the <kbd>Volume Up (+)</kbd> and <kbd>Power</kbd> buttons
3. Wait for UEFI to load
4. Click `Setup Utility` icon
5. Click `Advanced` tab
6. Scroll down and select `UMA Frame buffer Size`
7. Set it to `4GB`
8. Click `Save and Exit`

![Steam Deck UEFI](assets/tweaks-vram.jpg)

> 🔴 Games not compatible with this setting:
> 
> - **Red Dead Redemption 2**

----

### BTRFS

> Btrfs with its transparent compression and deduplication capabilities can achieve impressive storage gains but also improve loading times because of less data being read. It also supports instant snapshotting which is very useful to roll back to a previous state.

[![](https://flat.badgen.net/badge/icon/steamos-btrfs?icon=gitlab&label)](https://gitlab.com/popsulfr/steamos-btrfs)

<details>
  <summary>Compare results:</summary>

  ![Steam Deck with 4Gb VRAM](assets/tweaks-btrfs-compare.jpg)
</details>

> ⚠️ **Warning**: Before installation **read all information on the repo** about this tweak and potential problems like a free space available, and can't go back to ext4 after the conversion process, flatpak issues...

To install `SteamOS-Btrfs`:
1. Switch your Steam Deck to `Desktop Mode`
2. Open `Firefox` and go to [https://gitlab.com/popsulfr/steamos-btrfs#desktop-installer](https://gitlab.com/popsulfr/steamos-btrfs#desktop-installer)
3. Download the `.desktop` file into your Desktop
4. Double-click this icon on Desktop
5. Enter your password when prompted
6. When your Steam Deck reboots wait the conversion process will end (it's not frozen! **don't reboot!**)

Alternatively, you can install `SteamOS-Btrfs` via console:

```shell
t="$(mktemp -d)"
curl -sSL https://gitlab.com/popsulfr/steamos-btrfs/-/archive/main/steamos-btrfs-main.tar.gz | tar -xzf - -C "$t" --strip-components=1
"$t/install.sh"
rm -rf "$t"
```

---

### 40 FPS/Hz

Although 60 FPS provides the best gaming experience, it's not always feasible due to the game's inability to sustain it or the draining of battery life. In such cases, a lower option like 30 FPS is preferred. While 40 FPS may appear closer to 30 FPS, it's not the case. A 60 FPS game refreshes every 16.7 ms, a 30 FPS game refreshes every 33.3 ms, and a 40 FPS game refreshes every 25 ms.

By doing the math, one can see that 40 FPS is precisely in the middle between 30 and 60 FPS. The quicker a game updates, the more improvement there is in input lag, leading to a smoother visual experience. <sup>[Digital Foundry Test](https://www.youtube.com/watch?v=GF8NzlBiaOM)<sup>

To set the `Framerate Limit`:
1. Switch your Steam Deck to `Gaming Mode`
2. Press the <kbd>...</kbd> button
3. Select `Perfomance`
4. Scroll down and set the `Framerate Limit` to `40`
5. Set the `Refresh Rate` to `40`

![Force 40 FPS on Steam Deck](assets/tweaks-40fps.jpg)

---

### GE-Proton

> GE-Proton is a bleeding-edge version of Steam's Proton. It adds many patches and fixes ahead of main Proton releases.

> ProtonUp-Qt is a simple and great way to manage the likes of GE-Proton (previously known as Proton GE), the Luxtorpeda compatibility tool for Native Linux game engines and more.

Install `ProtonUp-Qt`:
1. Switch Steam Deck on `Desktop Mode`
2. Open application menu and select `Utilities`
3. Run `Discover` app
4. Type on searchbox `proton`
5. Select `ProtonUp-Qt` and click `Install`
6. Open application menu and select `Utilities`
7. Run `ProtonUp-Qt` app
8. Click `Add version`, select latest version, and click `Install`

![ProtonUp-Qt](assets/tweaks-ge-proton-app-01.jpg)

Now, if you need to change the Proton version for a game, you can do so in three ways.

Via the `ProtonUp-Qt` app:

![Change Proton version on ProtonUp-Qt](assets/tweaks-ge-proton-app-02.jpg)

> ⚠️ **Warning**: Close the Steam app before changes!

...or change via the `Steam` app: 

![Change Proton version on Steam](assets/tweaks-ge-proton-steam-01.jpg)

...or change on `Gaming Mode`: 

![Change Proton version on Steam](assets/tweaks-ge-proton-steam-02.jpg)

---

### In-Game Settings

#### ● Anti-Aliasing

If possible, set it to FXAA or TAA. SSAA or MSAA are mostly not recommended because they consume a lot of power.

#### ● Screen Space Reflections

Reduce all reflections to the lowest possible settings. They are usually expensive to process.

#### ● Ambient Occlusion

This one is a bit tricky, as it is heavily dependent on the algorithm used. Try playing with the settings to see what works best for your game.

#### ● Tessellation

Turn it off, as many game engines and developers misuse it, causing a lot of stress on the GPU. It won't be missed on an 800p screen.

#### ● Shadows

Shadows can also be very resource-intensive, depending on how they are rendered. This is another setting you should try lowering first.

---

## References

Official:
- [Steam Deck Support](https://help.steampowered.com/en/wizard/HelpWithSteamDeck)
- [Steam Deck FAQ](https://www.steamdeck.com/en/faq)
- [Steamworks Steam Deck FAQ](https://partner.steamgames.com/doc/steamdeck/faq)

Community:
- [CryoByte33 FAQ](https://github.com/CryoByte33/steam-deck-utilities/blob/main/docs/faq.md)
- [r/SteamDeck](https://www.reddit.com/r/SteamDeck)
- [PCGamingWiki](https://www.pcgamingwiki.com/wiki/Steam_Deck)
- [Steam Deck Guide](https://github.com/mikeroyal/Steam-Deck-Guide)

---

<sub>Steam Deck illustration created by [ApeWTF](https://ape.wtf/). All screenshots from opened internet resources. All rights reserved.</sub>
