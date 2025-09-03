# Omarchy Display Tools

A collection of safe and simple scripts to manage displays in the Omarchy/Hyprland environment. This suite provides keyboard shortcuts for toggling individual monitors and a robust `systemd` service for automatic power management when closing the laptop lid.

Created by **Daury Dicaprio** ([daurydicaprio.com](https://daurydicaprio.com)) | Official Omarchy Website: [omarchy.org](https://omarchy.org)

---

### 📋 How to Use

Once installed, this suite provides two main functionalities:

#### **1. Automatic Lid Control**
-   **Close your laptop lid:** The laptop screen will automatically turn off with a notification.
-   **Open your laptop lid:** The laptop screen will automatically turn back on.

#### **2. Manual Monitor Toggle (Keyboard Shortcuts)**
-   Press **`Super + Ctrl + D`** to toggle your primary (laptop) monitor on and off.
-   Press **`Super + Ctrl + F`** to toggle your external monitor on and off.

*You can customize these shortcuts by editing `~/.config/hypr/bindings.conf`.*

---

### ✨ Features

*   **Safe Monitor Toggle:** A safety check prevents you from disabling your last active display.
-   **Reliable Lid Management:** A persistent `systemd` service directly monitors the lid state for instant and reliable actions.
-   **Clean & Independent:** Installs as separate user scripts, respecting the Omarchy philosophy of keeping base files untouched.

### 💡 Use Cases

*   **Monotasking Focus:** Instantly turn off your secondary monitor to focus on a single task.
*   **"Clamshell" Mode:** Use your laptop with the lid closed, connected to an external monitor.
*   **Desktop Focus:** Keep your laptop on the desk but turn off its screen to create a cleaner workspace.

---

### 🚀 Quick Install

1.  **Clone the Repository:**
    ```sh
    git clone https://github.com/daurydicaprio/omarchy-monitor-toggle.git
    cd omarchy-monitor-toggle
    ```

2.  **Make Scripts Executable:**
    ```sh
    chmod +x install.sh toggle-monitor lid-manager
    ```

3.  **Run the Installer:**
    ```sh

    ./install.sh
    ```

After installation, **Reload Hyprland** to activate all features.

---

### 🔧 Prerequisite: `logind.conf`

For the automatic lid control to work, your system must not suspend when the lid is closed. You need to tell `systemd-logind` to ignore the event.

1.  Edit the file: `sudo nano /etc/systemd/logind.conf`.
2.  Change or add the line: `HandleLidSwitch=ignore`.
3.  Save the file and **reboot**.

---

### 📜 License

This project is licensed under the MIT License.

---

#VERyGoodforlife
