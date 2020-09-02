# PostgREST API
standard public schema

## Version: 7.0.1 (UNKNOWN)

[PostgREST Documentation](https://postgrest.org/en/v7.0/api.html)
### /

#### GET
##### Summary:

OpenAPI description (this document)

##### Responses

| Code | Description |
| ---- | ----------- |
| 200 | OK |

### /Accounts

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Address | query |  | No | string (character) |
| Type | query |  | No | string (smallint) |
| FirstLevel | query |  | No | string (integer) |
| LastLevel | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| Counter | query |  | No | string (integer) |
| ContractsCount | query |  | No | string (integer) |
| DelegationsCount | query |  | No | string (integer) |
| OriginationsCount | query |  | No | string (integer) |
| TransactionsCount | query |  | No | string (integer) |
| RevealsCount | query |  | No | string (integer) |
| MigrationsCount | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| DelegationLevel | query |  | No | string (integer) |
| Staked | query |  | No | string (boolean) |
| Kind | query |  | No | string (smallint) |
| Spendable | query |  | No | string (boolean) |
| CreatorId | query |  | No | string (integer) |
| ManagerId | query |  | No | string (integer) |
| WeirdDelegateId | query |  | No | string (integer) |
| Activated | query |  | No | string (boolean) |
| PublicKey | query |  | No | string (character varying) |
| Revealed | query |  | No | string (boolean) |
| ActivationLevel | query |  | No | string (integer) |
| DeactivationLevel | query |  | No | string (integer) |
| FrozenDeposits | query |  | No | string (bigint) |
| FrozenRewards | query |  | No | string (bigint) |
| FrozenFees | query |  | No | string (bigint) |
| DelegatorsCount | query |  | No | string (integer) |
| StakingBalance | query |  | No | string (bigint) |
| BlocksCount | query |  | No | string (integer) |
| EndorsementsCount | query |  | No | string (integer) |
| BallotsCount | query |  | No | string (integer) |
| ProposalsCount | query |  | No | string (integer) |
| DoubleBakingCount | query |  | No | string (integer) |
| DoubleEndorsingCount | query |  | No | string (integer) |
| NonceRevelationsCount | query |  | No | string (integer) |
| RevelationPenaltiesCount | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Accounts](#accounts) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Accounts | body | Accounts | No | [Accounts](#accounts) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Address | query |  | No | string (character) |
| Type | query |  | No | string (smallint) |
| FirstLevel | query |  | No | string (integer) |
| LastLevel | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| Counter | query |  | No | string (integer) |
| ContractsCount | query |  | No | string (integer) |
| DelegationsCount | query |  | No | string (integer) |
| OriginationsCount | query |  | No | string (integer) |
| TransactionsCount | query |  | No | string (integer) |
| RevealsCount | query |  | No | string (integer) |
| MigrationsCount | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| DelegationLevel | query |  | No | string (integer) |
| Staked | query |  | No | string (boolean) |
| Kind | query |  | No | string (smallint) |
| Spendable | query |  | No | string (boolean) |
| CreatorId | query |  | No | string (integer) |
| ManagerId | query |  | No | string (integer) |
| WeirdDelegateId | query |  | No | string (integer) |
| Activated | query |  | No | string (boolean) |
| PublicKey | query |  | No | string (character varying) |
| Revealed | query |  | No | string (boolean) |
| ActivationLevel | query |  | No | string (integer) |
| DeactivationLevel | query |  | No | string (integer) |
| FrozenDeposits | query |  | No | string (bigint) |
| FrozenRewards | query |  | No | string (bigint) |
| FrozenFees | query |  | No | string (bigint) |
| DelegatorsCount | query |  | No | string (integer) |
| StakingBalance | query |  | No | string (bigint) |
| BlocksCount | query |  | No | string (integer) |
| EndorsementsCount | query |  | No | string (integer) |
| BallotsCount | query |  | No | string (integer) |
| ProposalsCount | query |  | No | string (integer) |
| DoubleBakingCount | query |  | No | string (integer) |
| DoubleEndorsingCount | query |  | No | string (integer) |
| NonceRevelationsCount | query |  | No | string (integer) |
| RevelationPenaltiesCount | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Address | query |  | No | string (character) |
| Type | query |  | No | string (smallint) |
| FirstLevel | query |  | No | string (integer) |
| LastLevel | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| Counter | query |  | No | string (integer) |
| ContractsCount | query |  | No | string (integer) |
| DelegationsCount | query |  | No | string (integer) |
| OriginationsCount | query |  | No | string (integer) |
| TransactionsCount | query |  | No | string (integer) |
| RevealsCount | query |  | No | string (integer) |
| MigrationsCount | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| DelegationLevel | query |  | No | string (integer) |
| Staked | query |  | No | string (boolean) |
| Kind | query |  | No | string (smallint) |
| Spendable | query |  | No | string (boolean) |
| CreatorId | query |  | No | string (integer) |
| ManagerId | query |  | No | string (integer) |
| WeirdDelegateId | query |  | No | string (integer) |
| Activated | query |  | No | string (boolean) |
| PublicKey | query |  | No | string (character varying) |
| Revealed | query |  | No | string (boolean) |
| ActivationLevel | query |  | No | string (integer) |
| DeactivationLevel | query |  | No | string (integer) |
| FrozenDeposits | query |  | No | string (bigint) |
| FrozenRewards | query |  | No | string (bigint) |
| FrozenFees | query |  | No | string (bigint) |
| DelegatorsCount | query |  | No | string (integer) |
| StakingBalance | query |  | No | string (bigint) |
| BlocksCount | query |  | No | string (integer) |
| EndorsementsCount | query |  | No | string (integer) |
| BallotsCount | query |  | No | string (integer) |
| ProposalsCount | query |  | No | string (integer) |
| DoubleBakingCount | query |  | No | string (integer) |
| DoubleEndorsingCount | query |  | No | string (integer) |
| NonceRevelationsCount | query |  | No | string (integer) |
| RevelationPenaltiesCount | query |  | No | string (integer) |
| Accounts | body | Accounts | No | [Accounts](#accounts) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /ActivationOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccountId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [ActivationOps](#activationops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| ActivationOps | body | ActivationOps | No | [ActivationOps](#activationops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccountId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccountId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| ActivationOps | body | ActivationOps | No | [ActivationOps](#activationops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /AppState

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| KnownHead | query |  | No | string (integer) |
| LastSync | query |  | No | string (timestamp without time zone) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| Protocol | query |  | No | string (text) |
| NextProtocol | query |  | No | string (text) |
| Hash | query |  | No | string (text) |
| AccountCounter | query |  | No | string (integer) |
| OperationCounter | query |  | No | string (integer) |
| ManagerCounter | query |  | No | string (integer) |
| AccountsCount | query |  | No | string (integer) |
| BlocksCount | query |  | No | string (integer) |
| ProtocolsCount | query |  | No | string (integer) |
| ActivationOpsCount | query |  | No | string (integer) |
| BallotOpsCount | query |  | No | string (integer) |
| DelegationOpsCount | query |  | No | string (integer) |
| DoubleBakingOpsCount | query |  | No | string (integer) |
| DoubleEndorsingOpsCount | query |  | No | string (integer) |
| EndorsementOpsCount | query |  | No | string (integer) |
| NonceRevelationOpsCount | query |  | No | string (integer) |
| OriginationOpsCount | query |  | No | string (integer) |
| ProposalOpsCount | query |  | No | string (integer) |
| RevealOpsCount | query |  | No | string (integer) |
| TransactionOpsCount | query |  | No | string (integer) |
| MigrationOpsCount | query |  | No | string (integer) |
| RevelationPenaltyOpsCount | query |  | No | string (integer) |
| ProposalsCount | query |  | No | string (integer) |
| CyclesCount | query |  | No | string (integer) |
| QuoteBtc | query |  | No | string (double precision) |
| QuoteEur | query |  | No | string (double precision) |
| QuoteLevel | query |  | No | string (integer) |
| QuoteUsd | query |  | No | string (double precision) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [AppState](#appstate) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| AppState | body | AppState | No | [AppState](#appstate) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| KnownHead | query |  | No | string (integer) |
| LastSync | query |  | No | string (timestamp without time zone) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| Protocol | query |  | No | string (text) |
| NextProtocol | query |  | No | string (text) |
| Hash | query |  | No | string (text) |
| AccountCounter | query |  | No | string (integer) |
| OperationCounter | query |  | No | string (integer) |
| ManagerCounter | query |  | No | string (integer) |
| AccountsCount | query |  | No | string (integer) |
| BlocksCount | query |  | No | string (integer) |
| ProtocolsCount | query |  | No | string (integer) |
| ActivationOpsCount | query |  | No | string (integer) |
| BallotOpsCount | query |  | No | string (integer) |
| DelegationOpsCount | query |  | No | string (integer) |
| DoubleBakingOpsCount | query |  | No | string (integer) |
| DoubleEndorsingOpsCount | query |  | No | string (integer) |
| EndorsementOpsCount | query |  | No | string (integer) |
| NonceRevelationOpsCount | query |  | No | string (integer) |
| OriginationOpsCount | query |  | No | string (integer) |
| ProposalOpsCount | query |  | No | string (integer) |
| RevealOpsCount | query |  | No | string (integer) |
| TransactionOpsCount | query |  | No | string (integer) |
| MigrationOpsCount | query |  | No | string (integer) |
| RevelationPenaltyOpsCount | query |  | No | string (integer) |
| ProposalsCount | query |  | No | string (integer) |
| CyclesCount | query |  | No | string (integer) |
| QuoteBtc | query |  | No | string (double precision) |
| QuoteEur | query |  | No | string (double precision) |
| QuoteLevel | query |  | No | string (integer) |
| QuoteUsd | query |  | No | string (double precision) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| KnownHead | query |  | No | string (integer) |
| LastSync | query |  | No | string (timestamp without time zone) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| Protocol | query |  | No | string (text) |
| NextProtocol | query |  | No | string (text) |
| Hash | query |  | No | string (text) |
| AccountCounter | query |  | No | string (integer) |
| OperationCounter | query |  | No | string (integer) |
| ManagerCounter | query |  | No | string (integer) |
| AccountsCount | query |  | No | string (integer) |
| BlocksCount | query |  | No | string (integer) |
| ProtocolsCount | query |  | No | string (integer) |
| ActivationOpsCount | query |  | No | string (integer) |
| BallotOpsCount | query |  | No | string (integer) |
| DelegationOpsCount | query |  | No | string (integer) |
| DoubleBakingOpsCount | query |  | No | string (integer) |
| DoubleEndorsingOpsCount | query |  | No | string (integer) |
| EndorsementOpsCount | query |  | No | string (integer) |
| NonceRevelationOpsCount | query |  | No | string (integer) |
| OriginationOpsCount | query |  | No | string (integer) |
| ProposalOpsCount | query |  | No | string (integer) |
| RevealOpsCount | query |  | No | string (integer) |
| TransactionOpsCount | query |  | No | string (integer) |
| MigrationOpsCount | query |  | No | string (integer) |
| RevelationPenaltyOpsCount | query |  | No | string (integer) |
| ProposalsCount | query |  | No | string (integer) |
| CyclesCount | query |  | No | string (integer) |
| QuoteBtc | query |  | No | string (double precision) |
| QuoteEur | query |  | No | string (double precision) |
| QuoteLevel | query |  | No | string (integer) |
| QuoteUsd | query |  | No | string (double precision) |
| AppState | body | AppState | No | [AppState](#appstate) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /BakerCycles

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| StakingBalance | query |  | No | string (bigint) |
| DelegatedBalance | query |  | No | string (bigint) |
| DelegatorsCount | query |  | No | string (integer) |
| FutureBlocks | query |  | No | string (integer) |
| OwnBlocks | query |  | No | string (integer) |
| ExtraBlocks | query |  | No | string (integer) |
| MissedOwnBlocks | query |  | No | string (integer) |
| MissedExtraBlocks | query |  | No | string (integer) |
| UncoveredOwnBlocks | query |  | No | string (integer) |
| UncoveredExtraBlocks | query |  | No | string (integer) |
| FutureEndorsements | query |  | No | string (integer) |
| Endorsements | query |  | No | string (integer) |
| MissedEndorsements | query |  | No | string (integer) |
| UncoveredEndorsements | query |  | No | string (integer) |
| FutureBlockRewards | query |  | No | string (bigint) |
| OwnBlockRewards | query |  | No | string (bigint) |
| ExtraBlockRewards | query |  | No | string (bigint) |
| MissedOwnBlockRewards | query |  | No | string (bigint) |
| MissedExtraBlockRewards | query |  | No | string (bigint) |
| UncoveredOwnBlockRewards | query |  | No | string (bigint) |
| UncoveredExtraBlockRewards | query |  | No | string (bigint) |
| FutureEndorsementRewards | query |  | No | string (bigint) |
| EndorsementRewards | query |  | No | string (bigint) |
| MissedEndorsementRewards | query |  | No | string (bigint) |
| UncoveredEndorsementRewards | query |  | No | string (bigint) |
| OwnBlockFees | query |  | No | string (bigint) |
| ExtraBlockFees | query |  | No | string (bigint) |
| MissedOwnBlockFees | query |  | No | string (bigint) |
| MissedExtraBlockFees | query |  | No | string (bigint) |
| UncoveredOwnBlockFees | query |  | No | string (bigint) |
| UncoveredExtraBlockFees | query |  | No | string (bigint) |
| DoubleBakingRewards | query |  | No | string (bigint) |
| DoubleBakingLostDeposits | query |  | No | string (bigint) |
| DoubleBakingLostRewards | query |  | No | string (bigint) |
| DoubleBakingLostFees | query |  | No | string (bigint) |
| DoubleEndorsingRewards | query |  | No | string (bigint) |
| DoubleEndorsingLostDeposits | query |  | No | string (bigint) |
| DoubleEndorsingLostRewards | query |  | No | string (bigint) |
| DoubleEndorsingLostFees | query |  | No | string (bigint) |
| RevelationRewards | query |  | No | string (bigint) |
| RevelationLostRewards | query |  | No | string (bigint) |
| RevelationLostFees | query |  | No | string (bigint) |
| FutureBlockDeposits | query |  | No | string (bigint) |
| BlockDeposits | query |  | No | string (bigint) |
| FutureEndorsementDeposits | query |  | No | string (bigint) |
| EndorsementDeposits | query |  | No | string (bigint) |
| ExpectedBlocks | query |  | No | string (double precision) |
| ExpectedEndorsements | query |  | No | string (double precision) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [BakerCycles](#bakercycles) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| BakerCycles | body | BakerCycles | No | [BakerCycles](#bakercycles) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| StakingBalance | query |  | No | string (bigint) |
| DelegatedBalance | query |  | No | string (bigint) |
| DelegatorsCount | query |  | No | string (integer) |
| FutureBlocks | query |  | No | string (integer) |
| OwnBlocks | query |  | No | string (integer) |
| ExtraBlocks | query |  | No | string (integer) |
| MissedOwnBlocks | query |  | No | string (integer) |
| MissedExtraBlocks | query |  | No | string (integer) |
| UncoveredOwnBlocks | query |  | No | string (integer) |
| UncoveredExtraBlocks | query |  | No | string (integer) |
| FutureEndorsements | query |  | No | string (integer) |
| Endorsements | query |  | No | string (integer) |
| MissedEndorsements | query |  | No | string (integer) |
| UncoveredEndorsements | query |  | No | string (integer) |
| FutureBlockRewards | query |  | No | string (bigint) |
| OwnBlockRewards | query |  | No | string (bigint) |
| ExtraBlockRewards | query |  | No | string (bigint) |
| MissedOwnBlockRewards | query |  | No | string (bigint) |
| MissedExtraBlockRewards | query |  | No | string (bigint) |
| UncoveredOwnBlockRewards | query |  | No | string (bigint) |
| UncoveredExtraBlockRewards | query |  | No | string (bigint) |
| FutureEndorsementRewards | query |  | No | string (bigint) |
| EndorsementRewards | query |  | No | string (bigint) |
| MissedEndorsementRewards | query |  | No | string (bigint) |
| UncoveredEndorsementRewards | query |  | No | string (bigint) |
| OwnBlockFees | query |  | No | string (bigint) |
| ExtraBlockFees | query |  | No | string (bigint) |
| MissedOwnBlockFees | query |  | No | string (bigint) |
| MissedExtraBlockFees | query |  | No | string (bigint) |
| UncoveredOwnBlockFees | query |  | No | string (bigint) |
| UncoveredExtraBlockFees | query |  | No | string (bigint) |
| DoubleBakingRewards | query |  | No | string (bigint) |
| DoubleBakingLostDeposits | query |  | No | string (bigint) |
| DoubleBakingLostRewards | query |  | No | string (bigint) |
| DoubleBakingLostFees | query |  | No | string (bigint) |
| DoubleEndorsingRewards | query |  | No | string (bigint) |
| DoubleEndorsingLostDeposits | query |  | No | string (bigint) |
| DoubleEndorsingLostRewards | query |  | No | string (bigint) |
| DoubleEndorsingLostFees | query |  | No | string (bigint) |
| RevelationRewards | query |  | No | string (bigint) |
| RevelationLostRewards | query |  | No | string (bigint) |
| RevelationLostFees | query |  | No | string (bigint) |
| FutureBlockDeposits | query |  | No | string (bigint) |
| BlockDeposits | query |  | No | string (bigint) |
| FutureEndorsementDeposits | query |  | No | string (bigint) |
| EndorsementDeposits | query |  | No | string (bigint) |
| ExpectedBlocks | query |  | No | string (double precision) |
| ExpectedEndorsements | query |  | No | string (double precision) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| StakingBalance | query |  | No | string (bigint) |
| DelegatedBalance | query |  | No | string (bigint) |
| DelegatorsCount | query |  | No | string (integer) |
| FutureBlocks | query |  | No | string (integer) |
| OwnBlocks | query |  | No | string (integer) |
| ExtraBlocks | query |  | No | string (integer) |
| MissedOwnBlocks | query |  | No | string (integer) |
| MissedExtraBlocks | query |  | No | string (integer) |
| UncoveredOwnBlocks | query |  | No | string (integer) |
| UncoveredExtraBlocks | query |  | No | string (integer) |
| FutureEndorsements | query |  | No | string (integer) |
| Endorsements | query |  | No | string (integer) |
| MissedEndorsements | query |  | No | string (integer) |
| UncoveredEndorsements | query |  | No | string (integer) |
| FutureBlockRewards | query |  | No | string (bigint) |
| OwnBlockRewards | query |  | No | string (bigint) |
| ExtraBlockRewards | query |  | No | string (bigint) |
| MissedOwnBlockRewards | query |  | No | string (bigint) |
| MissedExtraBlockRewards | query |  | No | string (bigint) |
| UncoveredOwnBlockRewards | query |  | No | string (bigint) |
| UncoveredExtraBlockRewards | query |  | No | string (bigint) |
| FutureEndorsementRewards | query |  | No | string (bigint) |
| EndorsementRewards | query |  | No | string (bigint) |
| MissedEndorsementRewards | query |  | No | string (bigint) |
| UncoveredEndorsementRewards | query |  | No | string (bigint) |
| OwnBlockFees | query |  | No | string (bigint) |
| ExtraBlockFees | query |  | No | string (bigint) |
| MissedOwnBlockFees | query |  | No | string (bigint) |
| MissedExtraBlockFees | query |  | No | string (bigint) |
| UncoveredOwnBlockFees | query |  | No | string (bigint) |
| UncoveredExtraBlockFees | query |  | No | string (bigint) |
| DoubleBakingRewards | query |  | No | string (bigint) |
| DoubleBakingLostDeposits | query |  | No | string (bigint) |
| DoubleBakingLostRewards | query |  | No | string (bigint) |
| DoubleBakingLostFees | query |  | No | string (bigint) |
| DoubleEndorsingRewards | query |  | No | string (bigint) |
| DoubleEndorsingLostDeposits | query |  | No | string (bigint) |
| DoubleEndorsingLostRewards | query |  | No | string (bigint) |
| DoubleEndorsingLostFees | query |  | No | string (bigint) |
| RevelationRewards | query |  | No | string (bigint) |
| RevelationLostRewards | query |  | No | string (bigint) |
| RevelationLostFees | query |  | No | string (bigint) |
| FutureBlockDeposits | query |  | No | string (bigint) |
| BlockDeposits | query |  | No | string (bigint) |
| FutureEndorsementDeposits | query |  | No | string (bigint) |
| EndorsementDeposits | query |  | No | string (bigint) |
| ExpectedBlocks | query |  | No | string (double precision) |
| ExpectedEndorsements | query |  | No | string (double precision) |
| BakerCycles | body | BakerCycles | No | [BakerCycles](#bakercycles) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /BakingRights

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Type | query |  | No | string (smallint) |
| Status | query |  | No | string (smallint) |
| Priority | query |  | No | string (integer) |
| Slots | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [BakingRights](#bakingrights) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| BakingRights | body | BakingRights | No | [BakingRights](#bakingrights) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Type | query |  | No | string (smallint) |
| Status | query |  | No | string (smallint) |
| Priority | query |  | No | string (integer) |
| Slots | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Type | query |  | No | string (smallint) |
| Status | query |  | No | string (smallint) |
| Priority | query |  | No | string (integer) |
| Slots | query |  | No | string (integer) |
| BakingRights | body | BakingRights | No | [BakingRights](#bakingrights) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /BallotOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| PeriodId | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| Vote | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [BallotOps](#ballotops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| BallotOps | body | BallotOps | No | [BallotOps](#ballotops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| PeriodId | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| Vote | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| PeriodId | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| Vote | query |  | No | string (integer) |
| BallotOps | body | BallotOps | No | [BallotOps](#ballotops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /Blocks

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| ProtoCode | query |  | No | string (integer) |
| Priority | query |  | No | string (integer) |
| Validations | query |  | No | string (integer) |
| Events | query |  | No | string (integer) |
| Operations | query |  | No | string (integer) |
| Reward | query |  | No | string (bigint) |
| Fees | query |  | No | string (bigint) |
| BakerId | query |  | No | string (integer) |
| RevelationId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Blocks](#blocks) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Blocks | body | Blocks | No | [Blocks](#blocks) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| ProtoCode | query |  | No | string (integer) |
| Priority | query |  | No | string (integer) |
| Validations | query |  | No | string (integer) |
| Events | query |  | No | string (integer) |
| Operations | query |  | No | string (integer) |
| Reward | query |  | No | string (bigint) |
| Fees | query |  | No | string (bigint) |
| BakerId | query |  | No | string (integer) |
| RevelationId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| ProtoCode | query |  | No | string (integer) |
| Priority | query |  | No | string (integer) |
| Validations | query |  | No | string (integer) |
| Events | query |  | No | string (integer) |
| Operations | query |  | No | string (integer) |
| Reward | query |  | No | string (bigint) |
| Fees | query |  | No | string (bigint) |
| BakerId | query |  | No | string (integer) |
| RevelationId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| Blocks | body | Blocks | No | [Blocks](#blocks) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /Cycles

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Index | query |  | No | string (integer) |
| SnapshotIndex | query |  | No | string (integer) |
| SnapshotLevel | query |  | No | string (integer) |
| TotalRolls | query |  | No | string (integer) |
| TotalStaking | query |  | No | string (bigint) |
| TotalDelegated | query |  | No | string (bigint) |
| TotalDelegators | query |  | No | string (integer) |
| TotalBakers | query |  | No | string (integer) |
| Seed | query |  | No | string (character) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Cycles](#cycles) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Cycles | body | Cycles | No | [Cycles](#cycles) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Index | query |  | No | string (integer) |
| SnapshotIndex | query |  | No | string (integer) |
| SnapshotLevel | query |  | No | string (integer) |
| TotalRolls | query |  | No | string (integer) |
| TotalStaking | query |  | No | string (bigint) |
| TotalDelegated | query |  | No | string (bigint) |
| TotalDelegators | query |  | No | string (integer) |
| TotalBakers | query |  | No | string (integer) |
| Seed | query |  | No | string (character) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Index | query |  | No | string (integer) |
| SnapshotIndex | query |  | No | string (integer) |
| SnapshotLevel | query |  | No | string (integer) |
| TotalRolls | query |  | No | string (integer) |
| TotalStaking | query |  | No | string (bigint) |
| TotalDelegated | query |  | No | string (bigint) |
| TotalDelegators | query |  | No | string (integer) |
| TotalBakers | query |  | No | string (integer) |
| Seed | query |  | No | string (character) |
| Cycles | body | Cycles | No | [Cycles](#cycles) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /DelegationOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| PrevDelegateId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [DelegationOps](#delegationops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| DelegationOps | body | DelegationOps | No | [DelegationOps](#delegationops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| PrevDelegateId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| PrevDelegateId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| DelegationOps | body | DelegationOps | No | [DelegationOps](#delegationops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /DelegatorCycles

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| DelegatorId | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [DelegatorCycles](#delegatorcycles) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| DelegatorCycles | body | DelegatorCycles | No | [DelegatorCycles](#delegatorcycles) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| DelegatorId | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Cycle | query |  | No | string (integer) |
| DelegatorId | query |  | No | string (integer) |
| BakerId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| DelegatorCycles | body | DelegatorCycles | No | [DelegatorCycles](#delegatorcycles) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /DoubleBakingOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccusedLevel | query |  | No | string (integer) |
| AccuserId | query |  | No | string (integer) |
| AccuserReward | query |  | No | string (bigint) |
| OffenderId | query |  | No | string (integer) |
| OffenderLostDeposit | query |  | No | string (bigint) |
| OffenderLostReward | query |  | No | string (bigint) |
| OffenderLostFee | query |  | No | string (bigint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [DoubleBakingOps](#doublebakingops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| DoubleBakingOps | body | DoubleBakingOps | No | [DoubleBakingOps](#doublebakingops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccusedLevel | query |  | No | string (integer) |
| AccuserId | query |  | No | string (integer) |
| AccuserReward | query |  | No | string (bigint) |
| OffenderId | query |  | No | string (integer) |
| OffenderLostDeposit | query |  | No | string (bigint) |
| OffenderLostReward | query |  | No | string (bigint) |
| OffenderLostFee | query |  | No | string (bigint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccusedLevel | query |  | No | string (integer) |
| AccuserId | query |  | No | string (integer) |
| AccuserReward | query |  | No | string (bigint) |
| OffenderId | query |  | No | string (integer) |
| OffenderLostDeposit | query |  | No | string (bigint) |
| OffenderLostReward | query |  | No | string (bigint) |
| OffenderLostFee | query |  | No | string (bigint) |
| DoubleBakingOps | body | DoubleBakingOps | No | [DoubleBakingOps](#doublebakingops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /DoubleEndorsingOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccusedLevel | query |  | No | string (integer) |
| AccuserId | query |  | No | string (integer) |
| AccuserReward | query |  | No | string (bigint) |
| OffenderId | query |  | No | string (integer) |
| OffenderLostDeposit | query |  | No | string (bigint) |
| OffenderLostReward | query |  | No | string (bigint) |
| OffenderLostFee | query |  | No | string (bigint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [DoubleEndorsingOps](#doubleendorsingops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| DoubleEndorsingOps | body | DoubleEndorsingOps | No | [DoubleEndorsingOps](#doubleendorsingops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccusedLevel | query |  | No | string (integer) |
| AccuserId | query |  | No | string (integer) |
| AccuserReward | query |  | No | string (bigint) |
| OffenderId | query |  | No | string (integer) |
| OffenderLostDeposit | query |  | No | string (bigint) |
| OffenderLostReward | query |  | No | string (bigint) |
| OffenderLostFee | query |  | No | string (bigint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| AccusedLevel | query |  | No | string (integer) |
| AccuserId | query |  | No | string (integer) |
| AccuserReward | query |  | No | string (bigint) |
| OffenderId | query |  | No | string (integer) |
| OffenderLostDeposit | query |  | No | string (bigint) |
| OffenderLostReward | query |  | No | string (bigint) |
| OffenderLostFee | query |  | No | string (bigint) |
| DoubleEndorsingOps | body | DoubleEndorsingOps | No | [DoubleEndorsingOps](#doubleendorsingops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /EndorsementOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| DelegateId | query |  | No | string (integer) |
| Slots | query |  | No | string (integer) |
| Reward | query |  | No | string (bigint) |
| ResetDeactivation | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [EndorsementOps](#endorsementops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| EndorsementOps | body | EndorsementOps | No | [EndorsementOps](#endorsementops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| DelegateId | query |  | No | string (integer) |
| Slots | query |  | No | string (integer) |
| Reward | query |  | No | string (bigint) |
| ResetDeactivation | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| DelegateId | query |  | No | string (integer) |
| Slots | query |  | No | string (integer) |
| Reward | query |  | No | string (bigint) |
| ResetDeactivation | query |  | No | string (integer) |
| EndorsementOps | body | EndorsementOps | No | [EndorsementOps](#endorsementops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /MigrationOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| AccountId | query |  | No | string (integer) |
| Kind | query |  | No | string (integer) |
| BalanceChange | query |  | No | string (bigint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [MigrationOps](#migrationops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| MigrationOps | body | MigrationOps | No | [MigrationOps](#migrationops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| AccountId | query |  | No | string (integer) |
| Kind | query |  | No | string (integer) |
| BalanceChange | query |  | No | string (bigint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| AccountId | query |  | No | string (integer) |
| Kind | query |  | No | string (integer) |
| BalanceChange | query |  | No | string (bigint) |
| MigrationOps | body | MigrationOps | No | [MigrationOps](#migrationops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /NonceRevelationOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| BakerId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| RevealedLevel | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [NonceRevelationOps](#noncerevelationops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| NonceRevelationOps | body | NonceRevelationOps | No | [NonceRevelationOps](#noncerevelationops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| BakerId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| RevealedLevel | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| BakerId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| RevealedLevel | query |  | No | string (integer) |
| NonceRevelationOps | body | NonceRevelationOps | No | [NonceRevelationOps](#noncerevelationops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /OriginationOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| ManagerId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| ContractId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [OriginationOps](#originationops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| OriginationOps | body | OriginationOps | No | [OriginationOps](#originationops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| ManagerId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| ContractId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| ManagerId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| ContractId | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| OriginationOps | body | OriginationOps | No | [OriginationOps](#originationops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /ProposalOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| PeriodId | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| Duplicated | query |  | No | string (boolean) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [ProposalOps](#proposalops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| ProposalOps | body | ProposalOps | No | [ProposalOps](#proposalops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| PeriodId | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| Duplicated | query |  | No | string (boolean) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| PeriodId | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| SenderId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| Duplicated | query |  | No | string (boolean) |
| ProposalOps | body | ProposalOps | No | [ProposalOps](#proposalops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /Proposals

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| Status | query |  | No | string (integer) |
| InitiatorId | query |  | No | string (integer) |
| Upvotes | query |  | No | string (integer) |
| ProposalPeriodId | query |  | No | string (integer) |
| ExplorationPeriodId | query |  | No | string (integer) |
| TestingPeriodId | query |  | No | string (integer) |
| PromotionPeriodId | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Proposals](#proposals) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Proposals | body | Proposals | No | [Proposals](#proposals) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| Status | query |  | No | string (integer) |
| InitiatorId | query |  | No | string (integer) |
| Upvotes | query |  | No | string (integer) |
| ProposalPeriodId | query |  | No | string (integer) |
| ExplorationPeriodId | query |  | No | string (integer) |
| TestingPeriodId | query |  | No | string (integer) |
| PromotionPeriodId | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| Status | query |  | No | string (integer) |
| InitiatorId | query |  | No | string (integer) |
| Upvotes | query |  | No | string (integer) |
| ProposalPeriodId | query |  | No | string (integer) |
| ExplorationPeriodId | query |  | No | string (integer) |
| TestingPeriodId | query |  | No | string (integer) |
| PromotionPeriodId | query |  | No | string (integer) |
| Proposals | body | Proposals | No | [Proposals](#proposals) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /Protocols

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Code | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| FirstLevel | query |  | No | string (integer) |
| LastLevel | query |  | No | string (integer) |
| PreservedCycles | query |  | No | string (integer) |
| BlocksPerCycle | query |  | No | string (integer) |
| BlocksPerCommitment | query |  | No | string (integer) |
| BlocksPerSnapshot | query |  | No | string (integer) |
| BlocksPerVoting | query |  | No | string (integer) |
| TimeBetweenBlocks | query |  | No | string (integer) |
| EndorsersPerBlock | query |  | No | string (integer) |
| HardOperationGasLimit | query |  | No | string (integer) |
| HardOperationStorageLimit | query |  | No | string (integer) |
| HardBlockGasLimit | query |  | No | string (integer) |
| TokensPerRoll | query |  | No | string (bigint) |
| RevelationReward | query |  | No | string (bigint) |
| BlockDeposit | query |  | No | string (bigint) |
| BlockReward0 | query |  | No | string (bigint) |
| BlockReward1 | query |  | No | string (bigint) |
| EndorsementDeposit | query |  | No | string (bigint) |
| EndorsementReward0 | query |  | No | string (bigint) |
| EndorsementReward1 | query |  | No | string (bigint) |
| OriginationSize | query |  | No | string (integer) |
| ByteCost | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [Protocols](#protocols) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Protocols | body | Protocols | No | [Protocols](#protocols) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Code | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| FirstLevel | query |  | No | string (integer) |
| LastLevel | query |  | No | string (integer) |
| PreservedCycles | query |  | No | string (integer) |
| BlocksPerCycle | query |  | No | string (integer) |
| BlocksPerCommitment | query |  | No | string (integer) |
| BlocksPerSnapshot | query |  | No | string (integer) |
| BlocksPerVoting | query |  | No | string (integer) |
| TimeBetweenBlocks | query |  | No | string (integer) |
| EndorsersPerBlock | query |  | No | string (integer) |
| HardOperationGasLimit | query |  | No | string (integer) |
| HardOperationStorageLimit | query |  | No | string (integer) |
| HardBlockGasLimit | query |  | No | string (integer) |
| TokensPerRoll | query |  | No | string (bigint) |
| RevelationReward | query |  | No | string (bigint) |
| BlockDeposit | query |  | No | string (bigint) |
| BlockReward0 | query |  | No | string (bigint) |
| BlockReward1 | query |  | No | string (bigint) |
| EndorsementDeposit | query |  | No | string (bigint) |
| EndorsementReward0 | query |  | No | string (bigint) |
| EndorsementReward1 | query |  | No | string (bigint) |
| OriginationSize | query |  | No | string (integer) |
| ByteCost | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Code | query |  | No | string (integer) |
| Hash | query |  | No | string (character) |
| FirstLevel | query |  | No | string (integer) |
| LastLevel | query |  | No | string (integer) |
| PreservedCycles | query |  | No | string (integer) |
| BlocksPerCycle | query |  | No | string (integer) |
| BlocksPerCommitment | query |  | No | string (integer) |
| BlocksPerSnapshot | query |  | No | string (integer) |
| BlocksPerVoting | query |  | No | string (integer) |
| TimeBetweenBlocks | query |  | No | string (integer) |
| EndorsersPerBlock | query |  | No | string (integer) |
| HardOperationGasLimit | query |  | No | string (integer) |
| HardOperationStorageLimit | query |  | No | string (integer) |
| HardBlockGasLimit | query |  | No | string (integer) |
| TokensPerRoll | query |  | No | string (bigint) |
| RevelationReward | query |  | No | string (bigint) |
| BlockDeposit | query |  | No | string (bigint) |
| BlockReward0 | query |  | No | string (bigint) |
| BlockReward1 | query |  | No | string (bigint) |
| EndorsementDeposit | query |  | No | string (bigint) |
| EndorsementReward0 | query |  | No | string (bigint) |
| EndorsementReward1 | query |  | No | string (bigint) |
| OriginationSize | query |  | No | string (integer) |
| ByteCost | query |  | No | string (integer) |
| Protocols | body | Protocols | No | [Protocols](#protocols) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /RevealOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [RevealOps](#revealops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| RevealOps | body | RevealOps | No | [RevealOps](#revealops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| RevealOps | body | RevealOps | No | [RevealOps](#revealops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /RevelationPenaltyOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| BakerId | query |  | No | string (integer) |
| MissedLevel | query |  | No | string (integer) |
| LostReward | query |  | No | string (bigint) |
| LostFees | query |  | No | string (bigint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [RevelationPenaltyOps](#revelationpenaltyops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| RevelationPenaltyOps | body | RevelationPenaltyOps | No | [RevelationPenaltyOps](#revelationpenaltyops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| BakerId | query |  | No | string (integer) |
| MissedLevel | query |  | No | string (integer) |
| LostReward | query |  | No | string (bigint) |
| LostFees | query |  | No | string (bigint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| BakerId | query |  | No | string (integer) |
| MissedLevel | query |  | No | string (integer) |
| LostReward | query |  | No | string (bigint) |
| LostFees | query |  | No | string (bigint) |
| RevelationPenaltyOps | body | RevelationPenaltyOps | No | [RevelationPenaltyOps](#revelationpenaltyops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /SnapshotBalances

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| AccountId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [SnapshotBalances](#snapshotbalances) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| SnapshotBalances | body | SnapshotBalances | No | [SnapshotBalances](#snapshotbalances) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| AccountId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Balance | query |  | No | string (bigint) |
| AccountId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| SnapshotBalances | body | SnapshotBalances | No | [SnapshotBalances](#snapshotbalances) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /TransactionOps

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| TargetId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| Amount | query |  | No | string (bigint) |
| Parameters | query |  | No | string (text) |
| InternalOperations | query |  | No | string (smallint) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [TransactionOps](#transactionops) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| TransactionOps | body | TransactionOps | No | [TransactionOps](#transactionops) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| TargetId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| Amount | query |  | No | string (bigint) |
| Parameters | query |  | No | string (text) |
| InternalOperations | query |  | No | string (smallint) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Timestamp | query |  | No | string (timestamp without time zone) |
| OpHash | query |  | No | string (character) |
| SenderId | query |  | No | string (integer) |
| Counter | query |  | No | string (integer) |
| BakerFee | query |  | No | string (bigint) |
| StorageFee | query |  | No | string (bigint) |
| AllocationFee | query |  | No | string (bigint) |
| GasLimit | query |  | No | string (integer) |
| GasUsed | query |  | No | string (integer) |
| StorageLimit | query |  | No | string (integer) |
| StorageUsed | query |  | No | string (integer) |
| Status | query |  | No | string (smallint) |
| Errors | query |  | No | string (text) |
| InitiatorId | query |  | No | string (integer) |
| Nonce | query |  | No | string (integer) |
| TargetId | query |  | No | string (integer) |
| ResetDeactivation | query |  | No | string (integer) |
| Amount | query |  | No | string (bigint) |
| Parameters | query |  | No | string (text) |
| InternalOperations | query |  | No | string (smallint) |
| TransactionOps | body | TransactionOps | No | [TransactionOps](#transactionops) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /VotingEpoches

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Progress | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [VotingEpoches](#votingepoches) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| VotingEpoches | body | VotingEpoches | No | [VotingEpoches](#votingepoches) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Progress | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| Progress | query |  | No | string (integer) |
| VotingEpoches | body | VotingEpoches | No | [VotingEpoches](#votingepoches) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /VotingPeriods

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Code | query |  | No | string (integer) |
| EpochId | query |  | No | string (integer) |
| Kind | query |  | No | string (integer) |
| StartLevel | query |  | No | string (integer) |
| EndLevel | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| TotalStake | query |  | No | string (integer) |
| Participation | query |  | No | string (integer) |
| Quorum | query |  | No | string (integer) |
| Abstainings | query |  | No | string (integer) |
| Approvals | query |  | No | string (integer) |
| Refusals | query |  | No | string (integer) |
| PromotionPeriod_ProposalId | query |  | No | string (integer) |
| PromotionPeriod_TotalStake | query |  | No | string (integer) |
| PromotionPeriod_Participation | query |  | No | string (integer) |
| PromotionPeriod_Quorum | query |  | No | string (integer) |
| PromotionPeriod_Abstainings | query |  | No | string (integer) |
| PromotionPeriod_Approvals | query |  | No | string (integer) |
| PromotionPeriod_Refusals | query |  | No | string (integer) |
| TestingPeriod_ProposalId | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [VotingPeriods](#votingperiods) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| VotingPeriods | body | VotingPeriods | No | [VotingPeriods](#votingperiods) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Code | query |  | No | string (integer) |
| EpochId | query |  | No | string (integer) |
| Kind | query |  | No | string (integer) |
| StartLevel | query |  | No | string (integer) |
| EndLevel | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| TotalStake | query |  | No | string (integer) |
| Participation | query |  | No | string (integer) |
| Quorum | query |  | No | string (integer) |
| Abstainings | query |  | No | string (integer) |
| Approvals | query |  | No | string (integer) |
| Refusals | query |  | No | string (integer) |
| PromotionPeriod_ProposalId | query |  | No | string (integer) |
| PromotionPeriod_TotalStake | query |  | No | string (integer) |
| PromotionPeriod_Participation | query |  | No | string (integer) |
| PromotionPeriod_Quorum | query |  | No | string (integer) |
| PromotionPeriod_Abstainings | query |  | No | string (integer) |
| PromotionPeriod_Approvals | query |  | No | string (integer) |
| PromotionPeriod_Refusals | query |  | No | string (integer) |
| TestingPeriod_ProposalId | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Code | query |  | No | string (integer) |
| EpochId | query |  | No | string (integer) |
| Kind | query |  | No | string (integer) |
| StartLevel | query |  | No | string (integer) |
| EndLevel | query |  | No | string (integer) |
| ProposalId | query |  | No | string (integer) |
| TotalStake | query |  | No | string (integer) |
| Participation | query |  | No | string (integer) |
| Quorum | query |  | No | string (integer) |
| Abstainings | query |  | No | string (integer) |
| Approvals | query |  | No | string (integer) |
| Refusals | query |  | No | string (integer) |
| PromotionPeriod_ProposalId | query |  | No | string (integer) |
| PromotionPeriod_TotalStake | query |  | No | string (integer) |
| PromotionPeriod_Participation | query |  | No | string (integer) |
| PromotionPeriod_Quorum | query |  | No | string (integer) |
| PromotionPeriod_Abstainings | query |  | No | string (integer) |
| PromotionPeriod_Approvals | query |  | No | string (integer) |
| PromotionPeriod_Refusals | query |  | No | string (integer) |
| TestingPeriod_ProposalId | query |  | No | string (integer) |
| VotingPeriods | body | VotingPeriods | No | [VotingPeriods](#votingperiods) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /VotingSnapshots

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| PeriodId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [VotingSnapshots](#votingsnapshots) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| VotingSnapshots | body | VotingSnapshots | No | [VotingSnapshots](#votingsnapshots) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| PeriodId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| Id | query |  | No | string (integer) |
| Level | query |  | No | string (integer) |
| PeriodId | query |  | No | string (integer) |
| DelegateId | query |  | No | string (integer) |
| Rolls | query |  | No | string (integer) |
| VotingSnapshots | body | VotingSnapshots | No | [VotingSnapshots](#votingsnapshots) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### /__EFMigrationsHistory

#### GET
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| MigrationId | query |  | No | string (character varying) |
| ProductVersion | query |  | No | string (character varying) |
| select | query | Filtering Columns | No | string |
| order | query | Ordering | No | string |
| Range | header | Limiting and Pagination | No | string |
| Range-Unit | header | Limiting and Pagination | No | string |
| offset | query | Limiting and Pagination | No | string |
| limit | query | Limiting and Pagination | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | OK | [ [__EFMigrationsHistory](#__efmigrationshistory) ] |
| 206 | Partial Content |  |

#### POST
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| __EFMigrationsHistory | body | __EFMigrationsHistory | No | [__EFMigrationsHistory](#__efmigrationshistory) |
| select | query | Filtering Columns | No | string |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 201 | Created |

#### DELETE
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| MigrationId | query |  | No | string (character varying) |
| ProductVersion | query |  | No | string (character varying) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

#### PATCH
##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| MigrationId | query |  | No | string (character varying) |
| ProductVersion | query |  | No | string (character varying) |
| __EFMigrationsHistory | body | __EFMigrationsHistory | No | [__EFMigrationsHistory](#__efmigrationshistory) |
| Prefer | header | Preference | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| 204 | No Content |

### Models


#### Accounts

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Address | string (character) |  | Yes |
| Type | integer (smallint) |  | Yes |
| FirstLevel | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| LastLevel | integer (integer) |  | Yes |
| Balance | integer (bigint) |  | Yes |
| Counter | integer (integer) |  | Yes |
| ContractsCount | integer (integer) |  | Yes |
| DelegationsCount | integer (integer) |  | Yes |
| OriginationsCount | integer (integer) |  | Yes |
| TransactionsCount | integer (integer) |  | Yes |
| RevealsCount | integer (integer) |  | Yes |
| MigrationsCount | integer (integer) |  | Yes |
| DelegateId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| DelegationLevel | integer (integer) |  | No |
| Staked | boolean (boolean) |  | Yes |
| Kind | integer (smallint) |  | No |
| Spendable | boolean (boolean) |  | No |
| CreatorId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| ManagerId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| WeirdDelegateId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| Activated | boolean (boolean) |  | No |
| PublicKey | string (character varying) |  | No |
| Revealed | boolean (boolean) |  | No |
| ActivationLevel | integer (integer) |  | No |
| DeactivationLevel | integer (integer) |  | No |
| FrozenDeposits | integer (bigint) |  | No |
| FrozenRewards | integer (bigint) |  | No |
| FrozenFees | integer (bigint) |  | No |
| DelegatorsCount | integer (integer) |  | No |
| StakingBalance | integer (bigint) |  | No |
| BlocksCount | integer (integer) |  | No |
| EndorsementsCount | integer (integer) |  | No |
| BallotsCount | integer (integer) |  | No |
| ProposalsCount | integer (integer) |  | No |
| DoubleBakingCount | integer (integer) |  | No |
| DoubleEndorsingCount | integer (integer) |  | No |
| NonceRevelationsCount | integer (integer) |  | No |
| RevelationPenaltiesCount | integer (integer) |  | No |

#### ActivationOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| AccountId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| Balance | integer (bigint) |  | Yes |

#### AppState

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| KnownHead | integer (integer) |  | Yes |
| LastSync | string (timestamp without time zone) |  | Yes |
| Level | integer (integer) |  | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| Protocol | string (text) |  | No |
| NextProtocol | string (text) |  | No |
| Hash | string (text) |  | No |
| AccountCounter | integer (integer) |  | Yes |
| OperationCounter | integer (integer) |  | Yes |
| ManagerCounter | integer (integer) |  | Yes |
| AccountsCount | integer (integer) |  | Yes |
| BlocksCount | integer (integer) |  | Yes |
| ProtocolsCount | integer (integer) |  | Yes |
| ActivationOpsCount | integer (integer) |  | Yes |
| BallotOpsCount | integer (integer) |  | Yes |
| DelegationOpsCount | integer (integer) |  | Yes |
| DoubleBakingOpsCount | integer (integer) |  | Yes |
| DoubleEndorsingOpsCount | integer (integer) |  | Yes |
| EndorsementOpsCount | integer (integer) |  | Yes |
| NonceRevelationOpsCount | integer (integer) |  | Yes |
| OriginationOpsCount | integer (integer) |  | Yes |
| ProposalOpsCount | integer (integer) |  | Yes |
| RevealOpsCount | integer (integer) |  | Yes |
| TransactionOpsCount | integer (integer) |  | Yes |
| MigrationOpsCount | integer (integer) |  | Yes |
| RevelationPenaltyOpsCount | integer (integer) |  | Yes |
| ProposalsCount | integer (integer) |  | Yes |
| CyclesCount | integer (integer) |  | Yes |
| QuoteBtc | number (double precision) |  | Yes |
| QuoteEur | number (double precision) |  | Yes |
| QuoteLevel | integer (integer) |  | Yes |
| QuoteUsd | number (double precision) |  | Yes |

#### BakerCycles

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Cycle | integer (integer) |  | Yes |
| BakerId | integer (integer) |  | Yes |
| Rolls | integer (integer) |  | Yes |
| StakingBalance | integer (bigint) |  | Yes |
| DelegatedBalance | integer (bigint) |  | Yes |
| DelegatorsCount | integer (integer) |  | Yes |
| FutureBlocks | integer (integer) |  | Yes |
| OwnBlocks | integer (integer) |  | Yes |
| ExtraBlocks | integer (integer) |  | Yes |
| MissedOwnBlocks | integer (integer) |  | Yes |
| MissedExtraBlocks | integer (integer) |  | Yes |
| UncoveredOwnBlocks | integer (integer) |  | Yes |
| UncoveredExtraBlocks | integer (integer) |  | Yes |
| FutureEndorsements | integer (integer) |  | Yes |
| Endorsements | integer (integer) |  | Yes |
| MissedEndorsements | integer (integer) |  | Yes |
| UncoveredEndorsements | integer (integer) |  | Yes |
| FutureBlockRewards | integer (bigint) |  | Yes |
| OwnBlockRewards | integer (bigint) |  | Yes |
| ExtraBlockRewards | integer (bigint) |  | Yes |
| MissedOwnBlockRewards | integer (bigint) |  | Yes |
| MissedExtraBlockRewards | integer (bigint) |  | Yes |
| UncoveredOwnBlockRewards | integer (bigint) |  | Yes |
| UncoveredExtraBlockRewards | integer (bigint) |  | Yes |
| FutureEndorsementRewards | integer (bigint) |  | Yes |
| EndorsementRewards | integer (bigint) |  | Yes |
| MissedEndorsementRewards | integer (bigint) |  | Yes |
| UncoveredEndorsementRewards | integer (bigint) |  | Yes |
| OwnBlockFees | integer (bigint) |  | Yes |
| ExtraBlockFees | integer (bigint) |  | Yes |
| MissedOwnBlockFees | integer (bigint) |  | Yes |
| MissedExtraBlockFees | integer (bigint) |  | Yes |
| UncoveredOwnBlockFees | integer (bigint) |  | Yes |
| UncoveredExtraBlockFees | integer (bigint) |  | Yes |
| DoubleBakingRewards | integer (bigint) |  | Yes |
| DoubleBakingLostDeposits | integer (bigint) |  | Yes |
| DoubleBakingLostRewards | integer (bigint) |  | Yes |
| DoubleBakingLostFees | integer (bigint) |  | Yes |
| DoubleEndorsingRewards | integer (bigint) |  | Yes |
| DoubleEndorsingLostDeposits | integer (bigint) |  | Yes |
| DoubleEndorsingLostRewards | integer (bigint) |  | Yes |
| DoubleEndorsingLostFees | integer (bigint) |  | Yes |
| RevelationRewards | integer (bigint) |  | Yes |
| RevelationLostRewards | integer (bigint) |  | Yes |
| RevelationLostFees | integer (bigint) |  | Yes |
| FutureBlockDeposits | integer (bigint) |  | Yes |
| BlockDeposits | integer (bigint) |  | Yes |
| FutureEndorsementDeposits | integer (bigint) |  | Yes |
| EndorsementDeposits | integer (bigint) |  | Yes |
| ExpectedBlocks | number (double precision) |  | Yes |
| ExpectedEndorsements | number (double precision) |  | Yes |

#### BakingRights

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Cycle | integer (integer) |  | Yes |
| Level | integer (integer) |  | Yes |
| BakerId | integer (integer) |  | Yes |
| Type | integer (smallint) |  | Yes |
| Status | integer (smallint) |  | Yes |
| Priority | integer (integer) |  | No |
| Slots | integer (integer) |  | No |

#### BallotOps

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
| Vote | integer (integer) |  | Yes |

#### Blocks

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) |  | Yes |
| Hash | string (character) |  | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| ProtoCode | integer (integer) | Note: This is a Foreign Key to `Protocols.Code`.<fk table='Protocols' column='Code'/> | Yes |
| Priority | integer (integer) |  | Yes |
| Validations | integer (integer) |  | Yes |
| Events | integer (integer) |  | Yes |
| Operations | integer (integer) |  | Yes |
| Reward | integer (bigint) |  | Yes |
| Fees | integer (bigint) |  | Yes |
| BakerId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| RevelationId | integer (integer) | Note: This is a Foreign Key to `NonceRevelationOps.RevealedLevel`.<fk table='NonceRevelationOps' column='RevealedLevel'/> | No |
| ResetDeactivation | integer (integer) |  | No |

#### Cycles

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Index | integer (integer) |  | Yes |
| SnapshotIndex | integer (integer) |  | Yes |
| SnapshotLevel | integer (integer) |  | Yes |
| TotalRolls | integer (integer) |  | Yes |
| TotalStaking | integer (bigint) |  | Yes |
| TotalDelegated | integer (bigint) |  | Yes |
| TotalDelegators | integer (integer) |  | Yes |
| TotalBakers | integer (integer) |  | Yes |
| Seed | string (character) |  | Yes |

#### DelegationOps

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
| DelegateId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| PrevDelegateId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | No |
| ResetDeactivation | integer (integer) |  | No |

#### DelegatorCycles

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Cycle | integer (integer) |  | Yes |
| DelegatorId | integer (integer) |  | Yes |
| BakerId | integer (integer) |  | Yes |
| Balance | integer (bigint) |  | Yes |

#### DoubleBakingOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| AccusedLevel | integer (integer) |  | Yes |
| AccuserId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| AccuserReward | integer (bigint) |  | Yes |
| OffenderId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| OffenderLostDeposit | integer (bigint) |  | Yes |
| OffenderLostReward | integer (bigint) |  | Yes |
| OffenderLostFee | integer (bigint) |  | Yes |

#### DoubleEndorsingOps

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) | Note: This is a Foreign Key to `Blocks.Level`.<fk table='Blocks' column='Level'/> | Yes |
| Timestamp | string (timestamp without time zone) |  | Yes |
| OpHash | string (character) |  | Yes |
| AccusedLevel | integer (integer) |  | Yes |
| AccuserId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| AccuserReward | integer (bigint) |  | Yes |
| OffenderId | integer (integer) | Note: This is a Foreign Key to `Accounts.Id`.<fk table='Accounts' column='Id'/> | Yes |
| OffenderLostDeposit | integer (bigint) |  | Yes |
| OffenderLostReward | integer (bigint) |  | Yes |
| OffenderLostFee | integer (bigint) |  | Yes |

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

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Id | integer (integer) | Note: This is a Primary Key.<pk/> | Yes |
| Level | integer (integer) |  | Yes |
| PeriodId | integer (integer) | Note: This is a Foreign Key to `VotingPeriods.Id`.<fk table='VotingPeriods' column='Id'/> | Yes |
| DelegateId | integer (integer) |  | Yes |
| Rolls | integer (integer) |  | Yes |

#### __EFMigrationsHistory

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| MigrationId | string (character varying) | Note: This is a Primary Key.<pk/> | Yes |
| ProductVersion | string (character varying) |  | Yes |