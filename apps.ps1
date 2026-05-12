Clear-Host

Write-Host "======================================" -ForegroundColor Cyan
Write-Host " INSTALAÇÃO DE PROGRAMAS ESSENCIAIS " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

$apps = @(
    "Google.Chrome"
    "Mozilla.Firefox"
    "Brave.Brave"
    "VideoLAN.VLC"
    "7zip.7zip"
    "RARLab.WinRAR"
    "AnyDeskSoftwareGmbH.AnyDesk"
    "RustDesk.RustDesk"
    "Notepad++.Notepad++"
    "Adobe.Acrobat.Reader.64-bit"
    "Oracle.JavaRuntimeEnvironment"
    "Microsoft.VCRedist.2015+.x64"
    "CrystalDewWorld.CrystalDiskInfo"
    "CPUID.CPU-Z"
    "CPUID.HWMonitor"
    "voidtools.Everything"
    "AntibodySoftware.WizTree"
    "RevoUninstaller.RevoUninstaller"
)

foreach ($app in $apps) {

    Write-Host ""
    Write-Host "Instalando $app ..." -ForegroundColor Yellow

    winget install --id=$app -e --accept-package-agreements --accept-source-agreements

}

Write-Host ""
Write-Host "Instalação concluída!" -ForegroundColor Green

Pause
