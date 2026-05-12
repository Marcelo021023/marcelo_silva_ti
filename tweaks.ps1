Clear-Host

Write-Host "======================================" -ForegroundColor Cyan
Write-Host " OTIMIZAÇÃO DO WINDOWS " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Criando ponto de restauração..." -ForegroundColor Yellow

Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "Antes das Otimizacoes Marcelo TI" -RestorePointType "MODIFY_SETTINGS"

Write-Host ""
Write-Host "Aplicando Tweaks..." -ForegroundColor Yellow

# Desativar Telemetria
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord -Force

# Desativar Apps em Segundo Plano
Get-ChildItem "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" | ForEach-Object {
    Set-ItemProperty $_.PsPath Disabled -Value 1 -Force
}

# Remover Widgets
winget uninstall "windows web experience pack"

# Desativar Recomendações Menu Iniciar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations /t REG_DWORD /d 0 /f

# Mostrar Extensões de Arquivos
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

# Ativar Modo Escuro
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f

# Desativar Copilot
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f

# Limpeza Temp
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "Tweaks aplicados com sucesso!" -ForegroundColor Green

Pause
