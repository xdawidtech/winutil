# 🖼️ Usunięcie Galerii z Eksploratora
# Usuwa galerię z eksploratora i ustawia Ten Komputer jako domyślną

Write-Host "🔧 Usuwanie galerii z eksploratora..." -ForegroundColor Cyan

try {
    Write-Host "🗑️ Usuwanie klucza rejestru galerii..." -ForegroundColor Yellow
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /f 2>$null
    
    Write-Host "⚙️ Ustawianie Ten Komputer jako domyślnego..." -ForegroundColor Yellow
    REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "LaunchTo" /t REG_DWORD /d "1" 2>$null
    
    Write-Host "✅ Galeria została pomyślnie usunięta z eksploratora!" -ForegroundColor Green
    Write-Host "💻 Eksplorator będzie teraz otwierać Ten Komputer" -ForegroundColor Green
}
catch {
    Write-Host "❌ Błąd podczas usuwania galerii: $($_.Exception.Message)" -ForegroundColor Red
}