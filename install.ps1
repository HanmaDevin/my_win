$packages = @(
    "ajeetdsouza.zoxide",
    "Docker.DockerDesktop",
    "NASM.NASM",
    "sharkdp.bat",
    "Rufus.Rufus",
    "lazygit",
    "vscode",
    "python",
    "direnv",
    "KDE.okular",
    "starship",
    "Valve.steam",
    "Google.chrome",
    "oracle.jdk.23",
    "7-zip",
    "Neovim.Neovim",
    "yan.FFmpeg", 
    "jqlang.jq",
    "sharkdp.fd",
    "BurntSushi.ripgrep.MSVC", 
    "junegunn.fzf", 
    "ImageMagick.ImageMagick"
)

foreach ($package in $packages) {
    Start-Process -NoNewWindow -Wait -FilePath "winget" -ArgumentList "install", $package
}

Write-Output "Installing Wallpapers..."

New-Item -Path "$HOME\Pictures" -Name "Wallpaper" -ItemType "directory"
Copy-Item -Path "$HOME\Windows\Wallpaper\*" -Destination "$HOME\Pictures\Wallpaper"

Write-Output "Done!"

Write-Output "Copying Powershell Profile..."

Copy-Item -Path "$HOME\Windows\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE

Write-Output "Done!"

Write-Output "Configuring Git..."
$username = Read-Host "Enter your Github username: "
git config --global user.name "$username"
$email = Read-Host "Enter your Github email: "
git config --global user.email "$email"
git config --global pull.rebase true

Write-Output "Done!"

Write-Output "Adding ssh key..."

ssh-keygen -t ed25519 -C "$email"

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

ssh-add $HOME/.ssh/id_ed25519

Write-Output "Done!"

Write-Output "Copying Configuration..."

New-Item -Path "$HOME\AppData\Local" -Name "nvim" -ItemType "directory"
Copy-Item -Path -Recurse "$HOME\Windows\nvim\" -Destination "$HOME\AppData\Local\"

New-Item -Path "$HOME\" -Name ".config" -ItemType "directory"
Copy-Item -Path "$HOME\Windows\starship.toml" -Destination "$HOME\.config\"

Write-Output "Done!"