+++
title = "Data Directory Layout"
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

Data directory has the following layout: 

{{< highlight base "linenos=inline" >}}
    ├── accounts/  <!-- Accounts
    │   ├── 1
    │   │   ├── account.pkey <!-- Account #1 public key (address)
    │   │   ├── account.skey <!-- Account #2 secret key (address)
    │   │   └── history/     <!-- Payment History (RocksDB)
    │   └── 2
    │       ├── account.pkey <!-- Account #1 public key (address)
    │       ├── account.skey <!-- Account #2 secret key (address)
    │       └── history/     <!-- Payment History (RocksDB)
    ├── api.token            <!-- Generated API Token
    ├── chain/               <!-- Blockchain (RocksDB)
    ├── network.pkey         <!-- Ephemeral network (consensus) public key.
    ├── network.skey         <!-- Ephemeral network (consensus) secret key.
{{< / highlight >}}
