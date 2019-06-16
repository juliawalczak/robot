 *** Settings ***
Library   SSHLibrary
Library   waz.py
Library   SeleniumLibrary
Library   OperatingSystem

*** Variables ***
${MESSAGE}    Hej
${HOST}   localhost
${USERNAME}   tester
${PASSWORD}   tester
${BROWSER}    Firefox

*** Test Cases ***
My Test
  Log To Console    Hello

Second Test
  Moje logowanie    ${MESSAGE}

Connection Test
  Połączenie się z hostem
  Autoryzacja z podaniem poprawnych danych
  Sprawdzenie czy nawiązano połączenie
  Rozłączenie
Ping test
  Połączenie się z hostem
  Autoryzacja z podaniem poprawnych danych
  Sprawdzenie czy nawiązaliśmy połączenie z Internetem
  Rozłączenie
Fail Internet Connection
  Połączenie się z hostem
  Autoryzacja z podaniem poprawnych danych
  Sprawdzenie czy nie nawiązaliśmy połączenie z Internetem
  Rozłączenie
Count of procesor
  Połączenie się z hostem
  Autoryzacja z podaniem poprawnych danych
  Sprawdzenie ilości procesorów
  Rozłączenie
Sprawdzenie czy funkcja napisana w pythonie działa
  Uruchamanie funkcji i pobieranie wyniku
Logowanie do poczty wp
  Otwórz stronę poczty
  Wprowadź login
  Wprowadź hasło
  Sprawdź czy się zalogowałeś i strona zawiera słowo odebrane
  Zrób scrennshot
  Zamknij przeglądarkę
Wyszukiwanie w google
  Otwórz przeglądarkę i stronę google
  Wprowadź szukane słowo
  Uruchom Wyszukiwanie
  Sprawdź czy wynik wyszukiwania zawiera oczekiwany rezultat
  Zamknij przeglądarkę
Łączenie z localhostem
  Uruchom skrypt
Adres ip
  Uruchom skrypt ip
*** Keywords ***
Moje logowanie
  [Arguments]   ${moja}
  Log to console   ${MESSAGE}
Połączenie się z hostem
  Open Connection   ${HOST}
Autoryzacja z podaniem poprawnych danych
  Login   ${USERNAME}   ${PASSWORD}
Sprawdzenie czy nawiązano połączenie
  ${rc}=     Execute Command                         uname -a
  Should Contain    ${rc}    Linux
Rozłączenie
  Close All Connections
Sprawdzenie czy nawiązaliśmy połączenie z Internetem
    ${ping}=     Execute Command                         ping -c1 8.8.8.8
    Should Contain    ${ping}    1 received
Sprawdzenie czy nie nawiązaliśmy połączenie z Internetem
    ${ping}=     Execute Command                         ping -c1 8.8.8.9
    Should Contain    ${ping}    0 received
Sprawdzenie ilości procesorów
    ${count}=     Execute Command                         cat /proc/cpuinfo |grep processor |wc -l
    Should Be Equal As Integers    ${count}    4
Uruchamanie funkcji i pobieranie wyniku
    ${funkcja}=     Hello
    Should Be Equal   ${funkcja}    Hello World
Otwórz stronę poczty
    Open browser    https://profil.wp.pl/login.html?zaloguj=poczta    ${BROWSER}
Wprowadź login
    Input Text   id=login   testerwsb_t1
Wprowadź hasło
    Input Text    id=password   adam1234
    Click Button    id=btnSubmit
Sprawdź czy się zalogowałeś i strona zawiera słowo odebrane
    wait until element is visible   xpath=//*[@id="folder-1"]/div[2]
    Page Should Contain Element   xpath=//*[@id="folder-1"]/div[2]
    Page Should Contain   Odebrane
Zrób scrennshot
    Capture Page Screenshot
Zamknij przeglądarkę
    Close All browsers
Otwórz przeglądarkę i stronę google
    Open browser    https://www.google.com/    Firefox
Wprowadź szukane słowo
    Input text    xpath=//*[@id="tsf"]/div[2]/div/div[1]/div/div[1]/input   pantera mglista
Uruchom Wyszukiwanie
    click Element   //*[@id="tsf"]/div[2]/div/div[3]/center/input[1]
Sprawdź czy wynik wyszukiwania zawiera oczekiwany rezultat
    Page Should Contain   Pantera mglista zamieszkuje tereny bagniste i górskie lasy do wysokości 2500
Uruchom skrypt
    ${wynik}=   run    python biblioteki.py
    Should Contain    ${wynik}    Linux
Uruchom skrypt ip
    ${wynik}=   run    ./ip.sh lo
    Should Be Equal    ${wynik}    127.0.0.1


















































































































































































































































  Log to console    ${MESSAGE}
