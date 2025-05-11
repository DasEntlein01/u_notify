# u_notify

🚨 **u_notify** – A standalone notification system with a modern look for FiveM.  
Play custom sounds (MP3 or GTA native) on notifications. Perfect for servers that care about design and usability.

## Features

- 🔔 **Modern NUI-based notifications**
- 🔊 **Custom sound playback** (MP3 URLs or GTA frontend sounds)
- ⚙️ **Easy to configure**
- 🧩 **Standalone – no external dependencies**

## Preview

![u_notify Preview](https://r2.fivemanage.com/FwFyuxmql8jrIawC4jFjD/2025-05-1121-41-46.gif)

## Installation

1. **Clone or download this repository**  
```bash
   git clone https://github.com/DasEntlein01/u_notify.git
```

2. **Add the resource to your `server.cfg`**

```ini
   ensure u_notify
```
3. **Restart your server** (or start the resource)

```bash
   start u_notify
```

## Configuration

Open `client.lua` and adjust the `HUD.Sounds` table to your liking:

```lua
HUD = {
    Sounds = {
        ["Notify"] = {
            mp3    = true,  -- Set to false to use GTA native sound
            url    = "https://yourdomain.com/notify.mp3",
            volume = 0.5,   -- Range: 0.0–1.0
            gta    = {
                audioName = "ATM_WINDOW",
                audioRef  = "HUD_FRONTEND_DEFAULT_SOUNDSET"
            }
        },
    },
}
```

* **mp3**: `true` to play the specified URL, `false` to use the GTA native sound.
* **url**: Web-accessible MP3 link.
* **volume**: Playback volume from 0.0 (silent) to 1.0 (full).
* **gta.audioName / gta.audioRef**: GTA sound identifiers when `mp3 = false`.

## Usage

Trigger notifications in your scripts with:

```lua
TriggerEvent("u_notify:notify", type, message, duration)
```

* `type` (string): Notification style—e.g. `"info"`, `"error"`, `"warning"`, etc.
* `message` (string): The text to display.
* `duration` (number): Display time in milliseconds.

```lua
TriggerEvent("u_notify:notify", "info",    "This is an info message",    5000)
TriggerEvent("u_notify:notify", "error",   "An error occurred!",         5000)
TriggerEvent("u_notify:notify", "warning", "Watch out, something’s off!", 5000)
```

### Example Command

Add a `/testnotify` command to test all three types:

```lua
RegisterCommand("testnotify", function()
    TriggerEvent("u_notify:notify", "info",    "Info notification",    8000)
    TriggerEvent("u_notify:notify", "error",   "Error notification",   8000)
    TriggerEvent("u_notify:notify", "warning", "Warning notification", 8000)
end, false)
```

## License

This project is licensed under the **MIT License**. See [LICENSE](./LICENSE) for details.

## Contributing & Support

Got questions or suggestions? Open an [issue](https://github.com/yourusername/u_notify/issues) or submit a pull request.
Happy coding! 🚀

```
```
