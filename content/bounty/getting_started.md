+++
title = "Rules and Tasks"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"
weight=1
+++

Welcome to the Stegos $150,000 Bounty and Hackathon!

To celebrate our final testnet release before the upcoming Stegos IEO and mainnet release, we're offering a **$150,000 bounty program** to help spread the word about Stegos and collect feedback on our app and blockchain.

The bounty program will run in two parts, each with a prize pool of $75,000 in STG coins. The two halves of the bounty program will run simultaneously, and you can take part in both. The bounty will run from 00:01 UTC on Monday 7th October 2019 to 23:59 UTC on Sunday 3rd November 2019.

## Part 1: $75,000 Community and Social Media Bounty Program

The first part is a social media and community bounty run on our website, with big prizes for the top 50 scorers and a $10,000 random draw for anyone who scores in the top 1000 places. [Head here to sign up](http://bounty.stegos.com) and see the list of tasks.

## Part 2: $75,000 Testing and Feedback Bounty Program

The second part will be running in the [Stegos Telegram group](https://t.me/stegos4privacy), and we think it's something really exciting and unique: we're going to award $75,000 in STG coins for testing our blockchain and app and providing feedback, and we're going to use the latest version of the Stegos blockchain to track the scores. At the end of the contest, everyone will receive STG based on the number of testSTG they've earned.

For example, if 1,000,000 testSTG are issued during the hackathon and you earn 100,000, you would have 10% of the total supply and thus win 10% of the bounty pool, or $7,500.  

**IMPORTANT: The chain is working as it will when we officially launch, but for now these are still test tokens which cannot be traded. Their only value is as part of the official Stegos Bounty Program.**

# Bounty Bot

Stegos is a completely private blockchain, so no-one can track Stegos transactions from the chain, even us. Therefore, you MUST register your public key with our Stegos bounty bot and then use the same account for ALL bounty tasks. Otherwise, we won't be able to track your points.

As the hackathon proceeds, we'll be adding more functionality to the bounty bot, including daily rewards. So make sure to check into the Stegos Telegram group every day!

The bounty bot is called [Jerry](https://t.me/StegosJerryBot) (Telegram username: [StegosJerryBot](https://t.me/StegosJerryBot)). Interact with Jerry by sending private messages on Telegram. You can see the list of commands by typing `/help`.

# Hackathon Task List

## Registration Tasks [COMPULSORY — DO THESE FIRST!]

These initial tasks are compulsory tasks to get you set up for the Stegos Telegram Bounty. You'll download the app, setup a wallet and register your public key with our bounty bot. This is how we'll track your progress through the bounty and send you tokens, so make sure you follow the instructions correctly.

### The Stegos App

**Task:** Download and install the Stegos app.

**Reward:** 0 (unfortunately there is no way to reward this task).

**How to Claim:** Head [here to download](https://stegos.com/news/2019/10/mainnet-beta-4/) and install the latest version of the Stegos desktop app.

### Registration

**Task:** Register your public key with our Telegram Bounty Bot. The Bounty Bot will keep track of your score throughout the bounty and track it on the leaderboard.

**Reward:** 100 testSTG

**How to Claim:** Find your public key in the Stegos app, and copy it to your clipboard.

In Telegram, send a private message to Jerry, the Stegos Bounty Bot (username: [StegosJerryBot](https://t.me/StegosJerryBot)).

Send Jerry the following command:

`/register [your public key]`
If your address is valid, Jerry will send you 100 testSTG and you'll get 100 points on the hackathon leaderboard. Your public key and Telegram ID will be stored for the rest of the hackathon.

**IMPORTANT: You must use the same public key and Telegram ID throughout the hackathon, or we won't be able to track your score on the leaderboard. At the end of the hackathon, it's your leaderboard score which will be your official result, not the contents of your Stegos wallet.**

**If you're participating in our $75,000 Vyper bounty as well, make sure you register the same Telegram ID on Vyper.**

### BONUS TASK: Early Adopter Reward

**Task:** If you've already downloaded a previous version of the app and tested it out by using the Stegos Leprechaun Bot, there's a special early adopter award as a thank you. We really appreciate your support!

**Reward:** 2,000 testSTG

**How to Claim:** You don't need to do anything. We'll send you the reward once you've registered and we've added this functionality to the bot.

## Network Tasks

The goal of this set of tasks is to download the Stegos app and command-line interface (CLI), create a wallet, start validating the Stegos blockchain and run a stable node to start earning block rewards and (if you're lucky!) the validator service award.

You'll need to perform these tasks in order and register your progress at each step to earn your reward.

### Send a transaction

**Task:** Send a testSTG transaction, and prove it by providing a valid payment certificate.

**Reward:** 1000 testSTG

**How to claim:** First, ask the Bounty Bot for its public key by sending it the message `/pubkey` as a private message. 

Then, send a minimum of 1 testSTG to that address, making sure you click the "Generate Payment Certificate" option.

Once the transaction has been sent, find it in the "Last Operations" list for your account and click the Payment Certificate.

Now, you need to send the bottom two parameters (UTXO ID and R-VALUE) from the payment certificate to the Bounty Bot so we can validate your transaction. (Don't worry! You can highlight them in the app to copy and paste them.)

Now, send the Bounty Bot the following message: `/proof [UTXO ID][R-VALUE]`, substituting the values from your payment certificate.

The Bounty Bot will confirm that the values are valid and then send you 1000 testSTG, enough to begin staking.

### **Become a validator**

**Task:** Stake at least 1000 testSTG long enough to become an active validator.

**Reward:** One-off reward of 2000 testSTG, ongoing staking rewards.

**How to claim:**  You should now have enough testSTG to begin staking. The minimum threshold for staking is 1000 testSTG. Staking is currently only possible through the command line interface, not in the main app.

You'll need to download and run the Stegos node and the CLI (command-line interface) to interact with it. You can find the instructions in our [documentation portal](http://docs.stegos.com).

Once you've done that, type `help` to see the CLI instructions and then stake at least 1000 testSTG. 

You may need to unseal your wallet first by typing `unseal` and then the password you provided when you first installed the desktop app.

Once you've started staking, you'll need to wait until you're randomly selected to be a validator. The Bounty Bot will then recognise your public key from the list of validators and send you your reward, along with a confirmation message.

You can now keep staking to earn block rewards!

The Stegos team will be running their own nodes to ensure network stability. Naturally, these nodes will occasionally be selected as validators and win block rewards. These rewards will be accumulated and distributed to participants in future tasks, to be announced soon.

### Run a stable node

**Task:** Set up a permanent node with enough stability to meet the validator service award requirements.

**Reward:** Ongoing staking rewards and chance of validator service award.

**How to Claim:** You don't need to do anything to claim this. Jerry the Bounty Bot will track the validator service award and add the right number of points to your leaderboard score.

For stability purposes, the Stegos team will also be running nodes and validating the chain. Don't worry: we're not registered with the Bounty Bot, so we won't be on the leaderboard or affect the bounty payouts. All the tokens which our nodes win will be given out to bounty participants in future tasks, to be announced soon!

## UPDATED: Invite New Users

**Task:** Invite more users to expand the Stegos network. Once the users invite become validators, you'll receive a bonus!

**Rewards:** 100 testSTG for each referred user who becomes a validator.

Most importantly, you'll get massive ongoing rewards: you'll get 5 testSTG every time a user you invite earns a block reward, plus 10% of any validator service award they win.

In addition, a user who registers using your invite link will receive a 10 testSTG bonus.

**How to Claim:** Send `/invite` to Jerry the Bounty Bot to get an invite link. Send this to the person you want to invite. The Bounty Bot will automatically track their progress with the bounty tasks. The first time they join the list of active validators, you'll receive your bonus.

**IMPORTANT:** The user you invite must be a registered member of a Stegos Telegram group for you to receive your bonus.

## Feedback and Testing Tasks

We're looking for feedback on Stegos: our app, our blockchain, our documentation, everything! We also need your help in eliminating any bugs before we launch our mainnet.

### Feedback

**Task:** Send in Feedback

**Reward:** up to 40000 testSTG

**How to Claim:** Feedback should be sent to support@stegos.zendesk.com.

Include your public key and Telegram ID with your support request to receive bounty tokens as a thank you!

Awards will be given at the discretion of our support team, depending on the clarity and usefulness of the feedback received (the highest rewards will only be issued a few times during the bounty).

### Bug Squashing

**Task:** Report a bug

**Reward:** up to 100,000 testSTG

**How to Claim:** If you find a bug, send us an email about it at support@stegos.zendesk.com. 

Please include as much information as you can to help us try and reproduce the bug. Screenshots are always appreciated!

The development team may be in touch to ask for more information or with requests to add files to your computer to monitor performance.

Awards for finding bugs will be given at the discretion of our support and development teams, depending on the severity of the bug (the highest rewards will only be issued a few times during the bounty).

## UPDATED: Daily Free Tokens

**Task:** Claim free testSTG once a day. Come back on consecutive days to get more tokens.

**Reward:** Jerry will send you a random reward of 100, 250, 500, 1000 or even 5000 testSTG. Come back on consecutive days to get a bonus multiplier of 10% for each day you've claimed! Don't miss a day or your multiplier will reset. 

**How to claim:** Send `/free` to the bounty bot once a day to claim your free tokens!

Jerry will regularly send the current Top 10 to the Stegos Telegram groups, but you can also send `/leaderboard` to Jerry to see the current Top 10 scores at any time. Send Jerry `/me` to see your current score and rank. 

## Bounty Bonuses

We're excited to be running two competitions simultaneously, each with a $75,000 prize pool. Each is based around different skills and tasks, but we hope you'll participate in both parts, because you can claim points in each bounty for doing well in the other one!

**Task:** Earn at least 10,000 testSTG to get a bonus in our social media bounty.

**Reward:** 2,500 Vyper points 

**How to claim:** [To be determined very soon!]

**Task:** Earn at least 5,000 Vyper points in our social media bounty.

**Reward:** 5,000 testSTG

**How to claim:** [To be determined very soon!]

**NOTE:** These bonus points CANNOT be used towards claiming the other bonus. 

(i.e., If you claim the 2,500 Vyper points bonus first, you'll need at least 7,500 Vyper points to claim the bonus testSTG. If you claim the 5,000 testSTG first, you'll need at least 15,000 testSTG to claim the bonus Vyper points.)
