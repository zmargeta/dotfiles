#### macOS Manual Configuration Checklist

##### Fonts

- [ ] Install TX-02
- [ ] Install CommitMono
- [ ] Install PragmataPro
- [ ] Install Operator Mono
- [ ] Install Nerd Font (Symbols Only)

##### 1Password

- General > Keyboard shortcuts
  - [ ] Show Quick Access: ⌥ ⌘ P
- Appearance
  - [ ] Density: Comfortable
- Security > Unlock
  - [ ] Enable Touch ID
  - [ ] Require password: Never
- Privacy > Watchtower
  - [ ] Enable Check for vulnerable passwords
- Browser
  - [ ] Enable Connect with 1Password in the browser
- Developer
  - SSH Agent
    - [ ] Enable Use the SSH agent
  - Command-Line Interface (CLI)
    - [ ] Enable Connect with 1Password CLI

##### Dotfiles

- [ ] `bash -c "$(curl -fsSL https://raw.githubusercontent.com/zmargeta/dotfiles/main/install)"`

##### Leader Key

- Advanced
  - [ ] Config directory: ~/.config/leader-key
- General
  - [ ] Shortcut: ⌘ Space
  - [ ] Enable App Launch at login

##### Raycast

- General
  - [ ] Raycast Hotkey: ⌥ Space
  - [ ] Disable Show Raycast in menu bar
- Extensions > Window Management
    - [ ] Gap: Tiny (8px)
    - [ ] Enable Respect Stage Manager
    - [ ] Almost Maximise > Percentage: 70%
- Account
  - [ ] Log In with Apple Account
- Advanced
  - [ ] Emoji skin tone: White

##### Hyperkey

- [ ] Enable Remap physical key to hyper key: caps lock
- [ ] Enable Quick press caps lock to execute: Esc
- [ ] Enable Launch on login
- [ ] Enable Check for updates automatically

##### System Settings

- Apple ID
  - iCloud
    - [ ] Disable Contacts
    - [ ] Disable Calendars
  - iCloud Drive > Apps Syncing to iCloud Drive > Options
    - [ ] Select Desktop & Documents Folders
    - [ ] Deselect iMovie
    - [ ] Deselect Mail
- General > Software Update > Automatic Updates
  - [ ] Enable Install macOS updates
  - [ ] Enable Install application updates from the App Store
- Appearance
  - [ ] Accent colour: Blue
- Control Centre > Menu Bar Only
  - [ ] Spotlight: Don't Show in Menu Bar
- Privacy & Security > Privacy > Accessibility
    - [ ] Enable Raycast
- Desktop & Dock
  - [ ] defaults write com.apple.dock 'tilesize' -int '48' && killall Dock
  - [ ] Position on screen: Right
  - [ ] Minimise windows using: Scale Effect
  - [ ] Enable Minimise windows into application icon
  - [ ] Enable Automatically hide and show the Dock
  - [ ] Disable Animate opening applications
  - [ ] Disable Show recent applications in Dock
  - [ ] Disable Stage Manager
  - [ ] Disable Show recent apps in Stage Manager
  - [ ] Disable Displays have separate Spaces in Mission Control
  - [ ] Enable Group windows by application in Mission Control
- Touch ID & Password
  - [ ] Enable Apple Watch
- Wallet & Apple Pay
  - [ ] Add cards
- Keyboard > Keyboard shortcuts
  - Services > Text
    - [ ] Disable Search man Page Index in Terminal
  - Spotlight
    - [ ] Disable Show Spotlight search
    - [ ] Disable Show Finder search window
  - Function Keys
    -  [ ] Enable Use F1, F2, etc. keys as standard function keys
- Trackpad > Point & Click
  - [ ] Tracking speed: Max 

##### Finder

- General
  - [ ] New Finder windows show: $HOME
- Sidebar
  - [ ] Disable Recents
- Advanced
  - [ ] Enable Keep folders on top in windows when sorting by name
  - [ ] When performing a search: Search the current folder
- View > Show View Options
  - [ ] Enable Always open in icon view
  - [ ] Sort by: Name
  - [ ] Click Use as defaults

##### Safari

- General
  - [ ] Safari opens with: All windows from last session
  - [ ] Homepage: about:blank
  - [ ] Disable Open safe files after downloading
- Tabs
  - [ ] Tab layout: Compact
- Autofill
  - [ ] Disable every entry

##### JetBrains Toolbox

- [ ] Enable Update all tools automatically
- [ ] Disable Keep previous versions of tools to enable instant rollback
- [ ] Set Shell scripts location to Homebrew bin folder

##### Dock Icon Order

- Finder
- Safari
- Mail
- Todoist
- Obsidian
- Music
- App Store

