New-Item -Path "$HOME\Pictures" -Name "Wallpaper" -ItemType "directory"
Copy-Item -Path ".\Wallpaper\*" -Destination "$HOME\Pictures\Wallpaper"
