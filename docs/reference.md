### Create Views

#### Accounts

View names: 
**users** (Kind = user), 
**delegates** (Kind = delegate), 
**contracts** (kind = contract)

Comments: 
*"Implicit accounts (tz) that are not registered as delegates",*
*"implicit accounts (tz) that are registered as delegates",*
*"originated accounts (KT) that have code"*

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |                          |                                                              |
| Address | address | Public key hash of the account |
| Type |  |  |
| FirstLevel | first_level | Block height of the first operation, related to the account |
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
| **[User, Contract]** Accounts.address FROM JOIN Accounts ON Accounts.Id = DelegateId | delegate | Address of the current delegate of the account. `null` if it's not delegated |
| **[User, Contract]** DelegationLevel | delegation_level | Block height of latest delegation. `null` if it's not delegated |
| Staked | is_staked | Whether account participates in staking (bakes or delegates) |
| **[Contract]** Kind | kind | Sub kinds: `delegator_contract` (aka manager.tz) or `smart_contract` |
| Spendable |  |  |
| **[Contract] **CreatorId | creator_id               |  |
| **[Contract]** Accounts.address FROM JOIN Accounts ON Accounts.Id = CreatorId | creator                  | Address of the account, which has deployed the contract to the blockchain |
| ManagerId |  |  |
| WeirdDelegateId |  |  |
| **[Delegate]** Activated | is_activated             | Delegation status (`true` - active, `false` - deactivated) |
| **[User, Contract]** PublicKey | public_key               | Base58 representation of account's public key, revealed by the account |
| **[Delegate] **Revealed | revealed | Public key revelation status. Unrevealed account can't send manager operation (transaction, origination etc.) |
| **[Delegate] **ActivationLevel | activation_level | Block height when delegate (baker) was registered as a baker last time |
| **[Delegate] **DeactivationLevel | deactivation_level | Block height when delegate (baker) was deactivated as a baker because of lack of funds or inactivity |
| **[Delegate] **FrozenDeposits | frozen_deposits          | Amount of security deposit, currently locked for baked (produced) blocks and (or) given endorsements (micro tez) |
| **[Delegate] **FrozenRewards | frozen_rewards           | Amount of currently frozen baking rewards (micro tez) |
| **[Delegate] **FrozenFees | frozen_fees | Amount of currently frozen fees paid by operations inside blocks, baked (produced) by the delegate (micro tez) |
| **[Delegate] **DelegatorsCount | delegators_count         | Number of current delegators (accounts, delegated their funds) of the delegate (baker) |
| **[Delegate] **StakingBalance | staking_balance | Sum of delegate (baker) balance and delegated funds minus frozen rewards (micro tez) |
| **[Delegate] **BlocksCount | num_blocks | Number of baked (validated) blocks all the time by the delegate (baker) |
| **[Delegate] **EndorsementsCount | num_endorsements         | Number of given endorsements (approvals) by the delegate (baker) |
| **[Delegate] **BallotsCount | num_ballots | Number of submitted by the delegate ballots during a voting period |
| **[Delegate] **ProposalsCount | num_proposals | Number of submitted (upvoted) by the delegate proposals during a proposal period |
| **[Delegate] **DoubleBakingCount | num_double_bakings | Number of double baking (baking two different blocks at the same height) evidence operations, included in blocks, baked (validated) by the delegate |
| **[Delegate] **DoubleEndorsingCount | num_double_endorsings | Number of double endorsement (endorsing two different blocks at the same block height) evidence operations, included in blocks, baked (validated) by the delegate |
| **[Delegate] **NonceRevelationsCount | num_nonce_revelations | Number of seed nonce revelation (are used by the blockchain to create randomness) operations provided by the delegate |
| **[Delegate] **RevelationPenaltiesCount | num_revelation_penalties | Number of operations for all time in which rewards were lost due to unrevealed seed nonces by the delegate (synthetic type) |

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
| Accounts.Address FROM JOIN Accounts ON Accounts.Id = AccountId | account | Address of the activated account |
| Balance | balance | Account activation balance of tezos tokens that were recommended allocations for donations to the Tezos Foundation’s fundraiser |

#### AppState

View name: **summary**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |  |  |
| KnownHead |  |  |
| LastSync |  |  |
| Level | level |  |
| Timestamp | timestamp |  |
| Protocol | protocol |  |
| NextProtocol | next_protocol |  |
| Hash | block_hash |  |
| AccountCounter |  |  |
| OperationCounter |  |  |
| ManagerCounter |  |  |
| AccountsCount | num_accounts |  |
| BlocksCount | num_blocks |  |
| ProtocolsCount | num_protocols |  |
| ActivationOpsCount | num_activations |  |
| BallotOpsCount | num_ballots |  |
| DelegationOpsCount | num_delegations |  |
| DoubleBakingOpsCount | num_double_bakings |  |
| DoubleEndorsingOpsCount | num_double_endorsings |  |
| EndorsementOpsCount | num_endorsements |  |
| NonceRevelationOpsCount | num_nonce_revelations |  |
| OriginationOpsCount | num_originations |  |
| ProposalOpsCount | num_proposals |  |
| RevealOpsCount | num_reveals |  |
| TransactionOpsCount | num_transactions |  |
| MigrationOpsCount | num_migrations |  |
| RevelationPenaltyOpsCount | num_revelation_penalties |  |
| ProposalsCount | num_protocol_proposals |  |
| CyclesCount | num_cycles |  |
| QuoteBtc | xtz_btc | XTZ/BTC |
| QuoteEur | xtz_eur | XTZ/EUR |
| QuoteLevel |  |  |
| QuoteUsd | xtz_usd | XTZ/USD |

#### BakerCycles

View name: **rewards**

Comment: *Baker rewards per cycle with breakdown by source*

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |  |  |
| Cycle | cycle | Cycle in which rewards have been or will be earned. |
| BakerId | baker_id |  |
| Account.Address FROM JOIN Accounts ON Accounts.Id = BakerId | baker | Baker address |
| Rolls | rolls |  |
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
| OwnBlockRewards + ExtraBlockRewards + EndorsementRewards + OwnBlockFees + ExtraBlockFees + RevelationRewards + DoubleBakingRewards + DoubleEndorsingRewards | total_rewards |  |
| DoubleBakingLostDeposits + DoubleBakingLostRewards + DoubleBakingLostFees + DoubleEndorsingLostDeposits + DoubleEndorsingLostRewards + DoubleEndorsingLostFees + RevelationLostRewards + RevelationLostFees | total_penalties |  |

#### BakingRights

View name: **rights**

Comment: 

| Select/Join | As | Comment |
| ---- | ---- | ---- |
| Id |  |  |
| Cycle | cycle | Cycle on which the right can be realized. |
| Level | level | Level at which a block must be baked or an endorsement must be sent. |
| BakerId | baker_id |  |
| Accounts.Address FROM JOIN Accounts ON Accounts.Id = BakerId | baker | Baker address to which baking or endorsing right has been given. |
| Type | type | `baking` - right to bake (produce) a block;<br /> `endorsing` - right to endorse (validate) a block. |
| Status | status | `future` - the right is not realized yet;<br /> `realized` - the right was successfully realized;<br /> `uncovered` - the right was not realized due to lack of bonds (for example, when a baker is overdelegated);<br /> `missed` - the right was not realized for no apparent reason (usually due to issues with network or node). |
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
| VotingPeriods.Code JOIN VotingPeriods ON VotingPeriods.Id = PeriodId | voting_period | Index of the voting period for which the ballot was submitted |
| ProposalId | proposal_id |  |
| Proposals.Hash JOIN Proposals ON Proposals.Id = ProposalId | proposal | Hash of the proposal for which ballot was submitted |
| SenderId | baker_id |  |
| Accounts.Address JOIN Accounts ON Accounts.Id = SenderId | baker | Information about the delegate (baker), submitted the ballot |
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
| Events & 1 | is_cycle_start |  |
| Events & 2 | is_cycle_end | |
| Events & 4 | is_protocol_start | |
| Events & 8 | is_protocol_end | |
| Events & 16 | is_voting_period_start | |
| Events & 32 | is_voring_period_end | |
| Events & 64 | has_deactivations | |
| Events & 128 | NewAccounts | |
| Events & 256 | SmartContracts | |
| Events & 512 | is_snapshot | |
| Events & 1024 | DelegatorContracts | |
| Operations & 2 | has_ballots | |
| Operations & 4 | has_proposals |  |
| Operations & 8 | has_activations | |
| Operations & 16 | has_double_bakings | |
| Operations & 32 | has_double_endorsings | |
| Operations & 64 | has_revelations | |
| Operations & 128 | has_transactions | |
| Operations & 256 | has_reveals | |
| Operations & 512 | has_migrations | |
| Operations & 1024 | has_revelations_penalties | |
| Reward | reward | Reward of the baker for producing the block (micro tez) |
| Fees | fees | Total fee paid by all operations, included in the block |
| BakerId | baker_id | Accounts |
| Accounts.Address JOIN Accounts ON Accounts.Id = BakerId | baker | Address of the delegate (baker), produced the block |
| RevelationId | revelation_id | Note: This is a Foreign Key to `NonceRevelationOps.RevealedLevel`.<fk table='NonceRevelationOps' column='RevealedLevel'/> |
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
| Level | level |  |
| Timestamp | timestamp |  |
| OpHash | hash |  |
| SenderId | sender_id | Accounts |
|  |  |  |
| Counter | counter |  |
| BakerFee | baker_fee |  |
| StorageFee | storage_burn |  |
| AllocationFee | allocation_burn |  |
| GasLimit | gas_limit |  |
| GasUsed | consumed_gas |  |
| StorageLimit | storage_limit |  |
| StorageUsed | paid_storage_size_diff |  |
| Status | status |  |
| Errors | errors |  |
| InitiatorId | initiator_id | Accounts |
| Nonce | + |  |
| DelegateId | delegate_id | Accounts |
|  |  |  |
| PrevDelegateId | prev_delegate_id | Accounts |
|  |  |  |
| ResetDeactivation |  |  |

#### DelegatorCycles

View name: **BalanceSnapshots**

| Name | Select | Join | Comment |
| ---- | ---- | ----------- | -------- |
| Id |  |  |  |
| Cycle | +                |  |  |
| DelegatorId | DelegatorAddress | Accounts |  |
| BakerId | BakerAddress | Accounts |  |
| Balance | + |  |  |

#### DoubleBakingOps

View name: **DoubleBakingOperations**

Comment: 

| Name | Select | Join | Comment |
| ---- | ----------- | ----------- | ----------- |
| Id |  |  |  |
| Level | level |  |  |
| Timestamp | timestamp |  |  |
| OpHash | hash |  |  |
| AccusedLevel | + |  |  |
| AccuserId | AccuserAddress | Accounts |  |
| AccuserReward | + |  |  |
| OffenderId | OffenderAddress | Accounts |  |
| OffenderLostDeposit | + |  |  |
| OffenderLostReward | + |  |  |
| OffenderLostFee | + |  |  |

#### DoubleEndorsingOps

View name: **DoubleEndorsingOperations**

Comment:

| Name | Select | Join | Comment |
| ---- | ----------- | ----------- | ----------- |
| Id |  | Note: This is a Primary Key.<pk/> |  |
| Level |  | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> |  |
| Timestamp |  |  |  |
| OpHash |  |  |  |
| AccusedLevel |  |  |  |
| AccuserId |  | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> |  |
| AccuserReward |  |  |  |
| OffenderId |  | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> |  |
| OffenderLostDeposit |  |  |  |
| OffenderLostReward |  |  |  |
| OffenderLostFee |  |  |  |

#### EndorsementOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| DelegateId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Slots | integer (integer) |  | Yes |
| Reward | integer (bigint) |  | Yes |
| ResetDeactivation | integer (integer) |  | No |

#### MigrationOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| AccountId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Kind | integer (integer) |  | Yes |
| BalanceChange | integer (bigint) |  | Yes |

#### NonceRevelationOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| BakerId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| SenderId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| RevealedLevel | integer (integer) |  | Yes |

#### OriginationOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| SenderId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Counter | integer (integer) |  | Yes |
| BakerFee | integer (bigint) |  | Yes |
| StorageFee | integer (bigint) |  | No |
| AllocationFee | integer (bigint) |  | No |
| GasLimit | integer (integer) |  | Yes |
| GasUsed | integer (integer) |  | Yes |
| StorageLimit | integer (integer) |  | Yes |
| StorageUsed | integer (integer) |  | Yes |
| Status | integer (smallint) |  | Yes |
| Errors | string (text) |  | No |
| InitiatorId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| Nonce | integer (integer) |  | No |
| ManagerId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| DelegateId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| ContractId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| Balance | integer (bigint) |  | Yes |

#### ProposalOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| PeriodId | integer (integer) | Note: This is a Foreign Key to `VotingPeriods.Id`.<fk table='VotingPeriods' column='Id'/> | Yes |
| ProposalId | integer (integer) | Note: This is a Foreign Key to `Proposals.Id`.<fk table='Proposals' column='Id'/> | Yes |
| SenderId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Rolls | integer (integer) |  | Yes |
| Duplicated | boolean (boolean) |  | Yes |

#### Proposals

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Hash | string (character) |  | No |
| Status | integer (integer) |  | Yes |
| InitiatorId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Upvotes | integer (integer) |  | Yes |
| ProposalPeriodId | integer (integer) | Note: This is a Foreign Key to `VotingPeriods.Id`.<fk table='VotingPeriods' column='Id'/> | Yes |
| ExplorationPeriodId | integer (integer) | Note: This is a Foreign Key to `VotingPeriods.Id`.<fk table='VotingPeriods' column='Id'/> | No |
| TestingPeriodId | integer (integer) | Note: This is a Foreign Key to `VotingPeriods.Id`.<fk table='VotingPeriods' column='Id'/> | No |
| PromotionPeriodId | integer (integer) | Note: This is a Foreign Key to `VotingPeriods.Id`.<fk table='VotingPeriods' column='Id'/> | No |

#### Protocols

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Code | integer (integer) |  | Yes |
| Hash | string (character) |  | Yes |
| FirstLevel | integer (integer) |  | Yes |
| LastLevel | integer (integer) |  | Yes |
| PreservedCycles | integer (integer) |  | Yes |
| BlocksPerCycle | integer (integer) |  | Yes |
| BlocksPerCommitment | integer (integer) |  | Yes |
| BlocksPerSnapshot | integer (integer) |  | Yes |
| BlocksPerVoting | integer (integer) |  | Yes |
| TimeBetweenBlocks | integer (integer) |  | Yes |
| EndorsersPerBlock | integer (integer) |  | Yes |
| HardOperationGasLimit | integer (integer) |  | Yes |
| HardOperationStorageLimit | integer (integer) |  | Yes |
| HardBlockGasLimit | integer (integer) |  | Yes |
| TokensPerRoll | integer (bigint) |  | Yes |
| RevelationReward | integer (bigint) |  | Yes |
| BlockDeposit | integer (bigint) |  | Yes |
| BlockReward0 | integer (bigint) |  | Yes |
| BlockReward1 | integer (bigint) |  | Yes |
| EndorsementDeposit | integer (bigint) |  | Yes |
| EndorsementReward0 | integer (bigint) |  | Yes |
| EndorsementReward1 | integer (bigint) |  | Yes |
| OriginationSize | integer (integer) |  | Yes |
| ByteCost | integer (integer) |  | Yes |

#### RevealOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| SenderId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Counter | integer (integer) |  | Yes |
| BakerFee | integer (bigint) |  | Yes |
| StorageFee | integer (bigint) |  | No |
| AllocationFee | integer (bigint) |  | No |
| GasLimit | integer (integer) |  | Yes |
| GasUsed | integer (integer) |  | Yes |
| StorageLimit | integer (integer) |  | Yes |
| StorageUsed | integer (integer) |  | Yes |
| Status | integer (smallint) |  | Yes |
| Errors | string (text) |  | No |

#### RevelationPenaltyOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| BakerId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| MissedLevel | integer (integer) |  | Yes |
| LostReward | integer (bigint) |  | Yes |
| LostFees | integer (bigint) |  | Yes |

#### SnapshotBalances

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) |  | Yes |
| Balance | integer (bigint) |  | Yes |
| AccountId | integer (integer) |  | Yes |
| DelegateId | integer (integer) |  | No |

#### TransactionOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| SenderId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Counter | integer (integer) |  | Yes |
| BakerFee | integer (bigint) |  | Yes |
| StorageFee | integer (bigint) |  | No |
| AllocationFee | integer (bigint) |  | No |
| GasLimit | integer (integer) |  | Yes |
| GasUsed | integer (integer) |  | Yes |
| StorageLimit | integer (integer) |  | Yes |
| StorageUsed | integer (integer) |  | Yes |
| Status | integer (smallint) |  | Yes |
| Errors | string (text) |  | No |
| InitiatorId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| Nonce | integer (integer) |  | No |
| TargetId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| ResetDeactivation | integer (integer) |  | No |
| Amount | integer (bigint) |  | Yes |
| Parameters | string (text) |  | No |
| InternalOperations | integer (smallint) |  | No |

#### VotingEpoches

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) |  | Yes |
| Progress | integer (integer) |  | Yes |

#### VotingPeriods

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Code | integer (integer) |  | Yes |
| EpochId | integer (integer) | Note: This is a Foreign Key to `VotingEpoches.Id`.<fk table='VotingEpoches' column='Id'/> | Yes |
| Kind | integer (integer) |  | Yes |
| StartLevel | integer (integer) |  | Yes |
| EndLevel | integer (integer) |  | Yes |
| ProposalId | integer (integer) |  | No |
| TotalStake | integer (integer) |  | No |
| Participation | integer (integer) |  | No |
| Quorum | integer (integer) |  | No |
| Abstainings | integer (integer) |  | No |
| Approvals | integer (integer) |  | No |
| Refusals | integer (integer) |  | No |
| PromotionPeriod_ProposalId | integer (integer) |  | No |
| PromotionPeriod_TotalStake | integer (integer) |  | No |
| PromotionPeriod_Participation | integer (integer) |  | No |
| PromotionPeriod_Quorum | integer (integer) |  | No |
| PromotionPeriod_Abstainings | integer (integer) |  | No |
| PromotionPeriod_Approvals | integer (integer) |  | No |
| PromotionPeriod_Refusals | integer (integer) |  | No |
| TestingPeriod_ProposalId | integer (integer) |  | No |

#### VotingSnapshots

View name: **VotingSnapshots**

| Name | Select | Join | Comment |
| ---- | ---- | ----------- | -------- |
| Id |  |  |  |
| Level | + |  |  |
| PeriodId | PeriodCode | VotingPeriods |  |
| DelegateId | DelegateAddress | Accounts |  |
| Rolls | + |  |  |
