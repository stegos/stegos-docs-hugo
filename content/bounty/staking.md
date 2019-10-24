+++
title = "Tutorial 4: Staking"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"
weight=5
+++

Staking is currently only possible from the Stegos CLI (command-line interface).
You can download the CLI from here.

When the CLI first opens, you'll see a prompt. Type commands and press enter to perform actions. Type help to see the list of available commands.

To stake, switch to the account registered with the bounty and type `stake [amount]`.

It's important to note that the CLI is currently denominated in microSTG, as can be seen by typing `show balance`. So, for example, to stake 1000 STG, you need to type `stake 1000000000` (nine zeroes).

Staking locks that portion of your balance. You can regain access to it by typing `unstake [amount]`.

You need to stake at least 1000 testSTG to be eligible to become a validator. Every epoch (60 blocks), a new set of validators is randomly selected based on their stake. Once you've been selected as a validator, Jerry will notice and send you your reward. You will also be sent a block reward of 24 testSTG every time your node is selected to create a block.

You can stake that reward immediately to increase your odds of being selected in future epochs.

Make sure you stay staking for as long as possible: only nodes that are online 100% of the time since the last award are eligible for the validator service award.