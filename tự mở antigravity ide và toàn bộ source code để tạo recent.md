```sh
Get-ChildItem "C:\xampp\htdocs" -Directory | ForEach-Object {

    $p = Start-Process antigravity-ide.cmd $_.FullName -PassThru

    Start-Sleep -Seconds 5

    $p.CloseMainWindow()

    Start-Sleep -Seconds 2

    if (!$p.HasExited) {
        Stop-Process -Id $p.Id -Force
    }

    Start-Sleep -Seconds 1

}
