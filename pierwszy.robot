*** Settings ***
Library   SSHLibrary

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

SSH Test
  Połączenie się z hostem
  Autoryzacja z podaniem poprawnych danych
  Sprawdzenie czy nawiązano połączenie
  Rozłączenie

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


















































































































































































































































  Log to console    ${MESSAGE}
