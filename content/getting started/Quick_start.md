+++
title = "Quick Start"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

# Creator's Display name
creatordisplayname = "Anton"
# Creator's Email
creatoremail = "antonmenshickov@gmail.com"
# LastModifier's Display name
lastmodifierdisplayname = "Anton"
# LastModifier's Email
lastmodifieremail = "antonmenshickov@gmail.com"
+++

Use *stegos/stegosDocker* image to **start Node:**
{{< highlight bash >}}docker run -v $PWD/stegos-data:/data --name stegos_node -t -i stegos/stegos{{< / highlight >}}
Execute stegos command inside container to get into CLI:
{{< highlight bash >}}docker exec -t -i stegos_node stegos{{< / highlight >}}
CLI will prompt for commands:
{{< highlight bash >}}
Stegos CLI 0.11.13 (e63fb9e 2019-08-09)
Type 'help' to get help

stegos>
{{< / highlight >}}
Type *create account* to create a new account:
{{< highlight bash >}}
account#1> create account
Enter new password:
Enter same password again:                                                                                                           
---
- type: account_created
  account_id: "1"
...
{{< / highlight >}}

Type *show keys* to get your account address:
{{< highlight bash >}}
account#1> show keys
---
- type: keys_info
...

---
- account_id: "1"
  type: keys_info
  account_address: 7fZZ8ED8jmiKWHdtBJ23mBoVJKKvPbBucEJL2b9eYj5579ALzEU
...
{{< / highlight >}}

Congratulations! Please join us on Telegram Chat to get test tokens and let us know your thoughts. Subscribe to official Telegram Channel for the latest news.