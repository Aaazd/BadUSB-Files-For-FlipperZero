$ps=netsh wlan show profiles|Select-String "Profil Tous les utilisateurs\s+:\s+(\S+)"|ForEach-Object {$_.Matches.Groups[1].Value}
foreach($p in $ps){$o = netsh wlan show profile name="$p" key=clear|Select-String "Contenu de la clé\s+:\s+(.+)"
if($o){$pw = $o.Matches.Groups[1].Value;Write-Output "SSID: $p";Write-Output "Password: $pw`n"}}
