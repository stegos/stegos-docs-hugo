+++
title = "Exchange integration"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

+++

In private coin like Stegos, where each utxo has cloaked public key, ones usually need a secret_key to find if some utxo was belong to user.

Exchange services usually works with big amount of users. And they need to store sercret keys in some secure place, frequently without access to the internet.
So regular aproach would not work on exchanges.

To get around this, for exchanges we use `Public` outputs.
Public outputs already used in service award, it stores recipient and amount in open form, so everybody can see it, for example in blockexplorer.

### Transaction signing

In Stegos transaction signing is differ from regular `sign(bytes, secret_key)`, in order to sign transaction ones need to calculate data based on inputs and outputs.
So transaction signing cannot be splitted from serialization. To simplify this process we introduceintroduce api method
[`create_raw_transaction`]({{< relref "#creating-and-signing-transaction" >}}) for signing transaction from raw data.


### Integration design

To allow exchanges store secret key in seperate place without access to the internet, we propose the folowing architecture:

<img src="/images/Exchange_integration.png" style="object-fit:cover;"/>

In this architecture for each of exchange users keypair would be created (it could be done on demand, or once user created).

Secret part of keys, would be stored in some secret place, we call it `Cold wallet`.
This `Cold wallet` has node started in 
offline mode. In order to start node in offline mode, flag `-X` should be passed
```shell
./stegosd -X -n mainnet
```
`Cold wallet` can be limited in only one api call of [`create_raw_transaction`]({{< relref "#creating-and-signing-transaction" >}}) .

Also in this architecture, exchange integrators need to develop Output explorer, that would observe blockchain history, and search for users UTXOs by `recepient` address.
This can be easily done by subscribing for chain updates. See [Blockchain notifications]({{< relref "/developers/WebSocket_API.md#blockchain-notifications">}}).

In order to fully isolate `Cold wallet` from network ones also needs to deliver full inputs to `Cold wallet`.

See: [`outputs_list`]({{< relref "#outputs-list" >}}) for info about outputs retrival.

And as last part, ones need to send transaction to the network, for it use
[`broadcast_transaction`]({{< relref "#broadcasting-transaction" >}}) method.



### Exchange API (offline signing) 

In order to allow exchanges split their keys, we designed api for offline signing.

#### Websocket protocol

For all integration we use the same protocol described in [protocol section]({{< relref "/developers/WebSocket_API.md#protocol">}}) of websocket API page.

#### Outputs list

Returns full output blobs, by UTXO IDs.


**Request**
```js
{
    "type": "outputs_list",
    "utxos": // Array of UTXO IDs
    [
        "output_hash",.. // HEX represented Hash of output (UTXO ID)
    ]
}
```

**Request example**
```json
{
    "type": "outputs_list",
    "utxos": [
        "33a3362aa631a9e6bff4d7c492c97112e0699917f9c3a236711ed3cb3f7281f3"
    ]
}
```

**Response**
```js
{
    "type": "outputs_list",
    "utxos": // Array of UTXOs
    [
        "output",.. // HEX represented full output
    ]
}
```

**Response example**
```json
{
  "type": "outputs_list",
  "utxos": [
    "0a970e0a240a220a20a60855d848ea7eb398b17ad289b21fe722032459ce6d70396e4dc0ed31f0ca2a12c7050a220a202cfd1846752b83dd4940c1748df08ada0d048cdd5c674a428b4db98a415a496112a00540257d4ad865a3558a2d5fcabd5d3ebc89b5b653799b2f019aaa4eae6839ad7bca6b274354d8cc0edffcf56658a4f99623febeb614e509bb204177cc67717a28ee52262f6e3295126d94784e854578150d9c41b37fbafd1c38d814b233e3c43b688d144eb2ce408eca7ab1512086e5c68833520deffa64c8944fb6bbd2bada7c9cf86f40e457600fe41ea17077965121aaee6b949433e60dd18d229fde016404f4830465e1626142b8357ac1dd6e43291e8091aab2134f24c6f5def7a6b0a109c0acbcca164c7e6a38a73a9596fc5fd04aabc51e99281e9f31948af7a2c9d70ac4e6be138b9327b3f3eaa484ef1638174890e8a5c7dc71f328040fc525781b20c4f124df51a8574b02714c8c3778b688c4de71e9698145714592bef4868d096464c84fc5d167fea0a801072ad502e67759a3a9771999d878a15e91781ebea26d10c954ac7219ad7dc689bc06442fced2f45cf15d983f11799e1e21ba8517e17e8a47db2a974a598c4919c5fad7e0a2bf832f1cd5a2ffbe20fd02f7bf5ce16f41a086790e27526375b452debd093af790364dbd6b637ab19766718cdd6187220344473047a8c1de168121924ae96c7cdc97ef592051ea84bf4eed5db29cf71736449efc9699c28fdfe88b8f99e3d8a12a717c3e5225471d97fd57da8682b9d23e740a51b243af9981b8cc83863f35793dfa805ef469a8dae9dd756b98fc9dd600e2cea3172cabfbf9edc84dae088aec305c80d05f97ac5f03d4533ea9ae8bea51c4b975a69bdd34a5777b4d7bf977343fb184f4b1aff44797961fa87d3822cd3912e90cbf5804b6ebd5ffce783f9538b07d4e20f24aab4b192579cddd3cd47a4d61d3f8c162dbd5fb951c4cf7a0dce6b05a6a90dab403925b3fa9658cfb73b20394ee089fef7816efa05af6c53bfd03e273e34e82e0c7b6a71b1f06c114e5370c22220a20787eb91b0aa4263c9b52bcbf733fc41d466b74ab0dd78b9981db96df6a6e845e2a8008375db1a9787c0bec5345fba7aac5945feebe62d9447c4521e012daad23e950811a9456e45e2337d17c8f346b7e0ef25d84e6a625fdfbce15c612e195bb00df06968ad5c1f86cec544098a2b12c64ce7f80a77ff701e09189ea9504a55761fe95fc614821502c24af9fcf951e15f17286f6fac813b3d20593a31586480ea57e523ecfc88d7211661e997969cca96450fc754985feebe35dc3d4aebb7d3a97f6b1df11e6c724d61e1bd697dcc636311ad27399a6308a84e184cbbd0c5877ae57ed070f60290ac79d07d0a72642a9dd56ac1dec7967ec8cc3e39e047b1a9a789a817b92387c505cb8e7fc0a8d9bc95969b33505030d44a7b33585a6f5c6965973df3014f21565c577454614ac827dd16695718eba7fb45f292d7cc1a74cd7a024b18613213c93df858d0afb386866b24023e7a2ff90295c403ab8ccd77c162eadced305cea587925e13a054f60aa5e3d7c1a917371acb5532c6fffed349abe77a268941d9f5eed6c739e44cbce61d34ec2b9b62e4b06fc7ede3532e7978bb335f8139ea46a91ac66531a13783aa0f79be168bf7c159e6feb52008f6b5a0bca48f0ae4414ba8cd6b0a602f7264d72a09bb31bca13008d2f0050f5750c04b74c8a5844b2639c657b28cccd2c802a501cc11dad2028a63a0d912ca6a800eab99df20f244122898cc875570a7ca5655f9f07419aa62fd860cfd5f07c738203e465a1d0bacdd6c7099a1c6da09e7b36327efca84e2ab606c596a009928d95387ac1cf79ae31df8b9ded35b10538e7694dfcfbdef9878a933f7eeed1fa461f2af51f867a37c37d02c132f08e928012800b3137845dd8260c4efcf668279a027548cfa46ea057c9dc47c28d56ffccc559c32e9b4768eef9db59d4b99d28fd1f1d8ef64acd0db41bea6dc498d0929ab3ef82b92b7df4cc10a3a0a359e947a71e8a20302ae6eec47e214cfb5b81ac9b16cc97d9b70749fb3aa386151ff29414590e7d63f4fa0c40c2d56483bdddf7894b2bcf597106c260b9ed72ad88c1c8bf6c782b3314b0cfd1ef30f974d05279ba45ab22adcfdab53766166479abfc56ea51a2fdcd28290806b15d39b2d0dd6209517ad2ecd74ebb83b3a9644e5a20f9533b0987afc3f4384ea3686622cd821d967f856d9798c89da014b71e1fd624a9504309b0cdfd66d3e316b100ad14e8aeeda632cb2b8383520dd1e5b3d3854312bfc4922d295322a5ea2415026a4956c100b9945be2c5882674c32713ac3a5a996aac3e5221067e503aa4ef8df630c5f4803f9fef82e689a9e5e76303f9c8c822842219db161f64ce1ee47eb558c264d37ab0c4ca53ac8d7bc907849cb47628a2f19e802862be5d9be621facf8712826418e8bfe0a34cd9bde681a1173480cb2922b2ff4925bdcac1acf19aea3ae76275f1954b92b24e897c5cdb8770f4f7b617ee5261b53766ab4"
  ]
}
```

#### Creating and signing transaction

Creates transaction based on array of UTXO IDs, and pre-filled data for newly created outputs.

**Request**
```js
{
   "type":"create_raw_transaction",
   "txins": // array of inputs
   [
      "output_hash",.. // HEX represented Hash of output (UTXO ID).
   ],
   "txouts": // array of outputs, that should be created
   [
      {
         "output_type":"payment", // type of output could be payment | public_paymnet 
         "comment": "string", // STRING comment that should be sent to recipient, in output
         "amount": num, // amount that should be transfered NUMBER
         "recipient":"bech32" // (BECH32 form of recipient public key )
      }
   ],
   "secret_key":"bytes", //  array of 32 bytes, which is a secret key canonical representation 
   "fee": num, // numeric amount of fee
   "unspent_list": // array with full UTXO of inputs
   [
"0a970e0a240...66ab4",.. // HEX represented blob of input
    ]
}
```
{{% notice note %}}
If input is missing in **unspent_list**, then inputs would be searched in local copy of blockchain.
{{% / notice %}}


**Request example**

```json
{
    "type": "create_raw_transaction",
    "txins": [
        "33a3362aa631a9e6bff4d7c492c97112e0699917f9c3a236711ed3cb3f7281f3"
    ],
    "txouts": [
        {
            "output_type": "public_payment",
            "amount": 400000000,
            "recipient": "stt1jz93s3534w5z58r4was0dg0lhgk58l2n0nf43nkpadvk7ue7gyus2wsars"
        }
    ],
    "secret_key": [
        189, 97, 253, 136, 193, 119, 245, 54, 13, 211, 102, 4, 143, 172, 130, 249, 89, 80, 185, 46, 33, 245, 162, 159, 75, 33, 177, 123, 158, 110, 143, 1
    ],
    "fee": 100000000,
    "unspent_list": [
"0a970e0a240a220a20a60855d848ea7eb398b17ad289b21fe722032459ce6d70396e4dc0ed31f0ca2a12c7050a220a202cfd1846752b83dd4940c1748df08ada0d048cdd5c674a428b4db98a415a496112a00540257d4ad865a3558a2d5fcabd5d3ebc89b5b653799b2f019aaa4eae6839ad7bca6b274354d8cc0edffcf56658a4f99623febeb614e509bb204177cc67717a28ee52262f6e3295126d94784e854578150d9c41b37fbafd1c38d814b233e3c43b688d144eb2ce408eca7ab1512086e5c68833520deffa64c8944fb6bbd2bada7c9cf86f40e457600fe41ea17077965121aaee6b949433e60dd18d229fde016404f4830465e1626142b8357ac1dd6e43291e8091aab2134f24c6f5def7a6b0a109c0acbcca164c7e6a38a73a9596fc5fd04aabc51e99281e9f31948af7a2c9d70ac4e6be138b9327b3f3eaa484ef1638174890e8a5c7dc71f328040fc525781b20c4f124df51a8574b02714c8c3778b688c4de71e9698145714592bef4868d096464c84fc5d167fea0a801072ad502e67759a3a9771999d878a15e91781ebea26d10c954ac7219ad7dc689bc06442fced2f45cf15d983f11799e1e21ba8517e17e8a47db2a974a598c4919c5fad7e0a2bf832f1cd5a2ffbe20fd02f7bf5ce16f41a086790e27526375b452debd093af790364dbd6b637ab19766718cdd6187220344473047a8c1de168121924ae96c7cdc97ef592051ea84bf4eed5db29cf71736449efc9699c28fdfe88b8f99e3d8a12a717c3e5225471d97fd57da8682b9d23e740a51b243af9981b8cc83863f35793dfa805ef469a8dae9dd756b98fc9dd600e2cea3172cabfbf9edc84dae088aec305c80d05f97ac5f03d4533ea9ae8bea51c4b975a69bdd34a5777b4d7bf977343fb184f4b1aff44797961fa87d3822cd3912e90cbf5804b6ebd5ffce783f9538b07d4e20f24aab4b192579cddd3cd47a4d61d3f8c162dbd5fb951c4cf7a0dce6b05a6a90dab403925b3fa9658cfb73b20394ee089fef7816efa05af6c53bfd03e273e34e82e0c7b6a71b1f06c114e5370c22220a20787eb91b0aa4263c9b52bcbf733fc41d466b74ab0dd78b9981db96df6a6e845e2a8008375db1a9787c0bec5345fba7aac5945feebe62d9447c4521e012daad23e950811a9456e45e2337d17c8f346b7e0ef25d84e6a625fdfbce15c612e195bb00df06968ad5c1f86cec544098a2b12c64ce7f80a77ff701e09189ea9504a55761fe95fc614821502c24af9fcf951e15f17286f6fac813b3d20593a31586480ea57e523ecfc88d7211661e997969cca96450fc754985feebe35dc3d4aebb7d3a97f6b1df11e6c724d61e1bd697dcc636311ad27399a6308a84e184cbbd0c5877ae57ed070f60290ac79d07d0a72642a9dd56ac1dec7967ec8cc3e39e047b1a9a789a817b92387c505cb8e7fc0a8d9bc95969b33505030d44a7b33585a6f5c6965973df3014f21565c577454614ac827dd16695718eba7fb45f292d7cc1a74cd7a024b18613213c93df858d0afb386866b24023e7a2ff90295c403ab8ccd77c162eadced305cea587925e13a054f60aa5e3d7c1a917371acb5532c6fffed349abe77a268941d9f5eed6c739e44cbce61d34ec2b9b62e4b06fc7ede3532e7978bb335f8139ea46a91ac66531a13783aa0f79be168bf7c159e6feb52008f6b5a0bca48f0ae4414ba8cd6b0a602f7264d72a09bb31bca13008d2f0050f5750c04b74c8a5844b2639c657b28cccd2c802a501cc11dad2028a63a0d912ca6a800eab99df20f244122898cc875570a7ca5655f9f07419aa62fd860cfd5f07c738203e465a1d0bacdd6c7099a1c6da09e7b36327efca84e2ab606c596a009928d95387ac1cf79ae31df8b9ded35b10538e7694dfcfbdef9878a933f7eeed1fa461f2af51f867a37c37d02c132f08e928012800b3137845dd8260c4efcf668279a027548cfa46ea057c9dc47c28d56ffccc559c32e9b4768eef9db59d4b99d28fd1f1d8ef64acd0db41bea6dc498d0929ab3ef82b92b7df4cc10a3a0a359e947a71e8a20302ae6eec47e214cfb5b81ac9b16cc97d9b70749fb3aa386151ff29414590e7d63f4fa0c40c2d56483bdddf7894b2bcf597106c260b9ed72ad88c1c8bf6c782b3314b0cfd1ef30f974d05279ba45ab22adcfdab53766166479abfc56ea51a2fdcd28290806b15d39b2d0dd6209517ad2ecd74ebb83b3a9644e5a20f9533b0987afc3f4384ea3686622cd821d967f856d9798c89da014b71e1fd624a9504309b0cdfd66d3e316b100ad14e8aeeda632cb2b8383520dd1e5b3d3854312bfc4922d295322a5ea2415026a4956c100b9945be2c5882674c32713ac3a5a996aac3e5221067e503aa4ef8df630c5f4803f9fef82e689a9e5e76303f9c8c822842219db161f64ce1ee47eb558c264d37ab0c4ca53ac8d7bc907849cb47628a2f19e802862be5d9be621facf8712826418e8bfe0a34cd9bde681a1173480cb2922b2ff4925bdcac1acf19aea3ae76275f1954b92b24e897c5cdb8770f4f7b617ee5261b53766ab4"
    ]
}
```


**Response**

```js
{
  "type": "create_raw_transaction",
  "txouts": // Array of newly created outputs hashes
  [
    "output_hash", // Hash of output in HEX
  ],
  "data": "12d...01" // Transaction data serialized in protobuf and HEX encoded.
}

```


**Response example**

```json
{
  "type": "create_raw_transaction",
  "txouts": [
    "b6cfc6222d0bc0e7b5bcca0d7ef11af42474b207c8f598db9d7848391f8587fb"
  ],
  "data": "12d2010a220a2033a3362aa631a9e6bff4d7c492c97112e0699917f9c3a236711ed3cb3f7281f3123912370a240a220a20908b184691aba82a1c757760f6a1ffba2d43fd537cd358cec1eb596f733e413910bca3b9e2b9a78fa0d901188088debe011a220a20f12eea29dd6f2aab5abc362bad4260e54ee7a57cf32e0c18e7918ab4060ea8022080c2d72f2a480a220a20623d503d4dd8fdaed3b891d63f3fedd09e044d10443bb92c308577bbd1dae20c12220a2094862dd404a2527afd9bdacdf788f7cc00e05429bf8f004161fab50ac310a401"
}

```

#### Broadcasting transaction

**Request**

```js
{
    "type": "broadcast_transaction",
    "txouts": [
       "output_hash",.. // HEX represented Hash of transaction output.
    ]
    "data": "hex", // HEX represented, protobuf encoded tx data that is returned in create_raw_transaction response.
}
```

**Request example**

```json
{
    "type": "broadcast_transaction",
    "data": "12cf010a220a20d73728ef7c62e2b1e53fdfb22d689c73ee1d4c3d6fbd9a3015c70b7254f830be123812360a240a220a20d6fd504ef470d801e2810ffa32aeaca08bbf92c609f5dd4ca4010ce280c02f7410d3d09afd91c7edbefc0118b0dcb80b1a220a20000000000000000000000000000000000000000000000000000000000000000020e8072a480a220a20e894a0f3918a045bf38f02db081dbb9ad23fb23cc73850db9a75c95b2627ad0c12220a20020ff98a4ecf4251955c1ffc6ff9d18a2b96cfdd1a8be3973400eaca128e0824"" 
}
```

**Response**

```js
{
"type": "broadcast_transaction",
"hash": "output_hash", // HEX represented hash of output (UTXO ID)
"status": {
   "status": "status" // Status of processing (accepted/created/prepared/rejected)
  }
}
```
{{% notice note %}}
status `rejected` mean that transaction was not processed.
{{% / notice %}}
**Response example**

```json
{
"type": "broadcast_transaction",
"hash": "6dd4d515d5b1061c00f8dc2c549faa4ed6db8f1736a5fffa873f95a7dd7fe11d",
"status": {
   "status": "accepted"
  }
}
```

### Starting node offline


