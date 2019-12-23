+++
title = "Wallet Restore Problems"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"
weight=4
+++

We're getting reports that some users have been unable to properly restore their testnet wallet and register their hackathon claim with Jerry the bounty bot.

If you tried to use Option 3 to restore your testnet wallet and Jerry won't recognise your mainnet address, please try the following steps. Your mainnet address should be very similar to your testnet address, but with a different prefix and final 6 characters.

1. Install the Stegos GUI wallet from https://github.com/stegos/stegos-wallet/releases/tag/v1.0

2. Sync it with the testnet blockchain

3. Make sure that and account was created and exit the wallet

4. Find the directory where the account data is located:

    For MacOS it is ~/Library/Application Support/stegos/testnet/accounts
    For Windows it is C:\Users\[user]\AppData\Roaming\stegos\testnet\accounts\

5. You should see two files: account.pkey and account.skey. There will also be a history directory.

6. Overwrite account.pkey and account.skey with the same files you backed-up before when using backup Option 3 and delete all files from the history directory.

7. Run the wallet and sync it with testnet. Check that the balance of the account you recovered during step 6 is correct.

8. Back-up the account recovered using the 24-word mnemonic phrase.

    Go to Accounts -> Select Account -> Account settings ->Backup and write down all 24 words, follow the instructions

9. Un-install the wallet and remove all account info from the accounts directory. 

    For MacOS it is ~/Library/Application Support/stegos/testnet/accounts
    For Windows it is C:\Users\[user]\AppData\Roaming\stegos\testnet\accounts\

10. Install the Stegos wallet one more time and recover your hackathon account using the 24 words from step 8.

11. Your balance after recovering you hackathon account should be 0 or 1 STG, since rewards have not been distributed yet.

12. If your balance is 1 STG, you can try to claim from Jerry bot with your new address which starts with stg (not stt).