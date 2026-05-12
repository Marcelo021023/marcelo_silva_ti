Clear-Host

Write-Host "======================================" -ForegroundColor Cyan
Write-Host " LIMPEZA COMPLETA DO SISTEMA " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Limpando arquivos temporários..." -ForegroundColor Yellow

Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "Limpando cache DNS..." -ForegroundColor Yellow

ipconfig /flushdns

Write-Host ""
Write-Host "Executando limpeza de disco..." -ForegroundColor Yellow

cleanmgr /sagerun:1

Write-Host ""
Write-Host "Limpando cache do Windows Update..." -ForegroundColor Yellow

net stop wuauserv
Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
net start wuauserv

Write-Host ""
Write-Host "Verificando integridade do Windows..." -ForegroundColor Yellow

sfc /scannow

Write-Host ""
Write-Host "Limpeza concluída com sucesso!" -ForegroundColor Green

Pause
