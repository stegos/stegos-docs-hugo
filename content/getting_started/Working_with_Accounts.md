+++
title = "Working with Accounts"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"
weight=11
+++

### Creating an Account

Type {{< code >}}create account{{< /code >}} to create a new account. You will be asked for a password. This password is used locally to encrypt your data on the disk. Please remember it.

Type {{< code >}}show recovery{{< /code >}} to get 24-word recovery phrase. This recovery phrase is an encoded representation of your secret key. Please write down it and keep it in a safe place. There are no other password recovery mechanisms.

___

### Recovering an Account

Type {{< code >}}recover account{{< /code >}} to recover an account from saved 24-word recovery phrase.

___

### Switching Between Accounts

Type {{< code >}}show accounts{{< /code >}} to list available accounts.

Type {{< code >}}use ACCOUNT_ID{{< /code >}} to switch between active accounts in CLI.

___


### Checking Balance

Type {{< code >}}show balance{{< /code >}} to get balance.

___

### Sending Money

Type {{< code >}}pay RECIPIENT AMOUNT{{< /code >}} to send money.

___

### Getting Payment History

Type {{< code >}}show history 15m{{< /code >}} to see status of created transaction and payment history.
