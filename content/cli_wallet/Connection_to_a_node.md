+++
title = "Connecting to a Node"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"
weight=7
+++

In this section we explain how to connect to a **Stegos Node**.

**Prerequisites:**

* [**Node is up and running**]({{< relref "Running_a_Node.md">}})

___

### Connecting to a Local Node

{{% tabs %}}
{{% tab "Linux" %}}
{{< highlight bash >}}
./stegos
{{< / highlight >}}
{{% /tab %}}
{{% tab "macOS" %}}
{{< highlight bash >}}
./stegos
{{< / highlight >}}
{{% /tab %}}
{{% tab "Docker" %}}
{{< highlight bash >}}
docker exec -t -i <CONTAINER_NAME> stegos
{{< / highlight >}}
{{% /tab %}}
{{% /tabs %}}

The command-line client will try to connect to a local node and print {{< code >}}stegos{{< /code >}} prompt on success:

{{< highlight bash "linenos=inline" >}}
Stegos CLI 0.11.13 (e63fb9e 2019-08-09)
Type 'help' to get help

account#1>
{{< / highlight >}}

Type {{< code >}}help{{< /code >}} to get help:

{{< highlight bash "linenos=inline" >}}
stegos> help
Usage:
show accounts - show available accounts
use ACCOUNT_ID - switch to a account
create account - add a new account
recover account - recover account from 24-word recovery phrase
delete account - delete active account
passwd - change account's password
lock - lock the account
unlock - unlock the account

pay ADDRESS AMOUNT [COMMENT] [/snowball] [/public] [/lock DATETIME] [/fee FEE] [/certificate] - send money
validate certificate UTXO SENDER_ADDRESS RECIPIENT_ADDRESS RVALUE - check that payment certificate is valid
msg ADDRESS MESSAGE - send a message via blockchain
stake AMOUNT - stake money
unstake [AMOUNT] - unstake money
restake - restake all available stakes
cloak - exchange all available public outputs
show version - print version information
show keys - print keys
show balance - print balance
show utxo - print unspent outputs
show history [STARTING DATE] - print history since date
show election - print leader election state
show escrow - print escrow
show recovery - print recovery information
{{< / highlight >}}

{{% notice tip %}}You successfully connected to a local Node.{{% / notice %}}

___

### Connecting to a Remote Node

Copy {{< code >}}api.token{{< /code >}} from a remote host to your host. You can find this token in {{< code >}}STEGOS_DATA_DIR{{< /code >}}. See Running a Node for details.

{{< highlight bash "title=ssh-copy-api-token.sh" >}}
scp YOURNAME@HOST:~/.local/stegos/api.token .
{{< / highlight >}}

Where

* HOST - a remote host
* YOURNAME - your login on the remote host

Forward WebSocket API port from the remote host to your machine using ssh port forwarding:

{{< highlight bash "title=ssh-port-forward.sh" >}}
ssh -f -N -T -L 127.0.0.1:3145:127.0.0.1:3145 YOURNAME@NODE
{{< / highlight >}}

On success, ssh will connect to the remote host and forward remote {{< code >}}127.0.0.1:3145{{< /code >}} to your local {{< code >}}127.0.0.1:3145{{< /code >}}:

{{< highlight bash "linenos=inline" >}}
local$ nc -z 127.0.0.1 3145
local$ echo $?
0
{{< / highlight >}}

{{% notice note %}}Alternatively, you can provide --api-endpoint command-line option or overrideSTEGOS_API_ENDPOINT variable for Node, configure firewall and restart your Node.{{% / notice %}}

{{% notice info %}}Exposing WebSocket API port to the public Internet is insecure. Please consider to use SSH port forwading or configure firewall.{{% / notice %}}

Connect to remote Node by providing path to {{< code >}}api.token{{< /code >}} and API Endpoint:

{{% tabs %}}
{{% tab "Linux" %}}
{{< highlight bash >}}
./stegos --api-token <PATH/TO/TOKEN> --api-endpoint <API_ENDPOINT>
{{< / highlight >}}
{{% /tab %}}
{{% tab "macOS" %}}
{{< highlight bash >}}
./stegos --api-token <PATH/TO/TOKEN> --api-endpoint <API_ENDPOINT>
{{< / highlight >}}
{{% /tab %}}
{{% tab "Docker" %}}
{{< highlight bash >}}
docker run -t -i stegos/stegos -- --api-token <PATH/TO/TOKEN> --api-endpoint <API_ENDPOINT>
{{< / highlight >}}
{{% /tab %}}
{{% /tabs %}}

{{% notice tip %}}You sucessfully connected to a remote Node.{{% / notice %}}
