+++
title = "Working with Accounts"
head ="<label>Working with Accounts</label> "
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

# Creator's Display name
creatordisplayname = "Alaze"
# Creator's Email
creatoremail = ""
# LastModifier's Display name
lastmodifierdisplayname = "Alaze"
# LastModifier's Email
lastmodifieremail = ""
+++

### Creating an Account

Type `create account` to create a new account. You will be asked for a password. This password is used locally to encrypt your data on the disk. Please remember it.

Type `show recovery` to get 24-word recovery phrase. This recovery phrase is an encoded representation of your secret key. Please write down it and keep it in a safe place. There are no other password recovery mechanisms.

___

### Recovering an Account

Type `recover account` to recover an account from saved 24-word recovery phrase.

___

### Switching Between Accounts

Type `show accounts` to list available accounts.

Type `use ACCOUNT_ID` to switch between active accounts in CLI.

___


### Checking Balance

Type `show balance` to get balance.

___

### Sending Money

Type `pay RECIPIENT AMOUNT` to send money.

___

### Getting Payment History

Type `show history 15m` to see status of created transaction and payment history.
