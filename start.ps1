# Marcelo Silva Assistência Técnica T.I
# Ferramenta Pós-Formatação e Otimização Windows

Clear-Host

function Menu {
    Clear-Host
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "   MARCELO SILVA - ASSISTÊNCIA TÉCNICA T.I   " -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[1] Instalar Programas Essenciais"
    Write-Host "[2] Otimizar Windows"
    Write-Host "[3] Limpeza Completa"
    Write-Host "[4] Plano de Desempenho"
    Write-Host "[5] Criar Ponto de Restauração"
    Write-Host "[6] Atualizar Programas via Winget"
    Write-Host "[7] Abrir WhatsApp da Assistência"
    Write-Host "[0] Sair"
    Write-Host ""
}

do {
    Menu
    $opcao = Read-Host "Escolha uma opção"

    switch ($opcao) {
        "1" {
            irm https://raw.githubusercontent.com/Marcelo021023/marcelo_silva_ti/main/apps.ps1 | iex
            Pause
        }

        "2" {
            irm https://raw.githubusercontent.com/Marcelo021023/marcelo_silva_ti/main/tweaks.ps1 | iex
            Pause
        }

        "3" {
            irm https://raw.githubusercontent.com/Marcelo021023/marcelo_silva_ti/main/cleanup.ps1 | iex
            Pause
        }

        "4" {
            irm https://raw.githubusercontent.com/Marcelo021023/marcelo_silva_ti/main/performance.ps1 | iex
            Pause
        }

        "5" {
            Checkpoint-Computer -Description "Ponto criado pela ferramenta Marcelo Silva T.I" -RestorePointType "MODIFY_SETTINGS"
            Write-Host "Ponto de restauração criado com sucesso!" -ForegroundColor Green
            Pause
        }

        "6" {
            winget upgrade --all --accept-source-agreements --accept-package-agreements
            Pause
        }

        "7" {
            Start-Process "https://wa.me/5511930643891"
            Pause
        }

        "0" {
            Write-Host "Saindo..." -ForegroundColor Yellow
        }

        default {
            Write-Host "Opção inválida!" -ForegroundColor Red
            Pause
        }
    }

} while ($opcao -ne "0")
