function GetGameMenuItems() {
    param($getGameMenuItemsArgs)

    if ($getGameMenuItemsArgs.Games.Count -gt 1) {
        return
    }

    if ($getGameMenuItemsArgs.Games[0].Source.Name -ne "Steam") {
        return
    }

    $menuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $menuItem.Description = "Open Steam Backup"
    $menuItem.FunctionName = "OpenSteamBackup"
    return $menuItem
}

function OpenSteamBackup() {
    param($scriptGameMenuItemActionArgs)

    $gameId = $scriptGameMenuItemActionArgs.Games[0].GameId
    Start-Process "steam://backup/$gameId"
}