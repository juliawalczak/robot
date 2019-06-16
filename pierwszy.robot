 *** Settings ***
Library   SSHLibrary
Library   waz.py
Library   SeleniumLibrary

*** Variables ***
${MESSAGE}    Hej
${HOST}   localhost
${USERNAME}   tester
${PASSWORD}   tester

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
    Open browser    https://profil.wp.pl/login.html?zaloguj=poczta    Firefox
Wprowadź login
    Input Text   id=login   testerwsb_t1
Wprowadź hasło
    Input Text    id=password   adam1234
    Click Button    id=btnSubmit
Sprawdź czy się zalogowałeś i strona zawiera słowo odebrane
    Page Should Contain Element   xpath=//*[@id="folder-1"]/div[2]
Zrób scrennshot
    Capture Page Screenshot
Zamknij przeglądarkę
    Close All browsers















































































































































































































































  Log to console    ${MESSAGE}
