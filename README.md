# Omarchy Display Tools

A collection of safe and simple scripts to manage displays in the Omarchy/Hyprland environment. This suite provides keyboard shortcuts for toggling individual monitors and a robust `systemd` service for automatic power management when closing the laptop lid.

Created by **Daury Dicaprio** ([daurydicaprio.com](https://daurydicaprio.com)) | Official Omarchy Website: [omarchy.org](https://omarchy.org)

---

### ✨ Features

*   **Safe Monitor Toggle:** Use keyboard shortcuts to turn monitors on/off. A safety check prevents you from disabling your last active display.
*   **Reliable Lid Management:** A persistent `systemd` service directly monitors the lid state, providing instant, non-stacking notifications and safe power management.
*   **Clean & Independent:** Installs as separate user scripts and services, respecting the Omarchy philosophy of keeping base files untouched.

### 💡 Use Cases

This tool is ideal for users who need flexible display management:

*   **Monotasking Focus:** Instantly turn off your secondary monitor to focus on a single task on your main display.
*   **"Clamshell" Mode:** Place your laptop under the desk and use only your external monitor. This tool allows you to safely turn off the laptop screen.
*   **Desktop Focus:** Keep your laptop on the desk but turn off its screen to create a cleaner, less distracting workspace.

---

### 🚀 Quick Install

1.  **Clone the Repository:**
    ```sh
    git clone https://github.com/daurydicaprio/omarchy-monitor-toggle.git
    cd omarchy-monitor-toggle
    ```

2.  **Make Scripts Executable:**
    (This ensures the scripts have the correct permissions after cloning)
    ```sh
    chmod +x install.sh toggle-monitor lid-manager
    ```

3.  **Run the Installer:**
    ```sh
    ./install.sh
    ```

After installation, **Reload Hyprland** (`Super + M` > `Reload`) to activate all features.

---

### 🔧 Prerequisite: `logind.conf`

For the automatic lid close detection to work reliably, your system must not suspend or hibernate when the lid is closed. You need to tell `systemd-logind` to pass the event to the desktop environment.

1.  Edit the file with `sudo nano /etc/systemd/logind.conf`.
2.  Find the line `#HandleLidSwitch=suspend` and change it to:
    ```
    HandleLidSwitch=ignore
    ```
3.  Save the file and **reboot** your system for the change to take effect.

---

### 📜 License

This project is licensed under the MIT License.

---

#VERyGoodforlife
