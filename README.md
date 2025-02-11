# DIll Alps Incentivized Network (Stage 2)

![Alps_](https://github.com/user-attachments/assets/33a4f471-e904-4de1-9440-b5bb3326a172)



## DIll Alps Incentivized Network — is a high-scalable and highly secure next-generation DA (Data Availability) network.

Pre-Seed Investors: Find Satoshi Lab, Modular Capital, Victor Ji, Santiago R. Santos, TN Lee. Incubator — Binance Labs. 


Node requirements: Light validator — 2cCPU/2gbRAM/20gbSSD; Full validator — 4cCPU/8gbRAM/256gbSSD


To fully participate in the Alps testnet, you must complete the quests on https://app.galxe.com/quest/Dill/GCgJAtvF1h?referral_code=GRFr2Jksp6m_3iKpJt8KpWgvVLdOBGj_Evdjesl3hMsCvr5 . 

![image](https://github.com/user-attachments/assets/0e3d0846-8220-435f-bc0c-9bfcf25ec75c)

In order to gain access to the node, do not click Claim on the site immediately if you are going to use the referral system to get activity points. 


The rules(Stage 1) of getting nodes can be found at https://docs.google.com/document/d/12sYjNaj5BK8Nsna8NIzjjqWYoxqeYkKG-9gpcm5AgLM/edit?tab=t.0#heading=h.g0i8lrk2ooq4 . 


Claim points only at the end of the phase, which is announced on Dill's Discord Server - https://discord.gg/PzAJGanp .

### What's required:
- Server on Linux
- Roles on Dill's Discord (andes-validator or alps-validator)

## Node installation


If you have been given roles (andes-validator or alps-validator) in Dill's Discord, then you have access to run nodes. You can also check the list in the | announcments channel.


Official Guide - https://dill.xyz/docs/RunANode/Alps


First, add the Dill network to your wallet:


RPC URL:
```
https://rpc-alps.dill.xyz
```
Chain ID:
```
102125
```
Currency Symbol: 
```
DILL
```
Explorer:	
```
https://alps.dill.xyz
```

Get tokens in the Discord channel - https://discord.com/channels/1236933703251394570/1256093082672173096 , by sending the message $request 0xYourEVMaddress to the chat. 


After that, run the script: 
```
curl -sO https://raw.githubusercontent.com/DillLabs/launch-dill-node/main/dill.sh  && chmod +x dill.sh && ./dill.sh
```
Then follow the instructions in the terminal.
For the first launch, select 1. Launch a new dill node. After that, generate a new memonic (seed phrase) and save it in a safe place. Then save your generated password. Then select: 1. 3600 for Light and 2. 36000 for Full.
Enter the address of your EVM wallet. 
If you have done everything correctly, you will see these logs:

![image](https://github.com/user-attachments/assets/bc508466-a5b4-4db2-abbf-6d604754f790)


In order for node to start working, we need to stake Dill Tokens. Copy the data of the file deposit_data-*****.json in the dill/validator_keys/ directory and paste it to https://staking.dill.xyz/en/. Click Continue and connect your EVM wallet. Then click the button below and confirm the operation. Congratulations, you're staked your Dill's.Congratulations, you're your Dill's

After a while your node will appear in the list of active nodes at https://alps.dill.xyz/validators , search the data you can get using the show_pubkey.sh command.
```
cd dill
./show_pubkey.sh
```
If you want to run a second node, use: 
```
./2_add_validator.sh -v
```



## !INSTRUCTIONS FOR USE!

Check node status: ./health_check.sh

Display node public keys: ./show_pubkey.sh

Start node: ./start_dill_node.sh

Stop node: ./stop_dill_node.sh

## Automating Dill Node health checks

![image](https://github.com/user-attachments/assets/c0472558-4b75-4683-8d8a-2f7209f334d2)

Use our script to keep a node up and running.

The script checks the status every 15 minutes, saving logs to the file node_health_log.txt 

Functionality: 

    1) Start Application

    2) Stop Application

    3) View Logs

    4) Exit

To use the script, paste the text below into the terminal:

```
curl -sO https://raw.githubusercontent.com/NodeMafia/DillNodeGuide/refs/heads/main/DillCheck.sh && chmod +x DillCheck.sh && ./DillCheck.sh
```
The script only works if your Dill directory is located at the path $USER/dill (Example: root/dill). 

# NodeMafia
EN Telegram: soon..
RU Telegram: https://t.me/NodeMafia
GitHub: https://github.com/NodeMafia
