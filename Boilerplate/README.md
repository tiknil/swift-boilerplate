```
  //****************************************************************************************************
  //
  //
  //                '.--.'
  //            '.----------.'
  //        ''.----------------..'
  //     '.------------------------.'
  // '.-----------::-------------------.'
  // --------:/+syyyyso::/+++oo+/::------'              /+++:         ++++'                  '++++. '++++
  // ------:odNMNNNNNmyssyyyssssyys+/----'    +ooo'    'oyyyo'        syyy.                  -yyyy/ 'yyyy
  // :::::+dMMmy+//+ssyysshhy+//+osys+:::'    syyy.     .///'         syyy.        '...'      -//:  'yyyy
  // ssss+mMMhssssyyyso/:sdNMMNmmmmmmmddd- :ooyyyyoooo. :ooo- '.--.'  syyy. 'ooo//osyyyo+.    oooo' 'yyyy
  // sssosMMd+ooo++/::----:/+syhhdddddddd- /ooyyyyoooo. +yyy:  '----' syyy. 'yyyyyyoooyyyy/'  yyyy' 'yyyy
  // sssosMMd+ooo++/::----:/+syhhdddddddd-    syyy.     +yyy:   '----.syyy. 'yyyy+-  '-syyy-  yyyy' 'yyyy
  // ssss+mMMhssssyyyso/:sdNMMNmmmmmmmddd-    syyy.     +yyy:    '----syyy. 'yyyy      oyyy-  yyyy' 'yyyy
  // :::::+dMMmy+//+ssyysshhy+//+osys+:::'    syyy.     +yyy:   '----.syyy. 'yyyy      oyyy-  yyyy' 'yyyy
  // ------:odNMNNNNNmyssyyyssssyys+/----'    +yyys//o. +yyy:  .----' syyy. 'yyyy      oyyy-  yyyy' 'yyyy
  // --------:/+syyyyso::/+++o++/::------'    '/syyyyy+ +yyy:'----.'  syyy. 'yyyy      oyyy-  yyyy' 'yyyy
  // '.-----------::-------------------.'       '.:::-' .:::.'''''    -:::'  ::::      -:::'  ::::'  ::::
  //      '.------------------------.'
  //         ''.----------------..'
  //             '.----------.'
  //                 '.--.'
  //
  //                                  	  Developed by TiKnil
  //                                       	© Tiknil 2020
  //
  //****************************************************************************************************
```

## Note per l'inizializzazione in locale del progetto

Eseguire almeno una volta `./init-proj-locally.rb`. Questo script verifica la presenza sul sistema di `xcodegen` e, se presente, lo esegue una volta per inizializzare il progetto XCode (che è in `.gitignore`, quindi il progetto non viene condiviso).
Inserisce poi un git hook `post-checkout` che esegue se necessario `xcodegen generate --no-cache` per l'aggiornamento del file di progetto quando si fa checkout di un branch
