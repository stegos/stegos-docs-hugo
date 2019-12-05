+++
title = "Running a Node"
# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"
weight=5
+++

In this section we explain how to run **Stegos Node**.

**Prerequisites:**

* [Download and install Stegos Node.]({{< ref "/Installing_a_node.md" >}})

Run Stegos Node:

{{% tabs %}}
{{% tab "Linux" %}}
{{< highlight bash >}}
./stegosd
{{< / highlight >}}
{{% /tab %}}
{{% tab "macOS" %}}
{{< highlight bash >}}
./stegosd
{{< / highlight >}}
{{% /tab %}}
{{% tab "Docker" %}}
{{< highlight bash >}}
docker run -v $PWD/stegos-data:/data -t -i stegos/stegos
{{< / highlight >}}
{{% /tab %}}
{{% /tabs %}}

Stegos Node will automatically create a data directory to store the blockchain and your accounts:

{{< highlight bash >}}
INFO [stegosd] Data directory: /home/yourname/.local/share/stegos
{{< / highlight >}}

The default path to the data directory depends on your operating system:

{{% tabs %}}
{{% tab "Linux" %}}
{{< highlight bash >}}
$HOME/.local/share/stegos
{{< / highlight >}}
{{% /tab %}}
{{% tab "macOS" %}}
{{< highlight bash >}}
$HOME/Library/Application Support/stegos
{{< / highlight >}}
{{% /tab %}}
{{% tab "Windows" %}}
{{< highlight bash >}}
C:\Users\$USER\AppData\Roaming
{{< / highlight >}}
{{% /tab %}}
{{% tab "Docker" %}}
{{< highlight bash >}}
/data/.local/share/stegos
{{< / highlight >}}
{{% /tab %}}
{{% /tabs %}}

{{% notice note %}}You can override default path to the data directory by setting {{< code >}}STEGOS_DATA_DIR{{< /code >}} environment variable or providing{{< code >}}--data-dir{{< /code >}} command-line option.{{% / notice %}}

{{% notice note %}}See [**Data Directory Layout**]({{< relref "/developers/Data_Directory_Layout.md">}}) page for additional information about structure of this directory.{{% / notice %}}

On the first run, the blockchain database is initialized using  the genesis block for {{< code >}}testnet{{< /code >}} network:

{{< highlight bash >}}
INFO [stegosd] Using genesis=14427eb426e3 for 'testnet' chain
{{< / highlight >}}

{{% notice note %}}
You can override chain by setting {{< code >}}STEGOS_CHAIN{{< /code >}} environment variable or providing {{< code >}}--chain{{< /code >}} command line option. Supported networks:

* {{< code >}}devnet{{< /code >}} - development (alpha) network
* {{< code >}}testnet{{< /code >}} - test (beta) network
* ~~{{< code >}}mainnet{{< /code >}} - production network (soon!)~~
{{% / notice %}}

On the second and subsequent runs, Node will check the consistency of the blockchain database on the disk. This operation can take up to 5-10 minutes. Please be patient.

{{< highlight bash "linenos=inline" >}}
[stegosd] Using genesis=14427eb426e3 for 'testnet' chain
[stegos_blockchain::blockchain] Recovering blockchain from the disk...
[stegos_blockchain::blockchain] Registered a macro block: epoch=0, block=14427eb426e3, inputs=[], outputs=["efe2e7d9345e", "c4a71cb7b835", "a3ed2635fd36", "bd36a6c800e0", "6d40fe3a0032", "6d9e1b1b90a0", "ab37d6de1139", "e93466e994ee", "9970bfac521a", "e5790f9a6867", "d52afa361b21", "13565df8dbd5", "2cda2eee109e", "9769fdebb0bb", "509357d0641a", "ca8ebc480107", "b7e01f660353", "32ea8bb76ffc", "4c9308e435f4", "ad49e09badb6", "dd73ad6ed665", "4ca223595e0f", "e6ac9c730b29", "58cbbce24c97", "67bf703e0898", "d9befd7ce04a", "78012f4be696", "d7063c1d0045", "89a9c2f846ca", "df7b60876366", "3f0beb5ca4f5", "51258f1845d1", "afccfddc0cd5"]
[stegos_blockchain::blockchain] Registered a macro block: epoch=1, block=8c34ff7da352, inputs=[], outputs=["a8f300945a8a", "9edc64443130", "46f095ce0594", "0cac9d0dd3d7", "97392156e93d", "b9c408dbd550", "209eba3aaf3f", "325c858befc5", "5d4f4372c103", "04b03bf17bc9", "0607bdc14073", "f21292825d84", "9f6e4229a9f9", "e614d8a02f7f", "f5ca20492fbb", "bb886be5966d", "0cf4bb2d8c31", "a559b615edf2", "8ad7f6099d81", "3dad6b04228b", "ead1c71307e2", "4b47b44b2fb1", "c40831afc9b7", "1f7a4bc9e378", "9e9f08f64fca", "5b8c3dbffa50", "76ae82695b03", "dcf7795be52d", "2bb779ce372c", "87b267f184d2", "e373574277a6", "50e60e1151b5", "3dd502af80e9", "b33faf0b21ef", "b3fb1df41d76", "ad0afdb1e95c", "c43b37515e84", "2c6823c292a1", "64c158a5a5b3", "20efaf2cb1c8", "4ab7b2661820", "12c7e3d3fbc2", "845ce2965787", "42c16d0defcd", "b8c8c9465b84", "de6add48034a", "7b99ae3c76b3", "26ee7635d1c0", "f446aa044ce6", "a3cdf784fe00", "1fbb6a34fe89", "905b46d31104", "944ca6d65631", "c167c69d436d", "9a0b1fd3c2bc", "f85b02998195", "32dce33b0c13", "dcd41e8ef966", "f8e4d03537bd", "c69fce88a5d4", "83d7f566b524"]
[stegos_blockchain::blockchain] Registered a macro block: epoch=2, block=274097597131, inputs=["df7b60876366"], outputs=["9c3940c6e076", "01470fe655a6", "8806f75cd82f", "66b81b8bb919", "af471428709e", "a43e044d68be", "6f343c12a4e9", "67d5eaedf65c", "e494ddf85ec7", "f95f2be1f42a", "141f73623e9e", "b555fe2de42c", "53928e98fd0b", "e939bb5ef56b", "aeace9f6e5f3", "da74fb13a672", "baecaffa851d", "e57c250a77d0", "0259b9d7cd8a", "282e5e9c1bb5", "372d47439e78", "6a4fc72491f8", "e17611610d72", "002ce2e1f3df", "83260c621946", "228cad3b252d", "c0b5df04cb7d", "ae58feab2295", "e7025e2eb49e", "af46fd1978cc", "bae56df971bd", "db9df5c88c5c", "24d6bb6376ce", "383fa2cfa811", "e181ff8520c7", "55ccb45a998a", "8189ae47c22e", "d88c0e6fb5e4", "f5e458be8d07", "3d36f28775fe", "69316a81c942", "30ad978c6f31", "3cc5ae9fbf8f", "623c7b7dae49", "ebe313be39cd", "9daaa3ac1f23", "c99b1fdcd022", "fb99227757ce", "f6495e60c45e", "8d71dc0cad92", "bc790a445345", "22c50c2e9539", "2556ea4535a3", "0e5dbc3eb5d0", "10d165e3a8f4", "f427f3cee49a", "3c5ad92b70fa", "ec3ada2b9786", "c28056a38da0", "d75afb405c3b", "dfb71c7eb398", "79eb0020d601", "21298b435832"]
[stegos_blockchain::blockchain] Registered a macro block: epoch=3, block=afe9ad950976, inputs=["e6ac9c730b29", "efe2e7d9345e", "d9befd7ce04a", "51258f1845d1", "dd73ad6ed665", "c4a71cb7b835", "e5790f9a6867", "a3ed2635fd36", "9970bfac521a", "13565df8dbd5", "4ca223595e0f", "e93466e994ee", "32ea8bb76ffc", "6d40fe3a0032", "3f0beb5ca4f5", "67bf703e0898", "2cda2eee109e", "6d9e1b1b90a0", "ab37d6de1139", "ad49e09badb6", "58cbbce24c97", "9769fdebb0bb", "bd36a6c800e0", "ca8ebc480107", "78012f4be696", "afccfddc0cd5", "509357d0641a", "b7e01f660353", "d7063c1d0045", "4c9308e435f4", "89a9c2f846ca", "d52afa361b21"], outputs=["301bea8310fa", "b8c790e99d95", "d1d6ae437e73", "0728ea85e189", "7803a6edd227", "d0e0046c4eb3", "bd146c52986e", "f01fd098de0d", "9e7fb4c810a4", "fe3c936f3df8", "be4278261f13", "c7cfd507e5aa", "37b49401e33d", "2a6efca368be", "b605703068b6", "e368d52f5d2c", "027a2c59642f", "75bfa5069496", "35e1fcc3724b", "50e2296dfcf7", "3c896545e656", "973f2e0d0a54", "c54883a0cb3d", "f44be65bb2fb", "ced904878a8e", "01320612f3cf", "07d5ea062f85", "96ba5da7d867", "8b61720550a6", "b938c06c645f", "047cd87af55e", "4b1f8545260c", "b0c28959fbe6", "3c48950769e2", "03e4fbfb5622", "e935a278f82d", "63dda65fac00", "7af778726225", "14e6a0351389", "3bd1db2070dc", "a189f86079b5", "15c03c0bb956", "9878c270bae4", "532961ad49e5", "fc42087cffa2", "936abb6b7bc6", "e8c4fcd68653", "276e844c765a", "a8c45a3b3110", "00d99d457ddb", "3765063bdf75", "c3e20c933efb", "db8b39163254", "70c57bdd4941", "82dee76e676b", "c3ee9fd47fa7", "a88169922017", "89b8ecfe4e7c", "658dbdbddbb8", "ac13dcf56664", "ccb8bdc3e371", "143c257ed620", "71739d5f2543", "5d6405078679", "586ae92e3877", "e9f0caf69630", "d35ac9cf9f46", "3665891f804b", "88afc847a17a", "340ab11c8064", "9372ed5ca2f2", "6ab4291eab78", "c10770d5cdad", "5c40e979efb1", "ae0df4519a9b", "c29ca68aa7e2", "ecf0365e0597", "3dc26cb08549", "d3360fcbc420", "24dfbc886752", "60c1d399f7b3", "59c70d298aff", "0cbcc1975da8", "c88be76db421", "c9a60c11f51c", "f4672510fcff", "de95ce00b33a", "6918fa5c6538", "0da55655a66b", "9fa719012ba5", "e0d75d4c90dd", "73467e041581", "0ad4bf2f1a96"]
...
[stegos_blockchain::blockchain] Recovered blockchain from the disk: epoch=3855, offset=10, last_block=e4aa224936e9
{{< / highlight >}}

{{% notice note %}}Please use different data directories for different networks, e.g. {{< code >}}--data-dir path/to/testnet{{< /code >}} for {{< code >}}testnet{{< /code >}}, {{< code >}}--data-dir path/to/mainnet{{< /code >}} for {{< code >}}mainnet{{< /code >}}.{{% / notice %}}

The WebSocket API server will start on 3145 port:


{{< highlight bash "linenos=inline" >}}
INFO [stegos_api::server] Starting API Server on 127.0.0.1:3145
{{< / highlight >}}

The network layer will try to authenticate in peer-to-peer network:

{{< highlight bash "linenos=inline" >}}
[stegosd] Adding node from seed pool: /ip4/52.221.197.23/tcp/10056
[stegosd] Adding node from seed pool: /ip4/54.89.181.2/tcp/10056
[stegosd] Adding node from seed pool: /ip4/54.254.166.86/tcp/10056
...
[stegos_network::libp2p_network] Network endpoints: node_id=775070b757e1, peer_id=QmVmURFbMiHpcRyGzXnkyS6NiPPv2UquZzr2muDuwdQoR1
[stegos_network::gatekeeper::behavior] Solving a VDF puzzle: peer_id=PeerId("QmXrDG958SkPrQ95ZVcwKmvh9GTLtXitqxhqmWAVhNWMZg")
[stegos_network::gatekeeper::behavior] Solved a VDF puzzle: peer_id=PeerId("QmXrDG958SkPrQ95ZVcwKmvh9GTLtXitqxhqmWAVhNWMZg")
...
INFO [stegosd] Network is ready
{{< / highlight >}}

After connecting to the network, Node will try to synchronize the blockchain database:

{{< highlight bash "linenos=inline" >}}
INFO [stegos_node::loader] Downloading blocks: from=481ba8e8d5d9, epoch=1, reason='init'                                                                                             2019-08-12 15:40:06 INFO [stegos_network::gatekeeper::behavior] Solving a VDF puzzle: peer_id=PeerId("QmNVoa8fDUkNaZhcNqLvakaaZH8TZiyS2gLs5rdHTLeN3t")                                                   
INFO [stegos_node::loader] Received blocks: from=481ba8e8d5d9, first_epoch=1, our_epoch=1, last_epoch=50, num_blocks=50                                                              
INFO [stegos_node::loader] Downloading blocks: from=ccea059db0a1, epoch=51, reason='prefetch'                                                                                        
INFO [stegos_blockchain::blockchain] Registered a macro block: epoch=1, block=8c34ff7da352, inputs=[], outputs=["845ce2965787", "42c16d0defcd", "ead1c71307e2", "1fbb6a34fe89", "c69f
ce88a5d4", "a559b615edf2", "26ee7635d1c0", "a3cdf784fe00", "4b47b44b2fb1", "0cac9d0dd3d7", "83d7f566b524", "f21292825d84", "3dad6b04228b", "9a0b1fd3c2bc", "dcf7795be52d", "0607bdc14073", "9e9f08f64fca"
, "f8e4d03537bd", "b9c408dbd550", "76ae82695b03", "8ad7f6099d81", "32dce33b0c13", "97392156e93d", "9f6e4229a9f9", "4ab7b2661820", "20efaf2cb1c8", "2c6823c292a1", "3dd502af80e9", "5d4f4372c103", "f85b02
998195", "e614d8a02f7f", "b33faf0b21ef", "50e60e1151b5", "dcd41e8ef966", "c43b37515e84", "f5ca20492fbb", "0cf4bb2d8c31", "c40831afc9b7", "c167c69d436d", "2bb779ce372c", "bb886be5966d", "b8c8c9465b84",
"9edc64443130", "64c158a5a5b3", "a8f300945a8a", "46f095ce0594", "f446aa044ce6", "209eba3aaf3f", "7b99ae3c76b3", "325c858befc5", "e373574277a6", "5b8c3dbffa50", "de6add48034a", "87b267f184d2", "1f7a4bc9
e378", "b3fb1df41d76", "905b46d31104", "04b03bf17bc9", "12c7e3d3fbc2", "ad0afdb1e95c", "944ca6d65631"]
..
INFO [stegos_node] Synchronized with the network: epoch=100500, last_block=8c34ff7da352
{{< / highlight >}}

Synchronization can take up to one day. Please be patient and wait for "Synchronized with the network" message.

{{% notice tip %}}Your Node is up running.{{% / notice %}}

