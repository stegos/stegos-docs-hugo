+++
title = "Data Directory Layout"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

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
