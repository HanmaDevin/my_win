if (!(Test-Path $HOME\AppData\Roaming\Vencord\themes)) {
    mkdir $HOME\AppData\Roaming\Vencord\themes
}

Copy-Item $PWD\Vencord\themes\* $HOME\AppData\Roaming\Vencord\themes
