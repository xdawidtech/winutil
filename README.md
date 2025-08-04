# Automatyczna Instalacja Windows z Optymalizacją i Prekonfiguracją

Ten projekt zawiera zaawansowany plik `autounattend.xml`, który umożliwia automatyczną instalację systemu Windows wraz z jego kompleksową optymalizacją, usunięciem niechcianych komponentów oraz dostosowaniem wyglądu i działania systemu operacyjnego. Projekt wykorzystuje szereg skryptów PowerShell, VBScript oraz XML do wykonania modyfikacji w trakcie instalacji oraz przy pierwszym logowaniu użytkownika.

---

## 📑 Spis Treści

- [Wprowadzenie](#wprowadzenie)
- [Wymagania](#wymagania)
- [Instalacja](#instalacja)
- [Funkcjonalności](#funkcjonalności)
- [Struktura Plików](#struktura-plików)
- [Konfiguracja](#konfiguracja)
- [Użytkownicy i Logowanie](#użytkownicy-i-logowanie)
- [Instalacja Dodatkowego Oprogramowania](#instalacja-dodatkowego-oprogramowania)
- [Przykłady](#przykłady)
- [Problemy i Rozwiązania](#problemy-i-rozwiązania)
- [Autorzy](#autorzy)
- [Licencja](#licencja)

---

## 🧾 Wprowadzenie

Plik `autounattend.xml` został zaprojektowany w celu zautomatyzowania instalacji systemu Windows (np. Windows 11/10), eliminując konieczność interwencji użytkownika. Dodatkowo system zostaje zoptymalizowany pod kątem wydajności, prywatności i ergonomii poprzez skrypty wykonywane w różnych fazach instalacji.

---

## 🛠️ Wymagania

- System Windows w wersji obsługującej plik `autounattend.xml` (Windows 10, 11 – edycje Pro lub wyższe)
- Nośnik instalacyjny z możliwością modyfikacji (np. pendrive z obrazem ISO)
- Architektura: x64 (amd64)

---

## ⚙️ Instalacja

1. Skopiuj plik `autounattend.xml` do głównego katalogu instalacyjnego nośnika USB z Windows.
2. Upewnij się, że folder `C:\Windows\Setup\Scripts\` zawiera wszystkie skrypty i pliki XML wymienione w sekcji poniżej.
3. Podłącz pendrive do komputera i uruchom instalację z tego nośnika.
4. Instalacja przebiegnie automatycznie – w tle wykonywane będą skrypty konfiguracyjne.

---

## ✨ Funkcjonalności

- Automatyczna instalacja Windows
- Usuwanie zbędnych aplikacji (Xbox, Cortana, OneDrive, Copilot, itp.)
- Dezaktywacja komponentów (Snipping Tool, Media Player, WordPad, itp.)
- Zoptymalizowany wygląd i interfejs (ciemny motyw, klasyczne menu kontekstowe, układ paska zadań)
- Zmiany rejestru: prywatność, animacje, usługi
- Finalizacja instalacji (usunięcie `Windows.old`)

---

## 🗂 Struktura Plików

```
.
├── autounattend.xml
└── Windows
    └── Setup
        └── Scripts
            ├── Specialize.ps1
            ├── DefaultUser.ps1
            ├── FirstLogon.ps1
            ├── RemovePackages.ps1
            ├── RemoveCapabilities.ps1
            ├── RemoveFeatures.ps1
            ├── SetColorTheme.ps1
            ├── SetWallpaper.ps1
            ├── SetStartPins.ps1
            ├── UnlockStartLayout.vbs
            ├── UnlockStartLayout.xml
            ├── TaskbarLayoutModification.xml
            └── UserOnce.ps1
```

---

## 🛠️ Konfiguracja

Większość ustawień jest już predefiniowana w `autounattend.xml`, ale można je dostosować:

- Zmiana klucza produktu (`<ProductKey>`).
- Modyfikacja motywu i kolorów w `SetColorTheme.ps1`.
- Zmiana zachowania aplikacji domyślnych lub dodanie własnych w `RemovePackages.ps1`.

---

## 🧑‍💻 Użytkownicy i Logowanie

- Instalacja zakłada konfigurację konta lokalnego (`InteractiveLocal`).
- Skrypt `DefaultUser.ps1` konfiguruje ustawienia domyślnego profilu użytkownika (`HKU\DefaultUser`).
- Skrypt `UserOnce.ps1` jest uruchamiany raz dla każdego nowego użytkownika, dostosowując ich środowisko (pulpit, menu Start, efekty wizualne).
- Usunięte zostały ekrany związane z kontem Microsoft (`HideOnlineAccountScreens`, `HideWirelessSetupInOOBE`, itp.)

---

## 📦 Instalacja Dodatkowego Oprogramowania

W obecnej wersji projekt **nie instaluje dodatkowego oprogramowania z Internetu**. Aby dodać automatyczną instalację programów (np. przez `winget`, `choco`, lub z plików `.exe`/.msi), możesz:

1. Utworzyć nowy skrypt PowerShell np. `InstallApps.ps1`.
2. Wstawić w nim polecenia typu:

```powershell
winget install --id Google.Chrome
choco install 7zip -y
Start-Process -Wait "C:\Installery\Narzędzie.exe" /silent
```

3. Dodać jego uruchomienie do `Specialize.ps1` lub `UserOnce.ps1`.

---

## 💡 Przykłady

- **Zmiana koloru akcentu**: edytuj `SetColorTheme.ps1` → `$htmlAccentColor = '#10893E'`
- **Dodanie własnej aplikacji do usunięcia**: dopisz identyfikator do tablicy `$selectors` w `RemovePackages.ps1`

---

## ❓ Problemy i Rozwiązania

**Problem:** Instalacja zatrzymuje się na ekranie EULA.  
**Rozwiązanie:** Upewnij się, że `<AcceptEula>true</AcceptEula>` jest obecne.

**Problem:** Skrypty się nie uruchamiają.  
**Rozwiązanie:** Sprawdź, czy ścieżki i pliki znajdują się fizycznie na nośniku USB, w odpowiednich folderach.

**Problem:** Ustawienia nie są stosowane dla nowych użytkowników.  
**Rozwiązanie:** Zweryfikuj, czy `DefaultUser.ps1` został wykonany i `HKU\DefaultUser` został załadowany.

---

## 👥 Autorzy

- Projekt stworzony przy użyciu [Windows Unattend Generator](https://schneegans.de/windows/unattend-generator/)
- Modyfikacje: [Twoje Imię lub Pseudonim] (opcjonalnie)
- Pomoc: PowerShell Community, Microsoft Docs

---

## 📄 Licencja

Ten projekt może być używany i modyfikowany do użytku prywatnego. Nie rozpowszechniaj go z systemem Windows w sposób naruszający warunki licencyjne Microsoft.
