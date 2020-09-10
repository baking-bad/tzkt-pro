### Create Views

#### Accounts

View names: 
**users** (Type = 1)
**delegates** (Type = 2)
**contracts** (Type = 3)

Comments:
*"Implicit accounts (tz) that are not registered as delegates"*
*"Implicit accounts (tz) that are registered as delegates"*
*"Originated accounts (KT) that have code"*

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |                          |                                                              |
| Address | address | Public key hash of the account |
| Type |  |  |
| FirstLevel | first_level | Block height of the first operation related to the account |
| LastLevel | last_level | Height of the block in which the account state was changed last time |
| Balance | balance | Account balance/Total balance of the delegate (baker), including spendable and frozen funds (micro tez) |
| Counter | counter | An account nonce which is used to prevent operation replay |
| ContractsCount | num_contracts | Number of contracts, created (originated) and/or managed by the account |
| DelegationsCount | num_delegations | Number of delegation operations, related to the account |
| OriginationsCount | num_originations | Number of all origination (deployment / contract creation) operations, related to the account |
| TransactionsCount | num_transactions | Number of all transaction (tez transfer) operations, related to the account |
| RevealsCount | num_reveals | Number of reveal (is used to reveal the public key associated with an account) operations of the contract |
| MigrationsCount | num_migrations | Number of migration (result of the context (database) migration during a protocol update) operations, related to the account (synthetic type) |
| DelegateId **[User, Contract]** | delegate_id |  |
| **[User, Contract]** Accounts.address JOIN ON Accounts.Id = DelegateId | delegate | Address of the current delegate of the account. `null` if it's not delegated |
| **[User, Contract]** DelegationLevel | delegation_level | Block height of latest delegation. `null` if it's not delegated |
| Staked | is_staked | Whether account participates in staking (bakes or delegates) |
| **[Contract]** CASE WHEN Kind = **1** THEN **delegator_contract** WHEN Kind = **2** THEN **smart_contract** ELSE NULL | kind | Sub kinds: `delegator_contract` (aka manager.tz) or `smart_contract` |
| Spendable |  |  |
| **[Contract] **CreatorId | creator_id               |  |
| **[Contract]** Accounts.address FROM JOIN Accounts ON Accounts.Id = CreatorId | creator                  | Address of the account, which has deployed the contract to the blockchain |
| ManagerId |  |  |
| WeirdDelegateId |  |  |
| **[Delegate]** Activated | is_activated             | Delegation status (`true` - active, `false` - deactivated) |
| **[User, Contract]** PublicKey | public_key               | Base58 representation of account's public key, revealed by the account |
| **[Delegate]** Revealed | revealed | Public key revelation status. Unrevealed account can't send manager operation (transaction, origination etc.) |
| **[Delegate]** ActivationLevel | activation_level | Block height when delegate (baker) was registered as a baker last time |
| **[Delegate]** DeactivationLevel | deactivation_level | Block height when delegate (baker) was deactivated as a baker because of lack of funds or inactivity |
| **[Delegate]** FrozenDeposits | frozen_deposits          | Amount of security deposit, currently locked for baked (produced) blocks and (or) given endorsements (micro tez) |
| **[Delegate]** FrozenRewards | frozen_rewards           | Amount of currently frozen baking rewards (micro tez) |
| **[Delegate]** FrozenFees | frozen_fees | Amount of currently frozen fees paid by operations inside blocks, baked (produced) by the delegate (micro tez) |
| **[Delegate]** DelegatorsCount | delegators_count         | Number of current delegators (accounts, delegated their funds) of the delegate (baker) |
| **[Delegate]** StakingBalance | staking_balance | Sum of delegate (baker) balance and delegated funds minus frozen rewards (micro tez) |
| **[Delegate]** BlocksCount | num_blocks | Number of baked (validated) blocks all the time by the delegate (baker) |
| **[Delegate]** EndorsementsCount | num_endorsements         | Number of given endorsements (approvals) by the delegate (baker) |
| **[Delegate]** BallotsCount | num_ballots | Number of submitted by the delegate ballots during a voting period |
| **[Delegate]** ProposalsCount | num_proposals | Number of submitted (upvoted) by the delegate proposals during a proposal period |
| **[Delegate]** DoubleBakingCount | num_double_bakings | Number of double baking (baking two different blocks at the same height) evidence operations, included in blocks, baked (validated) by the delegate |
| **[Delegate]** DoubleEndorsingCount | num_double_endorsings | Number of double endorsement (endorsing two different blocks at the same block height) evidence operations, included in blocks, baked (validated) by the delegate |
| **[Delegate]** NonceRevelationsCount | num_nonce_revelations | Number of seed nonce revelation (are used by the blockchain to create randomness) operations provided by the delegate |
| **[Delegate]** RevelationPenaltiesCount | num_revelation_penalties | Number of operations for all time in which rewards were lost due to unrevealed seed nonces by the delegate (synthetic type) |

#### ActivationOps

View name: **activations**

Comment: *Used to activate accounts that were recommended allocations of tezos tokens for donations to the Tezos Foundation’s fundraiser.*

| Select/Join | As | Comment |
| ---- | ---- | -------- |
| Id |            |                                                              |
| Level | level | The height of the block, from the genesis block, in which the operation was included |
| Timestamp | timestamp  | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| AccountId | account_id |  |
| Accounts.Address JOIN ON Accounts.Id = AccountId | account | Address of the activated account |
| Balance | balance | Account activation balance of tezos tokens that were recommended allocations for donations to the Tezos Foundation’s fundraiser |

#### AppState

View name: **summary**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |  |  |
| KnownHead |  |  |
| LastSync |  |  |
| Level | level | The height of the block |
| Timestamp | timestamp | Datetime of the block (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| Protocol | protocol | Protocol hash |
| NextProtocol | next_protocol | Next protocol hash |
| Hash | block_hash | Block hash |
| AccountCounter |  |  |
| OperationCounter |  |  |
| ManagerCounter |  |  |
| AccountsCount | num_accounts | Total number of accounts of all types (user, delegate, contract) seen till this block (inclusive) |
| BlocksCount |  |  |
| ProtocolsCount | num_protocols |  |
| ActivationOpsCount | num_activations | Total number of account activations applied till this block (inclusive) |
| BallotOpsCount | num_ballots | Total number of ballot operations applied till this block (inclusive) |
| DelegationOpsCount | num_delegations | Total number of delegation operations applied till this block (inclusive) |
| DoubleBakingOpsCount | num_double_bakings | Total number of double baking evidences published till this block (inclusive) |
| DoubleEndorsingOpsCount | num_double_endorsings | Total number of double endorsing evidences published till this block (inclusive) |
| EndorsementOpsCount | num_endorsements | Total number of endorsements applied till this block (inclusive) |
| NonceRevelationOpsCount | num_nonce_revelations | Total number of nonce revelations applied till this block (inclusive) |
| OriginationOpsCount | num_originations | Total number of originations applied till this block (inclusive) |
| ProposalOpsCount | num_proposals | Total number of proposal operations applied till this block (inclusive) |
| RevealOpsCount | num_reveals | Total number of reveal operations applied till this block (inclusive) |
| TransactionOpsCount | num_transactions | Total number of transactions applied till this block (inclusive) |
| MigrationOpsCount | num_migrations | Total number of migrations applied till this block (inclusive) |
| RevelationPenaltyOpsCount | num_revelation_penalties | Total number of revelation penalties applied till this block (inclusive) |
| ProposalsCount | num_protocol_proposals | Total number of protocol proposals seen till this block (inclusive) |
| CyclesCount | num_cycles | Total number of cycles |
| QuoteBtc | xtz_btc | XTZ/BTC price |
| QuoteEur | xtz_eur | XTZ/EUR price |
| QuoteLevel | quote_level | *Used in async mode* |
| QuoteUsd | xtz_usd | XTZ/USD price |

#### BakerCycles

View name: **rewards**

Comment: *Baker rewards/penalties per cycle with breakdown by reward/penalty kind*

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |  |  |
| Cycle | cycle | Cycle in which rewards have been or will be earned. |
| BakerId | baker_id |  |
| Account.Address JOIN ON Accounts.Id = BakerId | baker | Baker address |
| Rolls | num_rolls |  |
| StakingBalance | staking_balance | Staking balance of the baker at the snapshot time. |
| DelegatedBalance | delegated_balance | Balance delegated to the baker at the snapshot time (sum of delegators' balances). |
| DelegatorsCount | num_delegators | Number of delegators at the snapshot time. |
| FutureBlocks | num_future_blocks | Number of blocks which baker is allowed to produce in this cycle based on future baking rights. |
| OwnBlocks | num_own_blocks | Number of successfully baked blocks with priority `0`. |
| ExtraBlocks | num_extra_blocks | Number of successfully baked blocks with priority `1+`. |
| MissedOwnBlocks | num_missed_own_blocks | Number of blocks which were missed at priority `0` for no apparent reason (usually due to issues with network or node). |
| MissedExtraBlocks | num_missed_extra_blocks | Number of blocks which were missed at priority `1+` for no apparent reason (usually due to issues with network or node). |
| UncoveredOwnBlocks | num_uncovered_own_blocks | Number of blocks which were missed at priority `0` due to lack of bonds (for example, when a baker is overdelegated). |
| UncoveredExtraBlocks | num_uncovered_extra_blocks | Number of blocks which were missed at priority `1+` due to lack of bonds (for example, when a baker is overdelegated). |
| FutureEndorsements | num_future_endorsements | Number of slots which baker is allowed to validate in this cycle based on future endorsing rights. |
| Endorsements | num_endorsements | Number of successfully endorsed slots. |
| MissedEndorsements | num_missed_endorsements | Number of endorsing slots which were missed for no apparent reason (usually due to issues with network or node). |
| UncoveredEndorsements | num_uncovered_endorsements | Number of endorsing slots which were missed due to lack of bonds (for example, when a baker is overdelegated). |
| FutureBlockRewards | future_block_rewards | Estimated value of future block rewards. |
| OwnBlockRewards | own_block_rewards | Rewards received for blocks baked with priority `0`. |
| ExtraBlockRewards | extra_block_rewards | Rewards received for blocks baked with priority `1+`. |
| MissedOwnBlockRewards | missed_own_block_rewards | Rewards which were not received due to missing own blocks. |
| MissedExtraBlockRewards | missed_extra_block_rewards | Rewards which were not received due to missing extra blocks. |
| UncoveredOwnBlockRewards | uncovered_own_block_rewards | Rewards which were not received due to missing own blocks due to lack of bonds. |
| UncoveredExtraBlockRewards | uncovered_extra_block_rewards | Rewards which were not received due to missing extra blocks due to lack of bonds. |
| FutureEndorsementRewards | future_endorsement_rewards | Estimated value of future endorsing rewards. |
| EndorsementRewards | endorsement_rewards | Rewards received for endorsed slots. |
| MissedEndorsementRewards | missed_endorsement_rewards | Rewards which were not received due to missing endorsements. |
| UncoveredEndorsementRewards | uncovered_endorsement_rewards | Rewards which were not received due to missing endorsements due to lack of bonds. |
| OwnBlockFees | own_block_fees | Operation fees which were harvested from successfully baked blocks with priority `0`. |
| ExtraBlockFees | extra_block_fees | Operation fees which were harvested from successfully baked blocks with priority `1+`. |
| MissedOwnBlockFees | missed_own_block_fees | Operation fees which were not received due to missing own blocks. |
| MissedExtraBlockFees | missed_extra_block_fees | Operation fees which were not received due to missing extra blocks. |
| UncoveredOwnBlockFees | uncovered_own_block_fees | Operation fees which were not received due to missing own blocks (due to lack of bonds). |
| UncoveredExtraBlockFees | uncovered_extra_block_fees | Operation fees which were not received due to missing extra blocks (due to lack of bonds). |
| DoubleBakingRewards | double_baking_rewards | Rewards for detecting double baking (accusing someone of producing two different blocks at the same level). |
| DoubleBakingLostDeposits | double_baking_lost_deposits | Bonds lost due to double baking |
| DoubleBakingLostRewards | double_baking_lost_rewards | Rewards lost due to double baking |
| DoubleBakingLostFees | double_baking_lost_fees | Fees lost due to double baking |
| DoubleEndorsingRewards | double_endorsing_rewards | Rewards for detecting double endorsing (accusing someone of validating two different blocks at the same level). |
| DoubleEndorsingLostDeposits | double_endorsing_lost_deposits | Bonds lost due to double endorsing |
| DoubleEndorsingLostRewards | double_endorsing_lost_rewards | Rewards lost due to double endorsing |
| DoubleEndorsingLostFees | double_endorsing_lost_fees | Fees lost due to double endorsing |
| RevelationRewards | revelation_rewards | Rewards for including into a block seed nonce revelation operations. |
| RevelationLostRewards | revelation_lost_rewards | Rewards lost due to missing seed nonce revelation. |
| RevelationLostFees | revelation_lost_fees | Fees lost due to missing seed nonce revelation. |
| FutureBlockDeposits | future_block_deposits | Estimated value of bonds which will be locked as security deposit for future blocks. |
| BlockDeposits | block_deposits | Bonds which were locked as a security deposit for baking own and extra blocks. |
| FutureEndorsementDeposits | future_endorsement_deposits | Estimated value of bonds which will be locked as security deposit for future endorsements. |
| EndorsementDeposits | endorsement_deposits | Bonds which were locked as a security deposit for endorsed slots. |
| ExpectedBlocks | expected_blocks | Expected value of how many blocks baker should produce based on baker's rolls, total rolls and blocks per cycle. |
| ExpectedEndorsements | expected_endorsements | Expected value of how many slots baker should validate based on baker's rolls, total rolls and endorsing slots per cycle. |
| OwnBlockRewards + ExtraBlockRewards + EndorsementRewards + OwnBlockFees + ExtraBlockFees + RevelationRewards + DoubleBakingRewards + DoubleEndorsingRewards | total_rewards | Total cycle rewards (positive) |
| DoubleBakingLostDeposits + DoubleBakingLostRewards + DoubleBakingLostFees + DoubleEndorsingLostDeposits + DoubleEndorsingLostRewards + DoubleEndorsingLostFees + RevelationLostRewards + RevelationLostFees | total_penalties | Total cycle penalties |

#### BakingRights

View name: **rights**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |  |  |
| Cycle | cycle | Cycle on which the right can be realized. |
| Level | level | Level at which a block must be baked or an endorsement must be sent. |
| BakerId | baker_id |  |
| Accounts.Address JOIN ON Accounts.Id = BakerId | baker | Baker address to which baking or endorsing right has been given. |
| CASE WHEN Type = **1** THEN **baking** WHEN Type = **2** THEN **endorsing** ELSE NULL | type | `baking` - right to bake (produce) a block;<br /> `endorsing` - right to endorse (validate) a block. |
| CASE WHEN Status = **1** THEN **future** WHEN Status = **2** THEN **realized** WHEN Status = **3** THEN **uncovered** WHEN Status = **4** THEN **missed** ELSE NULL | status | `future` - the right is not realized yet;<br /> `realized` - the right was successfully realized;<br /> `uncovered` - the right was not realized due to lack of bonds (for example, when a baker is overdelegated);<br /> `missed` - the right was not realized for no apparent reason (usually due to issues with network or node). |
| Priority | priority | Priority (0 - ∞) with which baker can produce a block. If a baker with priority `0` doesn't produce a block within a given time interval, then the right goes to a baker with priority`1`, etc. For `endorsing` rights this field is always `null`. |
| Slots | num_slots | Number of slots (1 - 32) to be endorsed. For `baking` rights this field is always `null`. |

#### BallotOps

View name: **ballots**

Comment:  *used to vote for a proposal in a given voting cycle*

| Select/Join | As | Comment |
| ---- | ---- | -------- |
| Id |  |  |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| PeriodId | period_id |  |
| VotingPeriods.Code JOIN ON VotingPeriods.Id = PeriodId | voting_period | Index of the voting period for which the ballot was submitted |
| ProposalId | proposal_id |  |
| Proposals.Hash JOIN ON Proposals.Id = ProposalId | proposal | Hash of the proposal for which ballot was submitted |
| SenderId | baker_id |  |
| Accounts.Address JOIN ON Accounts.Id = SenderId | baker | Information about the delegate (baker), submitted the ballot |
| Rolls | num_rolls | Number of baker's rolls (baker's voting power) |
| Vote | vote          | Vote, given in the ballot (`yay`, `nay`, or `pass`) |

#### Blocks

View name: **blocks**

Comment:

| Select/Join | As | Comment |
| ---- | ----------- | -------- |
| Id |  |  |
| Level | level | The height of the block from the genesis block |
| Hash | hash | Block hash |
| Timestamp | timestamp | The datetime at which the block is claimed to have been created (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| ProtoCode | proto_code | Protocol code, representing a number of protocol changes since genesis (mod 256, but `-1` for the genesis block) |
| Priority | priority | The position in the priority list of delegates at which the block was baked |
| Validations | num_endorsements | Number of endorsements, confirming the block |
| Events & 1 | is_cycle_start | This is the first block of the cycle |
| Events & 2 | is_cycle_end | This is the last block of the cycle |
| Events & 4 | is_protocol_start | This is the first block of a protocol |
| Events & 8 | is_protocol_end | This is the last block of a protocol |
| Events & 16 | is_voting_period_start | This is the first block of a voting period |
| Events & 32 | is_voring_period_end | This is the last block of a voting period |
| Events & 64 | has_deactivations | At least one delegate (baker) was deactivated in this block |
| Events & 128 | has_account_allocations | At least one account was allocated (via origination, activation, or transaction to a non-existent address) was deactivated in this block |
| Events & 256 | has_smart_contract_interaction | In this block a smart-contract (excluding manager.tz) was deployed or invoked. |
| Events & 512 | is_snapshot | This block was randomly chosen for making a snapshot of balances. |
| Events & 1024 | has_delegator_contract_interaction | In this block a delegator contract (manager.tz) was deployed or invoked. |
| Operations & 2 | has_ballots | At least one ballot operation was injected in this block. |
| Operations & 4 | has_proposals | At least one proposal operation was injected in this block. |
| Operations & 8 | has_activations | At least one activation operation was injected in this block. |
| Operations & 16 | has_double_bakings | At least one double baking accusation was injected in this block. |
| Operations & 32 | has_double_endorsings | At least one double endorsement accusation was in during this block. |
| Operations & 64 | has_revelations | At least one nonce revelation operation was injected in this block. |
| Operations & 128 | has_transactions | At least one transaction operation was injected in this block. |
| Operations & 256 | has_reveals | At least one reveal operation was injected in this block. |
| Operations & 512 | has_migrations | A context migration happened in this block. |
| Operations & 1024 | has_revelations_penalties | A penalty for not revealing seed nonce was applied in this block. |
| Reward | reward | Reward of the baker for producing the block (micro tez) |
| Fees | fees | Total fee paid by all operations, included in the block |
| BakerId | baker_id | Accounts |
| Accounts.Address JOIN ON Accounts.Id = BakerId | baker | Address of the delegate (baker), produced the block |
| RevelationId | revelation_id |  |
| ResetDeactivation |  |  |

#### Cycles

View name: **cycles**

| Select | As | Comment |
| ---- | :---------- | ----------- |
| Id |  |  |
| Index | index | Cycle index starting from zero |
| SnapshotIndex | snapshot_index | Relative index of the snapshot |
| SnapshotLevel | snapshot_level | Height of the block where the snapshot was taken |
| TotalRolls | total_rolls | Total number of rolls involved in baking rights distribution |
| TotalStaking | total_staking | Total staking balance of all active in this cycle bakers |
| TotalDelegated | total_delegated | Total balance delegated to active bakers |
| TotalDelegators | total_delegators | Total number of active bakers' delegators |
| TotalBakers | total_bakers | Total number of all active in this cycle bakers |
| Seed | seed | Randomly generated seed used by the network for things like baking rights distribution etc. |

#### DelegationOps

View name: **delegations**

Comment: *used to delegate funds to a delegate (an implicit account registered as a baker)*

| Select/Join | As | Comment |
| ---- | ----------- | ---- |
| Id |  |  |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| SenderId | sender_id |  |
| Accounts.Address JOIN Accounts ON Accounts.Id = SenderId | sender | Address of the delegated account |
| Counter | counter | An account nonce which is used to prevent operation replay |
| BakerFee | baker_fee | Fee to a baker, produced block, in which the operation was included |
| StorageFee |  |  |
| AllocationFee |  |  |
| GasLimit | gas_limit | A cap on the amount of gas a given operation can consume |
| GasUsed | consumed_gas | Amount of gas, consumed by the operation |
| StorageLimit |  |  |
| StorageUsed |  |  |
| CASE WHEN Status = 1 THEN **applied** WHEN Status = 2 THEN **backtracked** WHEN Status = 3 THEN **skipped** WHEN Status = 4 THEN **failed** ELSE NULL | status | Operation status (`applied` - an operation applied by the node and successfully added to the blockchain, `failed` - an operation which failed with some particular error (not enough balance, gas limit, etc), `backtracked` - an operation which was successful but reverted due to one of the following operations in the same operation group was failed, `skipped` - all operations after the failed one in an operation group) |
| Errors | errors | List of errors provided by the node, which has injected the operation to the blockchain. `null` if there is no errors |
| InitiatorId | initiator_id |  |
| Accounts.Address JOIN ON Accounts.Id = InitiatorId | initiator | Address of the initiator of the delegation contract call |
| Nonce | nonce | An account nonce which is used to prevent internal operation replay |
| DelegateId | delegate_id |  |
| Accounts.Address JOIN ON Accounts.Id = DelegateId | delegate | Address of the delegate (baker) that accepted the delegation. `null` if delegate is not specified (undelegation operation) |
| PrevDelegateId | prev_delegate_id |  |
| Accounts.Address JOIN ON Accounts.Id = PrevDelegateId | prev_delegate | Address of the previous delegate of the account. `null` if there is no previous delegate |
| ResetDeactivation |  |  |

#### DelegatorCycles

View name: **balance_snapshots**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |  |  |
| Cycle | cycle        |  |
| DelegatorId | delegator_id |  |
| Accounts.Address JOIN ON Accounts.Id = DelegatorId | delegator |  |
| BakerId | baker_id |  |
| Accounts.Address JOIN ON Accounts.Id = BakerId | baker |  |
| Balance | balance |  |

#### DoubleBakingOps

View name: **double_bakings**

Comment: 

| Name | As | Comment |
| ---- | ----------- | ---- |
| Id |  |  |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| AccusedLevel | accused_level | The height of the block from the genesis block, which was double baked |
| AccuserId | accuser_id |  |
| Accounts.Address JOIN Accounts ON Accounts.Id = AccuserId | accuser | Address of the baker (delegate), produced the block, in which the operation was included |
| AccuserReward | accuser_reward | Reward of the baker (delegate), produced the block, in which the operation was included |
| OffenderId | offender_id |  |
| Accounts.Address JOIN ON Accounts.Id = OffenderId | offender | Address of the baker (delegate), accused for producing two different blocks at the same height |
| OffenderLostDeposit | offender_lost_deposits | Amount of frozen security deposit, lost by accused baker (delegate) |
| OffenderLostReward | offender_lost_rewards | Amount of frozen rewards, lost by accused baker (delegate) |
| OffenderLostFee | offender_lost_fees | Amount of frozen fees, lost by accused baker (delegate) |

#### DoubleEndorsingOps

View name: **double_endorsings**

Comment:

| Name                                              | As                     | Comment                                                      |
| ------------------------------------------------- | ---------------------- | ------------------------------------------------------------ |
| Id                                                |                        |                                                              |
| Level                                             | level                  | The height of the block from the genesis block, in which the operation was included |
| Timestamp                                         | timestamp              | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash                                            | hash                   | Hash of the operation                                        |
| AccusedLevel                                      | accused_level          | The height of the block from the genesis block, at which double endorsing occurred |
| AccuserId                                         | accuser_id             |                                                              |
| Accounts.Address JOIN ON Accounts.Id = AccuserId  | accuser                | Address of the baker (delegate), produced the block, in which the operation was included |
| AccuserReward                                     | accuser_reward         | Reward of the baker (delegate), produced the block, in which the operation was included |
| OffenderId                                        | offender_id            |                                                              |
| Accounts.Address JOIN ON Accounts.Id = OffenderId | offender               | Address of the baker (delegate), accused for producing two different endorsements at the same height |
| OffenderLostDeposit                               | offender_lost_deposits | Amount of frozen security deposit, lost by accused baker (delegate) |
| OffenderLostReward                                | offender_lost_rewards  | Amount of frozen rewards, lost by accused baker (delegate)   |
| OffenderLostFee                                   | offender_lost_fees     | Amount of frozen fees, lost by accused baker (delegate)      |

#### EndorsementOps

View name: **endorsements**

Comment:

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |             |                                                              |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| DelegateId | delegate_id |  |
| Accounts.Address JOIN ON Accounts.Id = DelegateId | delegate | Address of the baker (delegate) who sent the operation |
| Slots | num_slots | Number of assigned endorsement slots (out of 32) to the baker (delegate) who sent the operation |
| Reward | reward | Reward of the baker (delegate) for the operation |
| ResetDeactivation |  |  |

#### MigrationOps

View name: **migrations**

Comment: *A result of the context (database) migration during a protocol update (synthetic type)*

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |                |                                                              |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| AccountId | account_id |  |
| Accounts.Address JOIN ON Accounts.Id = AccountId | account | Address of the account whose balance has updated as a result of the operation |
| CASE WHEN Kind = **1** THEN **bootstrap** WHEN Kind = **2** THEN **activate_delegate** WHEN Kind = **3** THEN **airdrop** WHEN Kind = **4** THEN **proposal_invoice** ELSE NULL | kind | Kind of the migration<br /> `bootstrap` - Balance updates, included in the first block after genesis `activate_delegate` - registering a new baker (delegator) during protocol migration `airdrop` - airdrop of 1 micro tez during Babylon protocol upgrade `proposal_invoice` - invoice for creation a proposal for protocol upgrade |
| BalanceChange | balance_change | The amount for which the operation updated the balance (micro tez) |

#### NonceRevelationOps

View name: **nonce_revelations**

Comment: 

| Select/Join | As | Commen |
| ---- | ---- | ----------- |
| Id |                |                                                              |
| Level | level          | The height of the block from the genesis block, in which the operation was included. |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation. |
| BakerId | baker_id |  |
| Accounts.Address JOIN ON Accounts.Id = BakerId | baker | Address of the delegate (baker), who produced the block with the operation. |
| SenderId | sender_id |  |
| Accounts.Address JOIN ON Accounts.Id = SenderId | sender | Address of the delegate (baker), who revealed the nonce (sent the operation). |
| RevealedLevel | revealed_level | Block height of the block, where seed nonce hash is stored. |

#### OriginationOps

View name: **originations**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |  |  |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| SenderId | sender_id |  |
| Accounts.Address JOIN ON Accounts.Id = SenderId | sender | Address of the account, created a contract |
| Counter | counter | An account nonce which is used to prevent operation replay |
| BakerFee | baker_fee | Fee to the baker, produced block, in which the operation was included (micro tez) |
| StorageFee | storage_burn | The amount of funds burned from the sender account for contract storage in the blockchain (micro tez) |
| AllocationFee | allocation_burn | The amount of funds burned from the sender account for contract account creation (micro tez) |
| GasLimit | gas_limit | A cap on the amount of gas a given operation can consume |
| GasUsed | consumed_gas | Amount of gas, consumed by the operation |
| StorageLimit | storage_limit | A cap on the amount of storage a given operation can consume |
| StorageUsed | paid_storage_size_diff | Amount of storage, consumed by the operation, that is subject to pay |
| CASE WHEN Status = **1** THEN **applied** WHEN Status = **2** THEN **backtracked** WHEN Status = **3** THEN **skipped** WHEN Status = **4** THEN **failed** ELSE NULL | status | Operation status (`applied` - an operation applied by the node and successfully added to the blockchain, `failed` - an operation which failed with some particular error (not enough balance, gas limit, etc), `backtracked` - an operation which was a successful but reverted due to one of the following operations in the same operation group was failed, `skipped` - all operations after the failed one in an operation group) |
| Errors | errors | List of errors provided by the node, injected the operation to the blockchain. `null` if there is no errors |
| InitiatorId | initiator_id |  |
| Accounts.Address JOIN ON Accounts.Id = InitiatorId | initiator | Address of the initiator of the contract call |
| Nonce | nonce | An account nonce which is used to prevent internal operation replay |
| ManagerId |  |  |
| DelegateId | delegate_id |  |
| Accounts.Address JOIN ON Accounts.Id = DelegateId | delegate | Address of the baker (delegate), which was marked as a contract delegate in the operation |
| ContractId | contract_id |  |
| Accounts.Address JOIN ON Accounts.Id = ContractId | originated_contract | Address of the originated ( deployed / created ) contract |
| Balance | balance | Initial contract balance (micro tez), transferred from the operation sender |

#### ProposalOps

View name: **proposals**

Comment:

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |                   |                                                              |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| PeriodId | period_id |  |
| VotingPeriods.Code JOIN ON VotingPeriods.Id = PeriodId | voting_period | Index of the proposal period for which the proposal was submitted (upvoted) |
| ProposalId | proposal_id |  |
| Proposals.Hash JOIN ON Proposals.Id = ProposalId | protocol_proposal | Hash of the submitted (upvoted) proposal |
| SenderId | baker_id          |  |
| Accounts.Address JOIN ON Accounts.Id = SenderId | baker | Address of the baker (delegate), submitted (upvoted) the proposal operation |
| Rolls | num_rolls | Number of baker's rolls (baker's voting power) |
| Duplicated | is_duplicate | Indicates whether proposal upvote has already been pushed. Duplicated proposal operations are not counted when selecting proposal-winner. |

#### Proposals

View name: **protocol_proposals**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |                       |                                                              |
| Hash | hash | Hash of the proposal, which representing a tarball of concatenated .ml/.mli source files |
| CASE WHEN Status = **1** THEN **active** WHEN Status = **2** THEN **accepted** WHEN Status = **3** THEN **skipped** WHEN Status = **4** THEN **rejected** ELSE NULL | status | Status of the proposal `active` - the proposal in the active state `accepted` - accepted for protocol upgrade proposal `skipped` - the proposal didn't pass the Proposal Period `rejected` - the proposal didn't reach a quorum during the Exploration or Promotion Period |
| InitiatorId | baker_id |  |
| Accounts.Address JOIN ON Accounts.Id = InitiatorId | baker | Address of the baker (delegate) submitted the proposal |
| Upvotes | total_rolls | The total number of rolls of all the bakers (delegates) who upvoted the proposal |
| ProposalPeriodId | proposal_period_id |  |
|  | proposal_period |  |
| ExplorationPeriodId | exploration_period_id |  |
| TestingPeriodId | testing_period_id |  |
| PromotionPeriodId | promotion_period_id |  |

#### Protocols

View name: **protocols**

Comment:

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |                              |                                                              |
| Code | code | Protocol code, representing a number of protocol changes since genesis (mod 256, but `-1` for the genesis block) |
| Hash | hash | Hash of the protocol |
| FirstLevel | first_level | Block height where the protocol was applied |
| LastLevel | last_level | Block height where the protocol ends. `null` if the protocol is active |
| PreservedCycles | preserved_cycles |  |
| BlocksPerCycle | blocks_per_cycle |  |
| BlocksPerCommitment | blocks_per_comitment |  |
| BlocksPerSnapshot | blocks_per_snapshot |  |
| BlocksPerVoting | blocks_per_voting |  |
| TimeBetweenBlocks | time_between_blocks |  |
| EndorsersPerBlock | endorsers_per_block |  |
| HardOperationGasLimit | hard_operation_gas_limit |  |
| HardOperationStorageLimit | hard_operation_storage_limit |  |
| HardBlockGasLimit | hard_block_gas_limit |  |
| TokensPerRoll | tokens_per_roll |  |
| RevelationReward | revelation_reward |  |
| BlockDeposit | block_deposit |  |
| BlockReward0 | block_reward_0 |  |
| BlockReward1 | block_reward_1 |  |
| EndorsementDeposit | endorsement_deposit |  |
| EndorsementReward0 | endorsement_reward_0 |  |
| EndorsementReward1 | endorsement_reward_1 |  |
| OriginationSize | origination_size             |  |
| ByteCost | byte_cost |  |

#### RevealOps

View name: **reveals**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |              |                                                              |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| SenderId | sender_id |  |
| Accounts.Address JOIN ON Accounts.Id = SenderId | sender | Address of the account who has sent the operation |
| Counter | counter | An account nonce which is used to prevent operation replay |
| BakerFee | baker_fee | Fee to the baker, produced block, in which the operation was included (micro tez) |
| StorageFee |  |  |
| AllocationFee |  |  |
| GasLimit | gas_limit | A cap on the amount of gas a given operation can consume |
| GasUsed | consumed_gas | Amount of gas, consumed by the operation |
| StorageLimit |  |  |
| StorageUsed |  |  |
| CASE WHEN Status = **1** THEN **applied** WHEN Status = **2** THEN **backtracked** WHEN Status = **3** THEN **skipped** WHEN Status = **4** THEN **failed** ELSE NULL | status | Operation status (`applied` - an operation applied by the node and successfully added to the blockchain, `failed` - an operation which failed with some particular error (not enough balance, gas limit, etc), `backtracked` - an operation which was successful but reverted due to one of the following operations in the same operation group was failed, `skipped` - all operations after the failed one in an operation group) |
| Errors | errors | List of errors provided by the node, injected the operation to the blockchain. `null` if there is no errors |

#### RevelationPenaltyOps

View name: **revelation_penalties**

Comment: *operation, in which rewards were lost due to unrevealed seed nonces by the delegate (synthetic type)*

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |              |                                                              |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| BakerId | baker_id |  |
| Accounts.Address JOIN ON Accounts.Id = BakerId | baker | Address of the delegate (baker) who has lost rewards due to unrevealed seed nonces |
| MissedLevel | missed_level | Height of the block, which contains hash of the seed nonce, which was to be revealed |
| LostReward | lost_rewards | Reward for baking the block, which was lost due to unrevealed seed nonces (micro tez) |
| LostFees | lost_fees | Lost due to unrevealed seed nonce total fee paid by all operations, included in the block, which was to be revealed (micro tez) |

#### SnapshotBalances

Not used

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |      |         |
| Level |  |  |
| Balance |  |  |
| AccountId |  |  |
| Accounts.Address JOIN ON Accounts.Id = AccountId |  | |
| DelegateId |  |  |
| Accounts.Address JOIN ON Accounts.Id = DelegateId |  | |

#### TransactionOps

View name: **transactions**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |                           |                                                              |
| Level | level | The height of the block from the genesis block, in which the operation was included |
| Timestamp | timestamp | Datetime of the block, in which the operation was included (ISO 8601, e.g. `2020-02-20T02:40:57Z`) |
| OpHash | hash | Hash of the operation |
| SenderId | sender_id |  |
|  | sender | Address of the account sent the transaction |
| Counter | counter | An account nonce which is used to prevent operation replay |
| BakerFee | baker_fee | Fee to the baker, produced block, in which the operation was included (micro tez) |
| StorageFee | storage_burn | The amount of funds burned from the sender account for used the blockchain storage (micro tez) |
| AllocationFee | allocation_burn | The amount of funds burned from the sender account for account creation (micro tez) |
| GasLimit | gas_limit | A cap on the amount of gas a given operation can consume |
| GasUsed | consumed_gas | Amount of gas, consumed by the operation |
| StorageLimit | storage_limit | A cap on the amount of storage a given operation can consume |
| StorageUsed | paid_storage_size_diff | Amount of storage, consumed by the operation |
| CASE WHEN Status = **1** THEN **applied** WHEN Status = **2** THEN **backtracked** WHEN Status = **3** THEN **skipped** WHEN Status = **4** THEN **failed** ELSE NULL | status | Operation status (`applied` - an operation applied by the node and successfully added to the blockchain, `failed` - an operation which failed with some particular error (not enough balance, gas limit, etc), `backtracked` - an operation which was successful but reverted due to one of the following operations in the same operation group was failed, `skipped` - all operations after the failed one in an operation group) |
| Errors | errors | List of errors provided by the node, injected the operation to the blockchain. `null` if there is no errors |
| InitiatorId | initiator_id |  |
|  | initiator | Address of the initiator of the transaction call |
| Nonce | nonce | An account nonce which is used to prevent internal operation replay |
| TargetId | destination_id |  |
|  | destination | Destination address |
| ResetDeactivation |  |  |
| Amount | amount | The transaction amount (micro tez) |
| Parameters | parameters | Parameters/code, passed to the target contract |
| InternalOperations & 1 | has_internal_delegations | At least one internal delegation operation |
| InternalOperations & 2 | has_internal_originations | At least one internal origination operation |
| InternalOperations & 4 | has_internal_transactions | At least one internal transaction operation |

#### VotingEpoches

Not used

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |      |         |
| Level |  |  |
| Progress |  |  |

#### VotingPeriods

View name: **voting_periods** (TODO)

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ----------- |
| Id |                   |         |
| Code | code |  |
| EpochId |  |  |
| Kind | kind |  |
| StartLevel | start_level |  |
| EndLevel | end_level |  |
| ProposalId | proposal_id |  |
|  | proposal | |
| TotalStake | total_stake |  |
| Participation | participation |  |
| Quorum | quorum |  |
| Abstainings | integer (integer) |  |
| Approvals | integer (integer) |  |
| Refusals | integer (integer) |  |
| PromotionPeriod_ProposalId | integer (integer) |  |
| PromotionPeriod_TotalStake | integer (integer) |  |
| PromotionPeriod_Participation | integer (integer) |  |
| PromotionPeriod_Quorum | integer (integer) |  |
| PromotionPeriod_Abstainings | integer (integer) |  |
| PromotionPeriod_Approvals | integer (integer) |  |
| PromotionPeriod_Refusals | integer (integer) |  |
| TestingPeriod_ProposalId | integer (integer) |  |

#### VotingSnapshots

View name: **voting_snapshots**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | -------- |
| Id |  |  |
| Level | level |  |
| PeriodId | period_id |  |
| Period.Code JOIN ON VoringPeriods.Id = PeriodId | voting_period |  |
| DelegateId | delegate_id |  |
| Accounts.Address JOIN ON Accounts.Id = DelegateId | delegate |  |
| Rolls | num_rolls |  |
