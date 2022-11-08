# Create persistent keyboard conf for xorg
Source: https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration
Move 00-keyboard.conf to /etc/X11/xorg.conf.d/00-keyboard.conf

# Creating custom keymap (for tty?)
Source: https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration
Get original from /usr/share/kbd/keymaps/i386/colemak

# mkdir -p /usr/local/share/kbd/keymaps
# vim /usr/local/share/kbd/keymaps/personal.map



# Setup
Put text in colemak+ into file /usr/share/X11/xkb/symbols/us


Add
<configItem>
 <name>colemak-plus</name>
 <!-- Keyboard indicator for Custom layout Colemak plus layouts -->
 <shortDescription>cmp</shortDescription>
 <description>Colemak Plus Custom</description>
</configItem>


to /usr/share/X11/xkb/rules/evdev.xml