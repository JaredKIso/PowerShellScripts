### Needed assets for the script !! DO NOT TOUCH !!
# Add-Type -AssemblyName "System.ServiceProcess"
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
# $wshell = New-Object -ComObject wscript.shell;

#$signature=@'       ### This is not needed
#[DllImport("user32.dll",CharSet=CharSet.Auto,CallingConvention=CallingConvention.StdCall)]     ### This is not needed
#public static extern void mouse_event(long dwFalgs, long dx, long dy, long cButtons, long dwExtraInfo);     ### This is not needed
#'@     ### This is not needed
### ABOVE ARE NEEDED ASSETS FOR THE SCRIPT !! DO NOT TOUCH !!

# Global Variables
$mousePos1x = 434
$mousePos1y = 443

$mousePos2x = -267
$mousePos2y = -1025

# $getMousePos = 3 # This is in seconds

$moveMouseTimer = 5 # This is in seconds and the main one you will edit
###

$timeslooped = 0 
Write-Host -ForegroundColor Red 'Press "ctrl + c" to exit...'
Start-Sleep -Seconds 5
while (1)
{
    Start-Sleep -Seconds $moveMouseTimer
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($mousePos1x, $mousePos1y)
    $timeslooped++
    Write-Host -ForegroundColor Green "$timeslooped times moved..."
    Start-Sleep -Seconds $moveMouseTimer
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($mousePos2x, $mousePos2y)
    $timeslooped++
    Write-Host -ForegroundColor Green "$timeslooped times moved..."
    Write-Host -ForegroundColor Red 'Press "ctrl + c" to exit...'

} until ([System.Console]::KeyAvailable)




# ==== Code to get pos you can ignore this ==== #

    ## Get cursor current position, not needed but is helpful
    # Start-Sleep -Seconds $getMousePos
    # $SendMouseClick = Add-Type -memberDefinition $signature -name "Win32MouseEventNew" -namespace Win32Functions -PassThru     ### This is not needed
    # $X = [System.Windows.Forms.Cursor]::Position.X
    # $Y = [System.Windows.FOrms.Cursor]::Position.Y
    # Write-Output "X: $X | Y: $Y"

# ==== Code to get pos you can ignore this ==== #