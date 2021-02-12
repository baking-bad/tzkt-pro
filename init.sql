-- -----------------------------------------------------
-- roles
-- -----------------------------------------------------

-- tzkt

DROP ROLE IF EXISTS indexer;
CREATE ROLE indexer NOINHERIT;
GRANT indexer to tzkt;

-- postgrest & hasura

DROP ROLE IF EXISTS api_views_owner;
DROP ROLE IF EXISTS api_anon;
CREATE ROLE api_views_owner NOINHERIT;
CREATE ROLE api_anon NOINHERIT;
GRANT api_views_owner to tzkt;
GRANT api_anon to postgrest;
GRANT api_anon to hasura;

DROP SCHEMA IF EXISTS hdb_catalog CASCADE;
DROP SCHEMA IF EXISTS hdb_views CASCADE;
CREATE SCHEMA hdb_catalog;
CREATE SCHEMA hdb_views;

ALTER SCHEMA hdb_catalog OWNER TO hasura;
ALTER SCHEMA hdb_views OWNER TO hasura;

GRANT SELECT ON ALL TABLES IN SCHEMA information_schema TO hasura;
GRANT SELECT ON ALL TABLES IN SCHEMA pg_catalog TO hasura;

-- -----------------------------------------------------
-- schemas
-- -----------------------------------------------------

-- extensions

CREATE EXTENSION IF NOT EXISTS pgcrypto;
ALTER EXTENSION pgcrypto SET SCHEMA public;

GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO hasura;

-- public

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO indexer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO indexer;

GRANT USAGE ON SCHEMA public TO api_views_owner;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO api_views_owner;

GRANT USAGE ON SCHEMA public TO hasura;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO hasura;

-- api (postgrest)

DROP SCHEMA IF EXISTS api CASCADE;
CREATE SCHEMA api;

-- -----------------------------------------------------
-- functions
-- -----------------------------------------------------

-- ensure privileges to EXECUTE functions must be granted explicitly
ALTER DEFAULT PRIVILEGES REVOKE EXECUTE ON FUNCTIONS FROM PUBLIC;

-- -----------------------------------------------------
-- tables
-- -----------------------------------------------------

-- ...

-- -----------------------------------------------------
-- views
-- -----------------------------------------------------

-- -----------------------
-- users
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."users" AS
SELECT
    "accounts"."Address" AS "address",
    "accounts"."FirstLevel" AS "first_level",
    "accounts"."LastLevel" AS "last_level",
    "accounts"."Balance" AS "balance",
    "accounts"."Counter" AS "counter",
    "accounts"."ContractsCount" AS "num_contracts",
    "accounts"."DelegationsCount" AS "num_delegations",
    "accounts"."OriginationsCount" AS "num_originations",
    "accounts"."TransactionsCount" AS "num_transactions",
    "accounts"."RevealsCount" AS "num_reveals",
    "accounts"."MigrationsCount" AS "num_migrations",
    "accounts"."DelegateId" AS "delegate_id",
    "delegate"."Address" AS "delegate",
    "accounts"."DelegationLevel" AS "delegation_level",
    "accounts"."Staked" AS "is_staked",
    "accounts"."PublicKey" AS "public_key"
FROM "public"."Accounts" AS "accounts"
         LEFT JOIN "public"."Accounts" AS "delegate" ON "delegate"."Id" = "accounts"."DelegateId"
WHERE "accounts"."Type" = 0;

-- add view comments

COMMENT ON view "api"."users" IS 'User
Implicit accounts (tz) that are not registered as delegates.';

COMMENT ON column "api"."users"."address" IS 'Public key hash of the account';
COMMENT ON column "api"."users"."first_level" IS 'Block height of the first operation related to the account';
COMMENT ON column "api"."users"."last_level" IS 'Height of the block in which the account state was changed last time';
COMMENT ON column "api"."users"."balance" IS 'Account balance/Total balance of the delegate (baker), including spendable and frozen funds (micro tez)';
COMMENT ON column "api"."users"."counter" IS 'An account nonce which is used to prevent operation replay';
COMMENT ON column "api"."users"."num_contracts" IS 'Number of contracts, created (originated) and/or managed by the account';
COMMENT ON column "api"."users"."num_delegations" IS 'Number of delegation operations, related to the account';
COMMENT ON column "api"."users"."num_originations" IS 'Number of all origination (deployment / contract creation) operations, related to the account';
COMMENT ON column "api"."users"."num_transactions" IS 'Number of all transaction (tez transfer) operations, related to the account';
COMMENT ON column "api"."users"."num_reveals" IS 'Number of reveal (is used to reveal the public key associated with an account) operations of the contract';
COMMENT ON column "api"."users"."num_migrations" IS 'Number of migration (result of the context (database) migration during a protocol update) operations, related to the account (synthetic type)';
COMMENT ON column "api"."users"."delegate" IS 'Address of the current delegate of the account. null if it''s not delegated';
COMMENT ON column "api"."users"."delegation_level" IS 'Block height of latest delegation. null if it''s not delegated';
COMMENT ON column "api"."users"."is_staked" IS 'Whether account participates in staking (bakes or delegates)';
COMMENT ON column "api"."users"."public_key" IS 'Base58 representation of account''s public key, revealed by the account';

-- set view owner

ALTER VIEW "api"."users" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."users";

-- -----------------------
-- delegates
-- -----------------------

CREATE OR REPLACE VIEW "api"."delegates" AS
SELECT
    "accounts"."Address" AS "address",
    "accounts"."FirstLevel" AS "first_level",
    "accounts"."LastLevel" AS "last_level",
    "accounts"."Balance" AS "balance",
    "accounts"."Counter" AS "counter",
    "accounts"."ContractsCount" AS "num_contracts",
    "accounts"."DelegationsCount" AS "num_delegations",
    "accounts"."OriginationsCount" AS "num_originations",
    "accounts"."TransactionsCount" AS "num_transactions",
    "accounts"."RevealsCount" AS "num_reveals",
    "accounts"."MigrationsCount" AS "num_migrations",
    "accounts"."Staked" AS "is_staked",
    "accounts"."Activated" AS "is_activated",
    "accounts"."Revealed" AS "revealed",
    "accounts"."ActivationLevel" AS "activation_level",
    "accounts"."DeactivationLevel" AS "deactivation_level",
    "accounts"."FrozenDeposits" AS "frozen_deposits",
    "accounts"."FrozenRewards" AS "frozen_rewards",
    "accounts"."FrozenFees" AS "frozen_fees",
    "accounts"."DelegatorsCount" AS "delegators_count",
    "accounts"."StakingBalance" AS "staking_balance",
    "accounts"."BlocksCount" AS "num_blocks",
    "accounts"."EndorsementsCount" AS "num_endorsements",
    "accounts"."BallotsCount" AS "num_ballots",
    "accounts"."ProposalsCount" AS "num_proposals",
    "accounts"."DoubleBakingCount" AS "num_double_bakings",
    "accounts"."DoubleEndorsingCount" AS "num_double_endorsings",
    "accounts"."NonceRevelationsCount" AS "num_nonce_revelations",
    "accounts"."RevelationPenaltiesCount" AS "num_revelation_penalties"
FROM "public"."Accounts" AS "accounts"
WHERE "accounts"."Type" = 1;

-- add view comments

COMMENT ON view "api"."delegates" IS 'Delegate
Implicit accounts (tz) that are registered as delegates';

COMMENT ON column "api"."delegates"."address" IS 'Public key hash of the account';
COMMENT ON column "api"."delegates"."first_level" IS 'Block height of the first operation related to the account';
COMMENT ON column "api"."delegates"."last_level" IS 'Height of the block in which the account state was changed last time';
COMMENT ON column "api"."delegates"."balance" IS 'Account balance/Total balance of the delegate (baker), including spendable and frozen funds (micro tez)';
COMMENT ON column "api"."delegates"."counter" IS 'An account nonce which is used to prevent operation replay';
COMMENT ON column "api"."delegates"."num_contracts" IS 'Number of contracts, created (originated) and/or managed by the account';
COMMENT ON column "api"."delegates"."num_delegations" IS 'Number of delegation operations, related to the account';
COMMENT ON column "api"."delegates"."num_originations" IS 'Number of all origination (deployment / contract creation) operations, related to the account';
COMMENT ON column "api"."delegates"."num_transactions" IS 'Number of all transaction (tez transfer) operations, related to the account';
COMMENT ON column "api"."delegates"."num_reveals" IS 'Number of reveal (is used to reveal the public key associated with an account) operations of the contract';
COMMENT ON column "api"."delegates"."num_migrations" IS 'Number of migration (result of the context (database) migration during a protocol update) operations, related to the account (synthetic type)';
COMMENT ON column "api"."delegates"."is_staked" IS 'Whether account participates in staking (bakes or delegates)';
COMMENT ON column "api"."delegates"."is_activated" IS 'Delegation status (true - active, false - deactivated)';
COMMENT ON column "api"."delegates"."revealed" IS 'Public key revelation status. Unrevealed account can''t send manager operation (transaction, origination etc.)';
COMMENT ON column "api"."delegates"."activation_level" IS 'Block height when delegate (baker) was registered as a baker last time';
COMMENT ON column "api"."delegates"."deactivation_level" IS 'Block height when delegate (baker) was deactivated as a baker because of lack of funds or inactivity';
COMMENT ON column "api"."delegates"."frozen_deposits" IS 'Amount of security deposit, currently locked for baked (produced) blocks and (or) given endorsements (micro tez)';
COMMENT ON column "api"."delegates"."frozen_rewards" IS 'Amount of currently frozen baking rewards (micro tez)';
COMMENT ON column "api"."delegates"."frozen_fees" IS 'Amount of currently frozen fees paid by operations inside blocks, baked (produced) by the delegate (micro tez)';
COMMENT ON column "api"."delegates"."delegators_count" IS 'Number of current delegators (accounts, delegated their funds) of the delegate (baker)';
COMMENT ON column "api"."delegates"."staking_balance" IS 'Sum of delegate (baker) balance and delegated funds minus frozen rewards (micro tez)';
COMMENT ON column "api"."delegates"."num_blocks" IS 'Number of baked (validated) blocks all the time by the delegate (baker)';
COMMENT ON column "api"."delegates"."num_endorsements" IS 'Number of given endorsements (approvals) by the delegate (baker)';
COMMENT ON column "api"."delegates"."num_ballots" IS 'Number of submitted by the delegate ballots during a voting period';
COMMENT ON column "api"."delegates"."num_proposals" IS 'Number of submitted (upvoted) by the delegate proposals during a proposal period';
COMMENT ON column "api"."delegates"."num_double_bakings" IS 'Number of double baking (baking two different blocks at the same height) evidence operations, included in blocks, baked (validated) by the delegate';
COMMENT ON column "api"."delegates"."num_double_endorsings" IS 'Number of double endorsement (endorsing two different blocks at the same block height) evidence operations, included in blocks, baked (validated) by the delegate';
COMMENT ON column "api"."delegates"."num_nonce_revelations" IS 'Number of seed nonce revelation (are used by the blockchain to create randomness) operations provided by the delegate';
COMMENT ON column "api"."delegates"."num_revelation_penalties" IS 'Number of operations for all time in which rewards were lost due to unrevealed seed nonces by the delegate (synthetic type)';

-- set view owner

ALTER VIEW "api"."delegates" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."delegates";

-- -----------------------
-- contracts
-- -----------------------

CREATE OR REPLACE VIEW "api"."contracts" AS
SELECT
    "accounts"."Address" AS "address",
    "accounts"."FirstLevel" AS "first_level",
    "accounts"."LastLevel" AS "last_level",
    "accounts"."Balance" AS "balance",
    "accounts"."Counter" AS "counter",
    "accounts"."ContractsCount" AS "num_contracts",
    "accounts"."DelegationsCount" AS "num_delegations",
    "accounts"."OriginationsCount" AS "num_originations",
    "accounts"."TransactionsCount" AS "num_transactions",
    "accounts"."RevealsCount" AS "num_reveals",
    "accounts"."MigrationsCount" AS "num_migrations",
    "accounts"."DelegateId" AS "delegate_id",
    "delegate"."Address" AS "delegate",
    "accounts"."DelegationLevel" AS "delegation_level",
    "accounts"."Staked" AS "is_staked",
    CASE
        WHEN "accounts"."Kind" = 0 THEN 'delegator_contract'
        WHEN "accounts"."Kind" = 1 THEN 'smart_contract'
        ELSE NULL
        END AS "kind",
    "accounts"."CreatorId" AS "creator_id",
    "creator"."Address" AS "creator",
    "accounts"."PublicKey" AS "public_key"
    FROM "public"."Accounts" AS "accounts"
        LEFT JOIN "public"."Accounts" AS "delegate" ON "delegate"."Id" = "accounts"."DelegateId"
        LEFT JOIN "public"."Accounts" AS "creator" ON "delegate"."Id" = "accounts"."CreatorId"
    WHERE "accounts"."Type" = 2;

-- add view comments

COMMENT ON view "api"."contracts" IS 'Contract
Originated accounts (KT) that have code';

COMMENT ON column "api"."contracts"."address" IS 'Public key hash of the account';
COMMENT ON column "api"."contracts"."first_level" IS 'Block height of the first operation related to the account';
COMMENT ON column "api"."contracts"."last_level" IS 'Height of the block in which the account state was changed last time';
COMMENT ON column "api"."contracts"."balance" IS 'Account balance/Total balance of the delegate (baker), including spendable and frozen funds (micro tez)';
COMMENT ON column "api"."contracts"."counter" IS 'An account nonce which is used to prevent operation replay';
COMMENT ON column "api"."contracts"."num_contracts" IS 'Number of contracts, created (originated) and/or managed by the account';
COMMENT ON column "api"."contracts"."num_delegations" IS 'Number of delegation operations, related to the account';
COMMENT ON column "api"."contracts"."num_originations" IS 'Number of all origination (deployment / contract creation) operations, related to the account';
COMMENT ON column "api"."contracts"."num_transactions" IS 'Number of all transaction (tez transfer) operations, related to the account';
COMMENT ON column "api"."contracts"."num_reveals" IS 'Number of reveal (is used to reveal the public key associated with an account) operations of the contract';
COMMENT ON column "api"."contracts"."num_migrations" IS 'Number of migration (result of the context (database) migration during a protocol update) operations, related to the account (synthetic type)';
COMMENT ON column "api"."contracts"."delegate" IS 'Address of the current delegate of the account. null if it''s not delegated';
COMMENT ON column "api"."contracts"."delegation_level" IS 'Block height of latest delegation. null if it''s not delegated';
COMMENT ON column "api"."contracts"."is_staked" IS 'Whether account participates in staking (bakes or delegates)';
COMMENT ON column "api"."contracts"."kind" IS 'Sub kinds: delegator_contract (aka manager.tz) or smart_contract';
COMMENT ON column "api"."contracts"."creator" IS 'Address of the account, which has deployed the contract to the blockchain';
COMMENT ON column "api"."contracts"."public_key" IS 'Base58 representation of account''s public key, revealed by the account';

-- set view owner

ALTER VIEW "api"."contracts" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."contracts";

-- -----------------------
-- activations
-- -----------------------

-- -----------------------
-- activations
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."activations" AS
SELECT
    "activations"."Level" AS "level",
    "activations"."Timestamp" AS "timestamp",
    "activations"."OpHash" AS "hash",
    "activations"."AccountId" AS "account_id",
    "account"."Address" AS "account",
    "activations"."Balance" AS "balance"
FROM
    "public"."ActivationOps" AS "activations"
    LEFT JOIN "public"."Accounts" AS "account" ON "account"."Id" = "activations"."AccountId";

-- add view comments

COMMENT ON view "api"."activations" IS 'Activation
Used to activate accounts that were recommended allocations of tezos tokens for donations to the Tezos Foundation’s fundraiser';

COMMENT ON column "api"."activations"."level" IS 'The height of the block, from the genesis block, in which the operation was included';
COMMENT ON column "api"."activations"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."activations"."hash" IS 'Hash of the operation';
COMMENT ON column "api"."activations"."account" IS 'Address of the activated account';
COMMENT ON column "api"."activations"."balance" IS 'Account activation balance of tezos tokens that were recommended allocations for donations to the Tezos Foundation’s fundraiser';

-- set view owner

ALTER VIEW "api"."activations" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."activations";

-- -----------------------
-- summary
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."summary" AS
SELECT
    "summary"."Level" AS "level",
    "summary"."Timestamp" AS "timestamp",
    "summary"."Protocol" AS "protocol",
    "summary"."NextProtocol" AS "next_protocol",
    "summary"."Hash" AS "block_hash",
    "summary"."AccountsCount" AS "num_accounts",
    "summary"."ProtocolsCount" AS "num_protocols",
    "summary"."ActivationOpsCount" AS "num_activations",
    "summary"."BallotOpsCount" AS "num_ballots",
    "summary"."DelegationOpsCount" AS "num_delegations",
    "summary"."DoubleBakingOpsCount" AS "num_double_bakings",
    "summary"."DoubleEndorsingOpsCount" AS "num_double_endorsings",
    "summary"."EndorsementOpsCount" AS "num_endorsements",
    "summary"."NonceRevelationOpsCount" AS "num_nonce_revelations",
    "summary"."OriginationOpsCount" AS "num_originations",
    "summary"."ProposalOpsCount" AS "num_proposals",
    "summary"."RevealOpsCount" AS "num_reveals",
    "summary"."TransactionOpsCount" AS "num_transactions",
    "summary"."MigrationOpsCount" AS "num_migrations",
    "summary"."RevelationPenaltyOpsCount" AS "num_revelation_penalties",
    "summary"."ProposalsCount" AS "num_protocol_proposals",
    "summary"."CyclesCount" AS "num_cycles",
    "summary"."QuoteBtc" AS "xtz_btc",
    "summary"."QuoteEur" AS "xtz_eur",
    "summary"."QuoteLevel" AS "quote_level",
    "summary"."QuoteUsd" AS "xtz_usd"
FROM
    "public"."AppState" AS "summary";

-- add view comments

COMMENT ON view "api"."summary" IS 'Summary
';

COMMENT ON column "api"."summary"."level" IS 'The height of the block';
COMMENT ON column "api"."summary"."timestamp" IS 'Datetime of the block (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."summary"."protocol" IS 'Protocol hash';
COMMENT ON column "api"."summary"."next_protocol" IS 'Next protocol hash';
COMMENT ON column "api"."summary"."block_hash" IS 'Block hash';
COMMENT ON column "api"."summary"."num_accounts" IS 'Total number of accounts of all types (user, delegate, contract) seen till this block (inclusive)';
COMMENT ON column "api"."summary"."num_activations" IS 'Total number of account activations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_ballots" IS 'Total number of ballot operations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_delegations" IS 'Total number of delegation operations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_double_bakings" IS 'Total number of double baking evidences published till this block (inclusive)';
COMMENT ON column "api"."summary"."num_double_endorsings" IS 'Total number of double endorsing evidences published till this block (inclusive)';
COMMENT ON column "api"."summary"."num_endorsements" IS 'Total number of endorsements applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_nonce_revelations" IS 'Total number of nonce revelations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_originations" IS 'Total number of originations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_proposals" IS 'Total number of proposal operations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_reveals" IS 'Total number of reveal operations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_transactions" IS 'Total number of transactions applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_migrations" IS 'Total number of migrations applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_revelation_penalties" IS 'Total number of revelation penalties applied till this block (inclusive)';
COMMENT ON column "api"."summary"."num_protocol_proposals" IS 'Total number of protocol proposals seen till this block (inclusive)';
COMMENT ON column "api"."summary"."num_cycles" IS 'Total number of cycles';
COMMENT ON column "api"."summary"."xtz_btc" IS 'XTZ/BTC price';
COMMENT ON column "api"."summary"."xtz_eur" IS 'XTZ/EUR price';
COMMENT ON column "api"."summary"."quote_level" IS 'Used in async mode';
COMMENT ON column "api"."summary"."xtz_usd" IS 'XTZ/USD price';

-- set view owner

ALTER VIEW "api"."summary" OWNER TO "api_views_owner";

-- test

SELECT * FROM "api"."summary";

-- -----------------------
-- rewards
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."rewards" AS
SELECT
   "rewards"."Cycle" AS "cycle",
   "rewards"."BakerId" AS "baker_id",
   "baker"."Address" AS "baker",
   "rewards"."Rolls" AS "num_rolls",
   "rewards"."StakingBalance" AS "staking_balance",
   "rewards"."DelegatedBalance" AS "delegated_balance",
   "rewards"."DelegatorsCount" AS "num_delegators",
   "rewards"."FutureBlocks" AS "num_future_blocks",
   "rewards"."OwnBlocks" AS "num_own_blocks",
   "rewards"."ExtraBlocks" AS "num_extra_blocks",
   "rewards"."MissedOwnBlocks" AS "num_missed_own_blocks",
   "rewards"."MissedExtraBlocks" AS "num_missed_extra_blocks",
   "rewards"."UncoveredOwnBlocks" AS "num_uncovered_own_blocks",
   "rewards"."UncoveredExtraBlocks" AS "num_uncovered_extra_blocks",
   "rewards"."FutureEndorsements" AS "num_future_endorsements",
   "rewards"."Endorsements" AS "num_endorsements",
   "rewards"."MissedEndorsements" AS "num_missed_endorsements",
   "rewards"."UncoveredEndorsements" AS "num_uncovered_endorsements",
   "rewards"."FutureBlockRewards" AS "future_block_rewards",
   "rewards"."OwnBlockRewards" AS "own_block_rewards",
   "rewards"."ExtraBlockRewards" AS "extra_block_rewards",
   "rewards"."MissedOwnBlockRewards" AS "missed_own_block_rewards",
   "rewards"."MissedExtraBlockRewards" AS "missed_extra_block_rewards",
   "rewards"."UncoveredOwnBlockRewards" AS "uncovered_own_block_rewards",
   "rewards"."UncoveredExtraBlockRewards" AS "uncovered_extra_block_rewards",
   "rewards"."FutureEndorsementRewards" AS "future_endorsement_rewards",
   "rewards"."EndorsementRewards" AS "endorsement_rewards",
   "rewards"."MissedEndorsementRewards" AS "missed_endorsement_rewards",
   "rewards"."UncoveredEndorsementRewards" AS "uncovered_endorsement_rewards",
   "rewards"."OwnBlockFees" AS "own_block_fees",
   "rewards"."ExtraBlockFees" AS "extra_block_fees",
   "rewards"."MissedOwnBlockFees" AS "missed_own_block_fees",
   "rewards"."MissedExtraBlockFees" AS "missed_extra_block_fees",
   "rewards"."UncoveredOwnBlockFees" AS "uncovered_own_block_fees",
   "rewards"."UncoveredExtraBlockFees" AS "uncovered_extra_block_fees",
   "rewards"."DoubleBakingRewards" AS "double_baking_rewards",
   "rewards"."DoubleBakingLostDeposits" AS "double_baking_lost_deposits",
   "rewards"."DoubleBakingLostRewards" AS "double_baking_lost_rewards",
   "rewards"."DoubleBakingLostFees" AS "double_baking_lost_fees",
   "rewards"."DoubleEndorsingRewards" AS "double_endorsing_rewards",
   "rewards"."DoubleEndorsingLostDeposits" AS "double_endorsing_lost_deposits",
   "rewards"."DoubleEndorsingLostRewards" AS "double_endorsing_lost_rewards",
   "rewards"."DoubleEndorsingLostFees" AS "double_endorsing_lost_fees",
   "rewards"."RevelationRewards" AS "revelation_rewards",
   "rewards"."RevelationLostRewards" AS "revelation_lost_rewards",
   "rewards"."RevelationLostFees" AS "revelation_lost_fees",
   "rewards"."FutureBlockDeposits" AS "future_block_deposits",
   "rewards"."BlockDeposits" AS "block_deposits",
   "rewards"."FutureEndorsementDeposits" AS "future_endorsement_deposits",
   "rewards"."EndorsementDeposits" AS "endorsement_deposits",
   "rewards"."ExpectedBlocks" AS "expected_blocks",
   "rewards"."ExpectedEndorsements" AS "expected_endorsements",
   COALESCE("rewards"."OwnBlockRewards", 0) + COALESCE("rewards"."ExtraBlockRewards", 0) + COALESCE("rewards"."EndorsementRewards", 0) + COALESCE("rewards"."OwnBlockFees", 0) + COALESCE("rewards"."ExtraBlockFees", 0) + COALESCE("rewards"."RevelationRewards", 0) + COALESCE("rewards"."DoubleBakingRewards", 0) + COALESCE("rewards"."DoubleEndorsingRewards") AS "total_rewards",
   COALESCE("rewards"."DoubleBakingLostDeposits", 0) + COALESCE("rewards"."DoubleBakingLostRewards", 0) + COALESCE("rewards"."DoubleBakingLostFees", 0) + COALESCE("rewards"."DoubleEndorsingLostDeposits", 0) + COALESCE("rewards"."DoubleEndorsingLostRewards", 0) + COALESCE("rewards"."DoubleEndorsingLostFees", 0) + COALESCE("rewards"."RevelationLostRewards", 0) + COALESCE("rewards"."RevelationLostFees") AS "total_penalties"
FROM
    "public"."BakerCycles" AS "rewards"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "rewards"."BakerId";


-- add view comments

COMMENT ON view "api"."rewards" IS 'Reward
Baker rewards/penalties per cycle with breakdown by reward/penalty kind';

COMMENT ON column "api"."rewards"."cycle" IS 'Cycle in which rewards have been or will be earned.';
COMMENT ON column "api"."rewards"."baker" IS 'Baker address';
COMMENT ON column "api"."rewards"."staking_balance" IS 'Staking balance of the baker at the snapshot time.';
COMMENT ON column "api"."rewards"."delegated_balance" IS 'Balance delegated to the baker at the snapshot time (sum of delegators'' balances).';
COMMENT ON column "api"."rewards"."num_delegators" IS 'Number of delegators at the snapshot time.';
COMMENT ON column "api"."rewards"."num_future_blocks" IS 'Number of blocks which baker is allowed to produce in this cycle based on future baking rights.';
COMMENT ON column "api"."rewards"."num_own_blocks" IS 'Number of successfully baked blocks with priority 0.';
COMMENT ON column "api"."rewards"."num_extra_blocks" IS 'Number of successfully baked blocks with priority 1+.';
COMMENT ON column "api"."rewards"."num_missed_own_blocks" IS 'Number of blocks which were missed at priority 0 for no apparent reason (usually due to issues with network or node).';
COMMENT ON column "api"."rewards"."num_missed_extra_blocks" IS 'Number of blocks which were missed at priority 1+ for no apparent reason (usually due to issues with network or node).';
COMMENT ON column "api"."rewards"."num_uncovered_own_blocks" IS 'Number of blocks which were missed at priority 0 due to lack of bonds (for example, when a baker is overdelegated).';
COMMENT ON column "api"."rewards"."num_uncovered_extra_blocks" IS 'Number of blocks which were missed at priority 1+ due to lack of bonds (for example, when a baker is overdelegated).';
COMMENT ON column "api"."rewards"."num_future_endorsements" IS 'Number of slots which baker is allowed to validate in this cycle based on future endorsing rights.';
COMMENT ON column "api"."rewards"."num_endorsements" IS 'Number of successfully endorsed slots.';
COMMENT ON column "api"."rewards"."num_missed_endorsements" IS 'Number of endorsing slots which were missed for no apparent reason (usually due to issues with network or node).';
COMMENT ON column "api"."rewards"."num_uncovered_endorsements" IS 'Number of endorsing slots which were missed due to lack of bonds (for example, when a baker is overdelegated).';
COMMENT ON column "api"."rewards"."future_block_rewards" IS 'Estimated value of future block rewards.';
COMMENT ON column "api"."rewards"."own_block_rewards" IS 'Rewards received for blocks baked with priority 0.';
COMMENT ON column "api"."rewards"."extra_block_rewards" IS 'Rewards received for blocks baked with priority 1+.';
COMMENT ON column "api"."rewards"."missed_own_block_rewards" IS 'Rewards which were not received due to missing own blocks.';
COMMENT ON column "api"."rewards"."missed_extra_block_rewards" IS 'Rewards which were not received due to missing extra blocks.';
COMMENT ON column "api"."rewards"."uncovered_own_block_rewards" IS 'Rewards which were not received due to missing own blocks due to lack of bonds.';
COMMENT ON column "api"."rewards"."uncovered_extra_block_rewards" IS 'Rewards which were not received due to missing extra blocks due to lack of bonds.';
COMMENT ON column "api"."rewards"."future_endorsement_rewards" IS 'Estimated value of future endorsing rewards.';
COMMENT ON column "api"."rewards"."endorsement_rewards" IS 'Rewards received for endorsed slots.';
COMMENT ON column "api"."rewards"."missed_endorsement_rewards" IS 'Rewards which were not received due to missing endorsements.';
COMMENT ON column "api"."rewards"."uncovered_endorsement_rewards" IS 'Rewards which were not received due to missing endorsements due to lack of bonds.';
COMMENT ON column "api"."rewards"."own_block_fees" IS 'Operation fees which were harvested from successfully baked blocks with priority 0.';
COMMENT ON column "api"."rewards"."extra_block_fees" IS 'Operation fees which were harvested from successfully baked blocks with priority 1+.';
COMMENT ON column "api"."rewards"."missed_own_block_fees" IS 'Operation fees which were not received due to missing own blocks.';
COMMENT ON column "api"."rewards"."missed_extra_block_fees" IS 'Operation fees which were not received due to missing extra blocks.';
COMMENT ON column "api"."rewards"."uncovered_own_block_fees" IS 'Operation fees which were not received due to missing own blocks (due to lack of bonds).';
COMMENT ON column "api"."rewards"."uncovered_extra_block_fees" IS 'Operation fees which were not received due to missing extra blocks (due to lack of bonds).';
COMMENT ON column "api"."rewards"."double_baking_rewards" IS 'Rewards for detecting double baking (accusing someone of producing two different blocks at the same level).';
COMMENT ON column "api"."rewards"."double_baking_lost_deposits" IS 'Bonds lost due to double baking';
COMMENT ON column "api"."rewards"."double_baking_lost_rewards" IS 'Rewards lost due to double baking';
COMMENT ON column "api"."rewards"."double_baking_lost_fees" IS 'Fees lost due to double baking';
COMMENT ON column "api"."rewards"."double_endorsing_rewards" IS 'Rewards for detecting double endorsing (accusing someone of validating two different blocks at the same level).';
COMMENT ON column "api"."rewards"."double_endorsing_lost_deposits" IS 'Bonds lost due to double endorsing';
COMMENT ON column "api"."rewards"."double_endorsing_lost_rewards" IS 'Rewards lost due to double endorsing';
COMMENT ON column "api"."rewards"."double_endorsing_lost_fees" IS 'Fees lost due to double endorsing';
COMMENT ON column "api"."rewards"."revelation_rewards" IS 'Rewards for including into a block seed nonce revelation operations.';
COMMENT ON column "api"."rewards"."revelation_lost_rewards" IS 'Rewards lost due to missing seed nonce revelation.';
COMMENT ON column "api"."rewards"."revelation_lost_fees" IS 'Fees lost due to missing seed nonce revelation.';
COMMENT ON column "api"."rewards"."future_block_deposits" IS 'Estimated value of bonds which will be locked as security deposit for future blocks.';
COMMENT ON column "api"."rewards"."block_deposits" IS 'Bonds which were locked as a security deposit for baking own and extra blocks.';
COMMENT ON column "api"."rewards"."future_endorsement_deposits" IS 'Estimated value of bonds which will be locked as security deposit for future endorsements.';
COMMENT ON column "api"."rewards"."endorsement_deposits" IS 'Bonds which were locked as a security deposit for endorsed slots.';
COMMENT ON column "api"."rewards"."expected_blocks" IS 'Expected value of how many blocks baker should produce based on baker''s rolls, total rolls and blocks per cycle.';
COMMENT ON column "api"."rewards"."expected_endorsements" IS 'Expected value of how many slots baker should validate based on baker''s rolls, total rolls and endorsing slots per cycle.';
COMMENT ON column "api"."rewards"."total_rewards" IS 'Total cycle rewards (positive)';
COMMENT ON column "api"."rewards"."total_penalties" IS 'Total cycle penalties';

-- set view owner

ALTER VIEW "api"."rewards" OWNER TO "api_views_owner";

-- test

SELECT * FROM "api"."rewards";

-- -----------------------
-- rights
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."rights" AS
SELECT
    "rights"."Cycle" AS "cycle",
    "rights"."Level" AS "level",
    "rights"."BakerId" AS "baker_id",
    "baker"."Address" AS "baker",
    CASE
        WHEN "rights"."Type" = 0 THEN 'baking'
        WHEN "rights"."Type" = 1 THEN 'endorsing'
        ELSE NULL
    END AS "type",
    CASE
        WHEN "rights"."Status" = 0 THEN 'future'
        WHEN "rights"."Status" = 1 THEN 'realized'
        WHEN "rights"."Status" = 2 THEN 'uncovered'
        WHEN "rights"."Status" = 3 THEN 'missed'
        ELSE NULL
    END AS "status",
    "rights"."Priority" AS "priority",
    "rights"."Slots" AS "num_slots"
FROM
    "public"."BakingRights" AS "rights"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "rights"."BakerId";

-- add view comments

COMMENT ON view "api"."rights" IS 'Right
';

COMMENT ON column "api"."rights"."cycle" IS 'Cycle on which the right can be realized.';
COMMENT ON column "api"."rights"."level" IS 'Level at which a block must be baked or an endorsement must be sent.';
COMMENT ON column "api"."rights"."baker" IS 'Baker address to which baking or endorsing right has been given.';
COMMENT ON column "api"."rights"."type" IS 'baking - right to bake (produce) a block;\nendorsing - right to endorse (validate) a block.';
COMMENT ON column "api"."rights"."status" IS 'future - the right is not realized yet;\nrealized - the right was successfully realized;\nuncovered - the right was not realized due to lack of bonds (for example, when a baker is overdelegated);\nmissed - the right was not realized for no apparent reason (usually due to issues with network or node).';
COMMENT ON column "api"."rights"."priority" IS 'Priority (0 - ∞) with which baker can produce a block. If a baker with priority 0 doesn''t produce a block within a given time interval, then the right goes to a baker with priority1, etc. For endorsing rights this field is always null.';
COMMENT ON column "api"."rights"."num_slots" IS 'Number of slots (1 - 32) to be endorsed. For baking rights this field is always null.';

-- set view owner

ALTER VIEW "api"."rights" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."rights";

-- -----------------------
-- ballots
-- -----------------------

-- create view

/* CREATE OR REPLACE VIEW "api"."ballots" AS
SELECT
    "ballots"."Level" AS "level",
    "ballots"."Timestamp" AS "timestamp",
    "ballots"."OpHash" AS "hash",
    "ballots"."PeriodId" AS "period_id",
    -- "voting_period"."Index" AS "voting_period",
    "ballots"."ProposalId" AS "proposal_id",
    "proposal"."Hash" AS "proposal",
    "ballots"."SenderId" AS "baker_id",
    "baker"."Address" AS "baker",
    "ballots"."Rolls" AS "num_rolls",
    CASE
        WHEN "ballots"."Vote" = 0 THEN 'yay'
        WHEN "ballots"."Vote" = 1 THEN 'nay'
        WHEN "ballots"."Vote" = 2 THEN 'pass'
        ELSE NULL
    END AS "vote"
FROM
    "public"."BallotOps" AS "ballots"
    -- LEFT JOIN "public"."VotingPeriods" AS "voting_period" ON "voting_period"."Id" = "ballots"."PeriodId"
    LEFT JOIN "public"."Proposals" AS "proposal" ON "proposal"."Id" = "ballots"."ProposalId"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "ballots"."SenderId";

-- add view comments

COMMENT ON view "api"."ballots" IS 'Ballot
Used to vote for a proposal in a given voting cycle';

COMMENT ON column "api"."ballots"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."ballots"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."ballots"."hash" IS 'Hash of the operation';
-- COMMENT ON column "api"."ballots"."voting_period" IS 'Index of the voting period for which the ballot was submitted';
COMMENT ON column "api"."ballots"."proposal" IS 'Hash of the proposal for which ballot was submitted';
COMMENT ON column "api"."ballots"."baker" IS 'Information about the delegate (baker), submitted the ballot';
COMMENT ON column "api"."ballots"."num_rolls" IS 'Number of baker''s rolls (baker''s voting power)';
COMMENT ON column "api"."ballots"."vote" IS 'Vote, given in the ballot (yay, nay, or pass)';

-- set view owner

ALTER VIEW "api"."ballots" OWNER TO "api_views_owner"; */

-- test

-- SELECT * FROM "api"."ballots";

-- -----------------------
-- blocks
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."blocks" AS
SELECT
    "blocks"."Level" AS "level",
    "blocks"."Hash" AS "hash",
    "blocks"."Timestamp" AS "timestamp",
    "blocks"."ProtoCode" AS "proto_code",
    "blocks"."Priority" AS "priority",
    "blocks"."Validations" AS "num_endorsements",
    ("blocks"."Events" & 1 > 0) AS "is_cycle_start",
    ("blocks"."Events" & 2 > 0) AS "is_cycle_end",
    ("blocks"."Events" & 4 > 0) AS "is_protocol_start",
    ("blocks"."Events" & 8 > 0) AS "is_protocol_end",
    ("blocks"."Events" & 16 > 0) AS "is_voting_period_start",
    ("blocks"."Events" & 32 > 0) AS "is_voring_period_end",
    ("blocks"."Events" & 64 > 0) AS "has_deactivations",
    ("blocks"."Events" & 128 > 0) AS "has_account_allocations",
    ("blocks"."Events" & 256 > 0) AS "has_smart_contract_interaction",
    ("blocks"."Events" & 512 > 0) AS "is_snapshot",
    ("blocks"."Events" & 1024 > 0) AS "has_delegator_contract_interaction",
    ("blocks"."Operations" & 2 > 0) AS "has_ballots",
    ("blocks"."Operations" & 4 > 0) AS "has_proposals",
    ("blocks"."Operations" & 8 > 0) AS "has_activations",
    ("blocks"."Operations" & 16 > 0) AS "has_double_bakings",
    ("blocks"."Operations" & 32 > 0) AS "has_double_endorsings",
    ("blocks"."Operations" & 64 > 0) AS "has_revelations",
    ("blocks"."Operations" & 128 > 0) AS "has_transactions",
    ("blocks"."Operations" & 256 > 0) AS "has_reveals",
    ("blocks"."Operations" & 512 > 0) AS "has_migrations",
    ("blocks"."Operations" & 1024 > 0) AS "has_revelations_penalties",
    "blocks"."Reward" AS "reward",
    "blocks"."Fees" AS "fees",
    "blocks"."BakerId" AS "baker_id",
    "baker"."Address" AS "baker",
    "blocks"."RevelationId" AS "revelation_id"
FROM
    "public"."Blocks" AS "blocks"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "blocks"."BakerId";

-- add view comments

COMMENT ON view "api"."blocks" IS 'Block
';

COMMENT ON column "api"."blocks"."level" IS 'The height of the block from the genesis block';
COMMENT ON column "api"."blocks"."hash" IS 'Block hash';
COMMENT ON column "api"."blocks"."timestamp" IS 'The datetime at which the block is claimed to have been created (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."blocks"."proto_code" IS 'Protocol code, representing a number of protocol changes since genesis (mod 256, but -1 for the genesis block)';
COMMENT ON column "api"."blocks"."priority" IS 'The position in the priority list of delegates at which the block was baked';
COMMENT ON column "api"."blocks"."num_endorsements" IS 'Number of endorsements, confirming the block';
COMMENT ON column "api"."blocks"."is_cycle_start" IS 'This is the first block of the cycle';
COMMENT ON column "api"."blocks"."is_cycle_end" IS 'This is the last block of the cycle';
COMMENT ON column "api"."blocks"."is_protocol_start" IS 'This is the first block of a protocol';
COMMENT ON column "api"."blocks"."is_protocol_end" IS 'This is the last block of a protocol';
COMMENT ON column "api"."blocks"."is_voting_period_start" IS 'This is the first block of a voting period';
COMMENT ON column "api"."blocks"."is_voring_period_end" IS 'This is the last block of a voting period';
COMMENT ON column "api"."blocks"."has_deactivations" IS 'At least one delegate (baker) was deactivated in this block';
COMMENT ON column "api"."blocks"."has_account_allocations" IS 'At least one account was allocated (via origination, activation, or transaction to a non-existent address) was deactivated in this block';
COMMENT ON column "api"."blocks"."has_smart_contract_interaction" IS 'In this block a smart-contract (excluding manager.tz) was deployed or invoked.';
COMMENT ON column "api"."blocks"."is_snapshot" IS 'This block was randomly chosen for making a snapshot of balances.';
COMMENT ON column "api"."blocks"."has_delegator_contract_interaction" IS 'In this block a delegator contract (manager.tz) was deployed or invoked.';
COMMENT ON column "api"."blocks"."has_ballots" IS 'At least one ballot operation was injected in this block.';
COMMENT ON column "api"."blocks"."has_proposals" IS 'At least one proposal operation was injected in this block.';
COMMENT ON column "api"."blocks"."has_activations" IS 'At least one activation operation was injected in this block.';
COMMENT ON column "api"."blocks"."has_double_bakings" IS 'At least one double baking accusation was injected in this block.';
COMMENT ON column "api"."blocks"."has_double_endorsings" IS 'At least one double endorsement accusation was in during this block.';
COMMENT ON column "api"."blocks"."has_revelations" IS 'At least one nonce revelation operation was injected in this block.';
COMMENT ON column "api"."blocks"."has_transactions" IS 'At least one transaction operation was injected in this block.';
COMMENT ON column "api"."blocks"."has_reveals" IS 'At least one reveal operation was injected in this block.';
COMMENT ON column "api"."blocks"."has_migrations" IS 'A context migration happened in this block.';
COMMENT ON column "api"."blocks"."has_revelations_penalties" IS 'A penalty for not revealing seed nonce was applied in this block.';
COMMENT ON column "api"."blocks"."reward" IS 'Reward of the baker for producing the block (micro tez)';
COMMENT ON column "api"."blocks"."fees" IS 'Total fee paid by all operations, included in the block';
COMMENT ON column "api"."blocks"."baker_id" IS 'Accounts';
COMMENT ON column "api"."blocks"."baker" IS 'Address of the delegate (baker), produced the block';

-- set view owner

ALTER VIEW "api"."blocks" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."blocks";

-- -----------------------
-- cycles
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."cycles" AS
SELECT
    "cycles"."Index" AS "index",
    "cycles"."SnapshotIndex" AS "snapshot_index",
    "cycles"."SnapshotLevel" AS "snapshot_level",
    "cycles"."TotalRolls" AS "total_rolls",
    "cycles"."TotalStaking" AS "total_staking",
    "cycles"."TotalDelegated" AS "total_delegated",
    "cycles"."TotalDelegators" AS "total_delegators",
    "cycles"."TotalBakers" AS "total_bakers",
    "cycles"."Seed" AS "seed"
FROM
    "public"."Cycles" AS "cycles";

-- add view comments

COMMENT ON view "api"."cycles" IS 'Cycle
';

COMMENT ON column "api"."cycles"."index" is 'Cycle index starting from zero';
COMMENT ON column "api"."cycles"."snapshot_index" is 'Relative index of the snapshot';
COMMENT ON column "api"."cycles"."snapshot_level" is 'Height of the block where the snapshot was taken';
COMMENT ON column "api"."cycles"."total_rolls" is 'Total number of rolls involved in baking rights distribution';
COMMENT ON column "api"."cycles"."total_staking" is 'Total staking balance of all active in this cycle bakers';
COMMENT ON column "api"."cycles"."total_delegated" is 'Total balance delegated to active bakers';
COMMENT ON column "api"."cycles"."total_delegators" is 'Total number of active bakers'' delegators';
COMMENT ON column "api"."cycles"."total_bakers" is 'Total number of all active in this cycle bakers';
COMMENT ON column "api"."cycles"."seed" is 'Randomly generated seed used by the network for things like baking rights distribution etc.';

-- set view owner

ALTER VIEW "api"."cycles" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."cycles";

-- -----------------------
-- delegations
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."delegations" AS
SELECT
    "delegations"."Level" AS "level",
    "delegations"."Timestamp" AS "timestamp",
    "delegations"."OpHash" AS "hash",
    "delegations"."SenderId" AS "sender_id",
    "sender"."Address" AS "sender",
    "delegations"."Counter" AS "counter",
    "delegations"."BakerFee" AS "baker_fee",
    "delegations"."GasLimit" AS "gas_limit",
    "delegations"."GasUsed" AS "consumed_gas",
    CASE
        WHEN "delegations"."Status" = 1 THEN 'applied'
        WHEN "delegations"."Status" = 2 THEN 'backtracked'
        WHEN "delegations"."Status" = 3 THEN 'skipped'
        WHEN "delegations"."Status" = 4 THEN 'failed'
        ELSE NULL
    END AS "status",
    "delegations"."Errors" AS "errors",
    "delegations"."InitiatorId" AS "initiator_id",
    "initiator"."Address" AS "initiator",
    "delegations"."Nonce" AS "nonce",
    "delegations"."DelegateId" AS "delegate_id",
    "delegate"."Address" AS "delegate",
    "delegations"."PrevDelegateId" AS "prev_delegate_id",
    "prev_delegate"."Address" AS "prev_delegate"
FROM
    "public"."DelegationOps" AS "delegations"
    LEFT JOIN "public"."Accounts" AS "sender" ON "sender"."Id" = "delegations"."SenderId"
    LEFT JOIN "public"."Accounts" AS "initiator" ON "initiator"."Id" = "delegations"."InitiatorId"
    LEFT JOIN "public"."Accounts" AS "delegate" ON "delegate"."Id" = "delegations"."DelegateId"
    LEFT JOIN "public"."Accounts" AS "prev_delegate" ON "prev_delegate"."Id" = "delegations"."PrevDelegateId";

-- add view comments

COMMENT ON view "api"."delegations" IS 'Delegation
Used to delegate funds to a delegate (an implicit account registered as a baker)';

COMMENT ON column "api"."delegations"."level" is 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."delegations"."timestamp" is 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."delegations"."hash" is 'Hash of the operation';
COMMENT ON column "api"."delegations"."sender" is 'Address of the delegated account';
COMMENT ON column "api"."delegations"."counter" is 'An account nonce which is used to prevent operation replay';
COMMENT ON column "api"."delegations"."baker_fee" is 'Fee to a baker, produced block, in which the operation was included';
COMMENT ON column "api"."delegations"."gas_limit" is 'A cap on the amount of gas a given operation can consume';
COMMENT ON column "api"."delegations"."consumed_gas" is 'Amount of gas, consumed by the operation';
COMMENT ON column "api"."delegations"."status" is 'Operation status (applied - an operation applied by the node and successfully added to the blockchain, failed - an operation which failed with some particular error (not enough balance, gas limit, etc), backtracked - an operation which was successful but reverted due to one of the following operations in the same operation group was failed, skipped - all operations after the failed one in an operation group)';
COMMENT ON column "api"."delegations"."errors" is 'List of errors provided by the node, which has injected the operation to the blockchain. null if there is no errors';
COMMENT ON column "api"."delegations"."initiator" is 'Address of the initiator of the delegation contract call';
COMMENT ON column "api"."delegations"."nonce" is 'An account nonce which is used to prevent internal operation replay';
COMMENT ON column "api"."delegations"."delegate" is 'Address of the delegate (baker) that accepted the delegation. null if delegate is not specified (undelegation operation)';
COMMENT ON column "api"."delegations"."prev_delegate" is 'Address of the previous delegate of the account. null if there is no previous delegate';

-- set view owner

ALTER VIEW "api"."delegations" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."delegations";

-- -----------------------
-- balance_snapshots
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."balance_snapshots" AS
SELECT
    "balance_snapshots"."Cycle" AS "cycle",
    "balance_snapshots"."DelegatorId" AS "delegator_id",
    "delegator"."Address" AS "delegator",
    "balance_snapshots"."BakerId" AS "baker_id",
    "baker"."Address" AS "baker",
    "balance_snapshots"."Balance" AS "balance"
FROM
    "public"."DelegatorCycles" AS "balance_snapshots"
    LEFT JOIN "public"."Accounts" AS "delegator" ON "delegator"."Id" = "balance_snapshots"."DelegatorId"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "balance_snapshots"."BakerId";

-- add view comments

COMMENT ON view "api"."balance_snapshots" IS 'Balance Snapshot
';

-- set view owner

ALTER VIEW "api"."balance_snapshots" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."balance_snapshots";

-- -----------------------
-- double_bakings
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."double_bakings" AS
SELECT
    "double_bakings"."Level" AS "level",
    "double_bakings"."Timestamp" AS "timestamp",
    "double_bakings"."OpHash" AS "hash",
    "double_bakings"."AccusedLevel" AS "accused_level",
    "double_bakings"."AccuserId" AS "accuser_id",
    "accuser"."Address" AS "accuser",
    "double_bakings"."AccuserReward" AS "accuser_reward",
    "double_bakings"."OffenderId" AS "offender_id",
    "offender"."Address" AS "offender",
    "double_bakings"."OffenderLostDeposit" AS "offender_lost_deposits",
    "double_bakings"."OffenderLostReward" AS "offender_lost_rewards",
    "double_bakings"."OffenderLostFee" AS "offender_lost_fees"
FROM
    "public"."DoubleBakingOps" AS "double_bakings"
    LEFT JOIN "public"."Accounts" AS "accuser" ON "accuser"."Id" = "double_bakings"."AccuserId"
    LEFT JOIN "public"."Accounts" AS "offender" ON "offender"."Id" = "double_bakings"."OffenderId";

-- add view comments

COMMENT ON view "api"."double_bakings" IS 'Double Baking
';

COMMENT ON column "api"."double_bakings"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."double_bakings"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."double_bakings"."hash" IS 'Hash of the operation';
COMMENT ON column "api"."double_bakings"."accused_level" IS 'The height of the block from the genesis block, which was double baked';
COMMENT ON column "api"."double_bakings"."accuser" IS 'Address of the baker (delegate), produced the block, in which the operation was included';
COMMENT ON column "api"."double_bakings"."accuser_reward" IS 'Reward of the baker (delegate), produced the block, in which the operation was included';
COMMENT ON column "api"."double_bakings"."offender" IS 'Address of the baker (delegate), accused for producing two different blocks at the same height';
COMMENT ON column "api"."double_bakings"."offender_lost_deposits" IS 'Amount of frozen security deposit, lost by accused baker (delegate)';
COMMENT ON column "api"."double_bakings"."offender_lost_rewards" IS 'Amount of frozen rewards, lost by accused baker (delegate)';
COMMENT ON column "api"."double_bakings"."offender_lost_fees" IS 'Amount of frozen fees, lost by accused baker (delegate)';

-- set view owner

ALTER VIEW "api"."double_bakings" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."double_bakings";

-- -----------------------
-- double_endorsings
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."double_endorsings" AS
SELECT
    "double_endorsings"."Level" AS "level",
    "double_endorsings"."Timestamp" AS "timestamp",
    "double_endorsings"."OpHash" AS "hash",
    "double_endorsings"."AccusedLevel" AS "accused_level",
    "double_endorsings"."AccuserId" AS "accuser_id",
    "accuser"."Address" AS "accuser",
    "double_endorsings"."AccuserReward" AS "accuser_reward",
    "double_endorsings"."OffenderId" AS "offender_id",
    "offender"."Address" AS "offender",
    "double_endorsings"."OffenderLostDeposit" AS "offender_lost_deposits",
    "double_endorsings"."OffenderLostReward" AS "offender_lost_rewards",
    "double_endorsings"."OffenderLostFee" AS "offender_lost_fees"
FROM
    "public"."DoubleEndorsingOps" AS "double_endorsings"
    LEFT JOIN "public"."Accounts" AS "accuser" ON "accuser"."Id" = "double_endorsings"."AccuserId"
    LEFT JOIN "public"."Accounts" AS "offender" ON "offender"."Id" = "double_endorsings"."OffenderId";

-- add view comments

COMMENT ON view "api"."double_endorsings" IS 'Double Endorsing
';

COMMENT ON column "api"."double_endorsings"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."double_endorsings"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."double_endorsings"."hash" IS 'Hash of the operation';
COMMENT ON column "api"."double_endorsings"."accused_level" IS 'The height of the block from the genesis block, at which double endorsing occurred';
COMMENT ON column "api"."double_endorsings"."accuser" IS 'Address of the baker (delegate), produced the block, in which the operation was included';
COMMENT ON column "api"."double_endorsings"."accuser_reward" IS 'Reward of the baker (delegate), produced the block, in which the operation was included';
COMMENT ON column "api"."double_endorsings"."offender" IS 'Address of the baker (delegate), accused for producing two different endorsements at the same height';
COMMENT ON column "api"."double_endorsings"."offender_lost_deposits" IS 'Amount of frozen security deposit, lost by accused baker (delegate)';
COMMENT ON column "api"."double_endorsings"."offender_lost_rewards" IS 'Amount of frozen rewards, lost by accused baker (delegate)';
COMMENT ON column "api"."double_endorsings"."offender_lost_fees" IS 'Amount of frozen fees, lost by accused baker (delegate)';

-- set view owner

ALTER VIEW "api"."double_endorsings" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."double_endorsings";

-- -----------------------
-- endorsements
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."endorsements" AS
SELECT
    "endorsements"."Level" AS "level",
    "endorsements"."Timestamp" AS "timestamp",
    "endorsements"."OpHash" AS "hash",
    "endorsements"."DelegateId" AS "delegate_id",
    "delegate"."Address" AS "delegate",
    "endorsements"."Slots" AS "num_slots",
    "endorsements"."Reward" AS "reward"
FROM
    "public"."EndorsementOps" AS "endorsements"
    LEFT JOIN "public"."Accounts" AS "delegate" ON "delegate"."Id" = "endorsements"."DelegateId";

-- add view comments

COMMENT ON view "api"."endorsements" IS 'Endorsement
';

COMMENT ON column "api"."endorsements"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."endorsements"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."endorsements"."hash" IS 'Hash of the operation';
COMMENT ON column "api"."endorsements"."delegate" IS 'Address of the baker (delegate) who sent the operation';
COMMENT ON column "api"."endorsements"."num_slots" IS 'Number of assigned endorsement slots (out of 32) to the baker (delegate) who sent the operation';
COMMENT ON column "api"."endorsements"."reward" IS 'Reward of the baker (delegate) for the operation';

-- set view owner

ALTER VIEW "api"."endorsements" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."endorsements";

-- -----------------------
-- migrations
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."migrations" AS
SELECT
    "migrations"."Level" AS "level",
    "migrations"."Timestamp" AS "timestamp",
    "migrations"."AccountId" AS "account_id",
    "account"."Address" AS "account",
    CASE
        WHEN "migrations"."Kind" = 0 THEN 'bootstrap'
        WHEN "migrations"."Kind" = 1 THEN 'activate_delegate'
        WHEN "migrations"."Kind" = 2 THEN 'airdrop'
        WHEN "migrations"."Kind" = 3 THEN 'proposal_invoice'
        ELSE NULL
    END AS "kind",
    "migrations"."BalanceChange" AS "balance_change"
FROM
    "public"."MigrationOps" AS "migrations"
    LEFT JOIN "public"."Accounts" AS "account" ON "account"."Id" = "migrations"."AccountId";

-- add view comments

COMMENT ON view "api"."migrations" IS 'Migration
A result of the context (database) migration during a protocol update (synthetic type)';

COMMENT ON column "api"."migrations"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."migrations"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."migrations"."account" IS 'Address of the account whose balance has updated as a result of the operation';
COMMENT ON column "api"."migrations"."kind" IS 'Kind of the migration\nbootstrap - Balance updates, included in the first block after genesis activate_delegate - registering a new baker (delegator) during protocol migration airdrop - airdrop of 1 micro tez during Babylon protocol upgrade proposal_invoice - invoice for creation a proposal for protocol upgrade';
COMMENT ON column "api"."migrations"."balance_change" IS 'The amount for which the operation updated the balance (micro tez)';

-- set view owner

ALTER VIEW "api"."migrations" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."migrations";

-- -----------------------
-- nonce_revelations
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."nonce_revelations" AS
SELECT
    "nonce_revelations"."Level" AS "level",
    "nonce_revelations"."Timestamp" AS "timestamp",
    "nonce_revelations"."OpHash" AS "hash",
    "nonce_revelations"."BakerId" AS "baker_id",
    "baker"."Address" AS "baker",
    "nonce_revelations"."SenderId" AS "sender_id",
    "sender"."Address" AS "sender",
    "nonce_revelations"."RevealedLevel" AS "revealed_level"
FROM
    "public"."NonceRevelationOps" AS "nonce_revelations"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "nonce_revelations"."BakerId"
    LEFT JOIN "public"."Accounts" AS "sender" ON "sender"."Id" = "nonce_revelations"."SenderId";

-- add view comments

COMMENT ON view "api"."nonce_revelations" IS 'Nonce Revelations
';

COMMENT ON column "api"."nonce_revelations"."level" IS 'The height of the block from the genesis block, in which the operation was included.';
COMMENT ON column "api"."nonce_revelations"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."nonce_revelations"."hash" IS 'Hash of the operation.';
COMMENT ON column "api"."nonce_revelations"."baker" IS 'Address of the delegate (baker), who produced the block with the operation.';
COMMENT ON column "api"."nonce_revelations"."sender" IS 'Address of the delegate (baker), who revealed the nonce (sent the operation).';
COMMENT ON column "api"."nonce_revelations"."revealed_level" IS 'Block height of the block, where seed nonce hash is stored.';

-- set view owner

ALTER VIEW "api"."nonce_revelations" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."nonce_revelations";

-- -----------------------
-- originations
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."originations" AS
SELECT
    "originations"."Level" AS "level",
    "originations"."Timestamp" AS "timestamp",
    "originations"."OpHash" AS "hash",
    "originations"."SenderId" AS "sender_id",
    "sender"."Address" AS "sender",
    "originations"."Counter" AS "counter",
    "originations"."BakerFee" AS "baker_fee",
    "originations"."StorageFee" AS "storage_burn",
    "originations"."AllocationFee" AS "allocation_burn",
    "originations"."GasLimit" AS "gas_limit",
    "originations"."GasUsed" AS "consumed_gas",
    "originations"."StorageLimit" AS "storage_limit",
    "originations"."StorageUsed" AS "paid_storage_size_diff",
    CASE
        WHEN "originations"."Status" = 1 THEN 'applied'
        WHEN "originations"."Status" = 2 THEN 'backtracked'
        WHEN "originations"."Status" = 3 THEN 'skipped'
        WHEN "originations"."Status" = 4 THEN 'failed'
        ELSE NULL
    END AS "status",
    "originations"."Errors" AS "errors",
    "originations"."InitiatorId" AS "initiator_id",
    "initiator"."Address" AS "initiator",
    "originations"."Nonce" AS "nonce",
    "originations"."DelegateId" AS "delegate_id",
    "delegate"."Address" AS "delegate",
    "originations"."ContractId" AS "contract_id",
    "originated_contract"."Address" AS "originated_contract",
    "originations"."Balance" AS "balance"
FROM
    "public"."OriginationOps" AS "originations"
    LEFT JOIN "public"."Accounts" AS "sender" ON "sender"."Id" = "originations"."SenderId"
    LEFT JOIN "public"."Accounts" AS "initiator" ON "initiator"."Id" = "originations"."InitiatorId"
    LEFT JOIN "public"."Accounts" AS "delegate" ON "delegate"."Id" = "originations"."DelegateId"
    LEFT JOIN "public"."Accounts" AS "originated_contract" ON "originated_contract"."Id" = "originations"."ContractId";

-- add view comments

COMMENT ON view "api"."originations" IS 'Origination
';

COMMENT ON column "api"."originations"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."originations"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."originations"."hash" IS 'Hash of the operation';
COMMENT ON column "api"."originations"."sender" IS 'Address of the account, created a contract';
COMMENT ON column "api"."originations"."counter" IS 'An account nonce which is used to prevent operation replay';
COMMENT ON column "api"."originations"."baker_fee" IS 'Fee to the baker, produced block, in which the operation was included (micro tez)';
COMMENT ON column "api"."originations"."storage_burn" IS 'The amount of funds burned from the sender account for contract storage in the blockchain (micro tez)';
COMMENT ON column "api"."originations"."allocation_burn" IS 'The amount of funds burned from the sender account for contract account creation (micro tez)';
COMMENT ON column "api"."originations"."gas_limit" IS 'A cap on the amount of gas a given operation can consume';
COMMENT ON column "api"."originations"."consumed_gas" IS 'Amount of gas, consumed by the operation';
COMMENT ON column "api"."originations"."storage_limit" IS 'A cap on the amount of storage a given operation can consume';
COMMENT ON column "api"."originations"."paid_storage_size_diff" IS 'Amount of storage, consumed by the operation, that is subject to pay';
COMMENT ON column "api"."originations"."status" IS 'Operation status (applied - an operation applied by the node and successfully added to the blockchain, failed - an operation which failed with some particular error (not enough balance, gas limit, etc), backtracked - an operation which was a successful but reverted due to one of the following operations in the same operation group was failed, skipped - all operations after the failed one in an operation group)';
COMMENT ON column "api"."originations"."errors" IS 'List of errors provided by the node, injected the operation to the blockchain. null if there is no errors';
COMMENT ON column "api"."originations"."initiator" IS 'Address of the initiator of the contract call';
COMMENT ON column "api"."originations"."nonce" IS 'An account nonce which is used to prevent internal operation replay';
COMMENT ON column "api"."originations"."delegate" IS 'Address of the baker (delegate), which was marked as a contract delegate in the operation';
COMMENT ON column "api"."originations"."originated_contract" IS 'Address of the originated ( deployed / created ) contract';
COMMENT ON column "api"."originations"."balance" IS 'Initial contract balance (micro tez), transferred from the operation sender';

-- set view owner

ALTER VIEW "api"."originations" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."originations";

-- -----------------------
-- proposals
-- -----------------------

-- create view

/* CREATE OR REPLACE VIEW "api"."proposals" AS
SELECT
    "proposals"."Level" AS "level",
    "proposals"."Timestamp" AS "timestamp",
    "proposals"."OpHash" AS "hash",
    "proposals"."PeriodId" AS "period_id",
    -- "voting_period"."Code" AS "voting_period",
    "proposals"."ProposalId" AS "proposal_id",
    "protocol_proposal"."Hash" AS "protocol_proposal",
    "proposals"."SenderId" AS "baker_id",
    "baker"."Address" AS "baker",
    "proposals"."Rolls" AS "num_rolls",
    "proposals"."Duplicated" AS "is_duplicate"
FROM
    "public"."ProposalOps" AS "proposals"
    -- LEFT JOIN "public"."VotingPeriods" AS "voting_period" ON "voting_period"."Id" = "proposals"."PeriodId"
    LEFT JOIN "public"."Proposals" AS "protocol_proposal" ON "protocol_proposal"."Id" = "proposals"."ProposalId"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "proposals"."SenderId";

-- add view comments

COMMENT ON view "api"."proposals" IS 'Proposal
';

COMMENT ON column "api"."proposals"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."proposals"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."proposals"."hash" IS 'Hash of the operation';
-- COMMENT ON column "api"."proposals"."voting_period" IS 'Index of the proposal period for which the proposal was submitted (upvoted)';
COMMENT ON column "api"."proposals"."protocol_proposal" IS 'Hash of the submitted (upvoted) proposal';
COMMENT ON column "api"."proposals"."baker" IS 'Address of the baker (delegate), submitted (upvoted) the proposal operation';
COMMENT ON column "api"."proposals"."num_rolls" IS 'Number of baker''s rolls (baker''s voting power)';
COMMENT ON column "api"."proposals"."is_duplicate" IS 'Indicates whether proposal upvote has already been pushed. Duplicated proposal operations are not counted when selecting proposal-winner.';

-- set view owner

ALTER VIEW "api"."proposals" OWNER TO "api_views_owner"; */

-- test

-- SELECT * FROM "api"."proposals";

-- -----------------------
-- protocol_proposals
-- -----------------------

-- create view

/* CREATE OR REPLACE VIEW "api"."protocol_proposals" AS
SELECT
    "proposals"."Id" AS "id",
    "proposals"."Hash" AS "hash",
    CASE
        WHEN "proposals"."Status" = 0 THEN 'active'
        WHEN "proposals"."Status" = 1 THEN 'applied'
        WHEN "proposals"."Status" = 2 THEN 'declined'
        ELSE NULL
    END AS "status",
    "proposals"."InitiatorId" AS "baker_id",
    "accounts"."Address" AS "baker",
    "proposals"."Upvotes" AS "total_rolls",
    "proposals"."ProposalPeriodId" AS "proposal_period_id",
    "proposals"."ExplorationPeriodId" AS "exploration_period_id",
    "proposals"."TestingPeriodId" AS "testing_period_id",
    "proposals"."PromotionPeriodId" AS "promotion_period_id"
FROM
    "public"."Proposals" AS "proposals"
    LEFT JOIN "public"."Accounts" AS "accounts" ON "accounts"."Id" = "proposals"."InitiatorId";

-- add view comments

COMMENT ON view "api"."protocol_proposals" IS 'Protocol Proposal
Proposals';
COMMENT ON column "api"."protocol_proposals"."hash" IS 'Hash of the proposal, which representing a tarball of concatenated .ml/.mli source files';
COMMENT ON column "api"."protocol_proposals"."status" IS 'Status of the proposal active - the proposal in the active state accepted - accepted for protocol upgrade proposal skipped - the proposal didn''t pass the Proposal Period rejected - the proposal didn''t reach a quorum during the Exploration or Promotion Period';
COMMENT ON column "api"."protocol_proposals"."baker" IS 'Address of the baker (delegate) submitted the proposal';
COMMENT ON column "api"."protocol_proposals"."total_rolls" IS 'The total number of rolls of all the bakers (delegates) who upvoted the proposal';

-- set view owner

ALTER VIEW "api"."protocol_proposals" OWNER TO "api_views_owner"; */

-- test

-- SELECT * FROM "api"."protocol_proposals";

-- -----------------------
-- protocols
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."protocols" AS
SELECT
    "protocols"."Code" AS "code",
    "protocols"."Hash" AS "hash",
    "protocols"."FirstLevel" AS "first_level",
    "protocols"."LastLevel" AS "last_level",
    "protocols"."PreservedCycles" AS "preserved_cycles",
    "protocols"."BlocksPerCycle" AS "blocks_per_cycle",
    "protocols"."BlocksPerCommitment" AS "blocks_per_comitment",
    "protocols"."BlocksPerSnapshot" AS "blocks_per_snapshot",
    "protocols"."BlocksPerVoting" AS "blocks_per_voting",
    "protocols"."TimeBetweenBlocks" AS "time_between_blocks",
    "protocols"."EndorsersPerBlock" AS "endorsers_per_block",
    "protocols"."HardOperationGasLimit" AS "hard_operation_gas_limit",
    "protocols"."HardOperationStorageLimit" AS "hard_operation_storage_limit",
    "protocols"."HardBlockGasLimit" AS "hard_block_gas_limit",
    "protocols"."TokensPerRoll" AS "tokens_per_roll",
    "protocols"."RevelationReward" AS "revelation_reward",
    "protocols"."BlockDeposit" AS "block_deposit",
    "protocols"."BlockReward0" AS "block_reward_0",
    "protocols"."BlockReward1" AS "block_reward_1",
    "protocols"."EndorsementDeposit" AS "endorsement_deposit",
    "protocols"."EndorsementReward0" AS "endorsement_reward_0",
    "protocols"."EndorsementReward1" AS "endorsement_reward_1",
    "protocols"."OriginationSize" AS "origination_size",
    "protocols"."ByteCost" AS "byte_cost"
FROM
    "public"."Protocols" AS "protocols";

-- add view comments

COMMENT ON view "api"."protocols" IS 'Protocol
';

COMMENT ON column "api"."protocols"."code" IS 'Protocol code, representing a number of protocol changes since genesis (mod 256, but -1 for the genesis block)';
COMMENT ON column "api"."protocols"."first_level" IS 'Block height where the protocol was applied';
COMMENT ON column "api"."protocols"."last_level" IS 'Block height where the protocol ends. null if the protocol is active';

-- set view owner

ALTER VIEW "api"."protocols" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."protocols";

-- -----------------------
-- reveals
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."reveals" AS
SELECT
    "reveals"."Level" AS "level",
    "reveals"."Timestamp" AS "timestamp",
    "reveals"."OpHash" AS "hash",
    "reveals"."SenderId" AS "sender_id",
    "sender"."Address" AS "sender",
    "reveals"."Counter" AS "counter",
    "reveals"."BakerFee" AS "baker_fee",
    "reveals"."GasLimit" AS "gas_limit",
    "reveals"."GasUsed" AS "consumed_gas",
    CASE
        WHEN "reveals"."Status" = 1 THEN 'applied'
        WHEN "reveals"."Status" = 2 THEN 'backtracked'
        WHEN "reveals"."Status" = 3 THEN 'skipped'
        WHEN "reveals"."Status" = 4 THEN 'failed'
        ELSE NULL
    END AS "status",
    "reveals"."Errors" AS "errors"
FROM
    "public"."RevealOps" AS "reveals"
    LEFT JOIN "public"."Accounts" AS "sender" ON "sender"."Id" = "reveals"."SenderId";

-- add view comments

COMMENT ON view "api"."reveals" IS 'Reveal
';

COMMENT ON column "api"."reveals"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."reveals"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."reveals"."hash" IS 'Hash of the operation';
COMMENT ON column "api"."reveals"."sender" IS 'Address of the account who has sent the operation';
COMMENT ON column "api"."reveals"."counter" IS 'An account nonce which is used to prevent operation replay';
COMMENT ON column "api"."reveals"."baker_fee" IS 'Fee to the baker, produced block, in which the operation was included (micro tez)';
COMMENT ON column "api"."reveals"."gas_limit" IS 'A cap on the amount of gas a given operation can consume';
COMMENT ON column "api"."reveals"."consumed_gas" IS 'Amount of gas, consumed by the operation';
COMMENT ON column "api"."reveals"."status" IS '(applied - an operation applied by the node and successfully added to the blockchain, failed - an operation which failed with some particular error (not enough balance, gas limit, etc), backtracked - an operation which was successful but reverted due to one of the following operations in the same operation group was failed, skipped - all operations after the failed one in an operation group)';
COMMENT ON column "api"."reveals"."errors" IS 'List of errors provided by the node, injected the operation to the blockchain. null if there is no errors';

-- set view owner

ALTER VIEW "api"."reveals" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."reveals";

-- -----------------------
-- revelation_penalties
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."revelation_penalties" AS
SELECT
    "revelation_penalties"."Level" AS "level",
    "revelation_penalties"."Timestamp" AS "timestamp",
    "revelation_penalties"."BakerId" AS "baker_id",
    "baker"."Address" AS "baker",
    "revelation_penalties"."MissedLevel" AS "missed_level",
    "revelation_penalties"."LostReward" AS "lost_rewards",
    "revelation_penalties"."LostFees" AS "lost_fees"
FROM
    "public"."RevelationPenaltyOps" AS "revelation_penalties"
    LEFT JOIN "public"."Accounts" AS "baker" ON "baker"."Id" = "revelation_penalties"."BakerId";

-- add view comments

COMMENT ON view "api"."revelation_penalties" IS 'Revelation Penalties
Operation, in which rewards were lost due to unrevealed seed nonces by the delegate (synthetic type)';

COMMENT ON column "api"."revelation_penalties"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."revelation_penalties"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."revelation_penalties"."baker" IS 'Address of the delegate (baker) who has lost rewards due to unrevealed seed nonces';
COMMENT ON column "api"."revelation_penalties"."missed_level" IS 'Height of the block, which contains hash of the seed nonce, which was to be revealed';
COMMENT ON column "api"."revelation_penalties"."lost_rewards" IS 'Reward for baking the block, which was lost due to unrevealed seed nonces (micro tez)';
COMMENT ON column "api"."revelation_penalties"."lost_fees" IS 'Lost due to unrevealed seed nonce total fee paid by all operations, included in the block, which was to be revealed (micro tez)';

-- set view owner

ALTER VIEW "api"."revelation_penalties" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."revelation_penalties";

-- -----------------------
-- transactions
-- -----------------------

-- create view

CREATE OR REPLACE VIEW "api"."transactions" AS
SELECT
    "transactions"."Level" AS "level",
    "transactions"."Timestamp" AS "timestamp",
    "transactions"."OpHash" AS "hash",
    "transactions"."SenderId" AS "sender_id",
    "sender"."Address" AS "sender",
    "transactions"."Counter" AS "counter",
    "transactions"."BakerFee" AS "baker_fee",
    "transactions"."StorageFee" AS "storage_burn",
    "transactions"."AllocationFee" AS "allocation_burn",
    "transactions"."GasLimit" AS "gas_limit",
    "transactions"."GasUsed" AS "consumed_gas",
    "transactions"."StorageLimit" AS "storage_limit",
    "transactions"."StorageUsed" AS "paid_storage_size_diff",
    CASE
        WHEN "transactions"."Status" = 1 THEN 'applied'
        WHEN "transactions"."Status" = 2 THEN 'backtracked'
        WHEN "transactions"."Status" = 3 THEN 'skipped'
        WHEN "transactions"."Status" = 4 THEN 'failed'
        ELSE NULL
    END AS "status",
    "transactions"."Errors" AS "errors",
    "transactions"."InitiatorId" AS "initiator_id",
    "initiator"."Address" AS "initiator",
    "transactions"."Nonce" AS "nonce",
    "transactions"."TargetId" AS "destination_id",
    "destination"."Address" AS "destination",
    "transactions"."Amount" AS "amount",
    "transactions"."Parameters" AS "parameters",
    ("transactions"."InternalOperations" & 1 > 0) AS "has_internal_delegations",
    ("transactions"."InternalOperations" & 2 > 0) AS "has_internal_originations",
    ("transactions"."InternalOperations" & 4 > 0) AS "has_internal_transactions"
FROM
    "public"."TransactionOps" AS "transactions"
    LEFT JOIN "public"."Accounts" AS "sender" ON "sender"."Id" = "transactions"."SenderId"
    LEFT JOIN "public"."Accounts" AS "initiator" ON "initiator"."Id" = "transactions"."InitiatorId"
    LEFT JOIN "public"."Accounts" AS "destination" ON "destination"."Id" = "transactions"."TargetId";

-- add view comments

COMMENT ON view "api"."transactions" IS 'Transaction
';

COMMENT ON column "api"."transactions"."level" IS 'The height of the block from the genesis block, in which the operation was included';
COMMENT ON column "api"."transactions"."timestamp" IS 'Datetime of the block, in which the operation was included (ISO 8601, e.g. 2020-02-20T02:40:57Z)';
COMMENT ON column "api"."transactions"."hash" IS 'Hash of the operation';
COMMENT ON column "api"."transactions"."sender" IS 'Address of the account sent the transaction';
COMMENT ON column "api"."transactions"."counter" IS 'An account nonce which is used to prevent operation replay';
COMMENT ON column "api"."transactions"."baker_fee" IS 'Fee to the baker, produced block, in which the operation was included (micro tez)';
COMMENT ON column "api"."transactions"."storage_burn" IS 'The amount of funds burned from the sender account for used the blockchain storage (micro tez)';
COMMENT ON column "api"."transactions"."allocation_burn" IS 'The amount of funds burned from the sender account for account creation (micro tez)';
COMMENT ON column "api"."transactions"."gas_limit" IS 'A cap on the amount of gas a given operation can consume';
COMMENT ON column "api"."transactions"."consumed_gas" IS 'Amount of gas, consumed by the operation';
COMMENT ON column "api"."transactions"."storage_limit" IS 'A cap on the amount of storage a given operation can consume';
COMMENT ON column "api"."transactions"."paid_storage_size_diff" IS 'Amount of storage, consumed by the operation';
COMMENT ON column "api"."transactions"."status" IS 'Operation status (applied - an operation applied by the node and successfully added to the blockchain, failed - an operation which failed with some particular error (not enough balance, gas limit, etc), backtracked - an operation which was successful but reverted due to one of the following operations in the same operation group was failed, skipped - all operations after the failed one in an operation group)';
COMMENT ON column "api"."transactions"."errors" IS 'List of errors provided by the node, injected the operation to the blockchain. null if there is no errors';
COMMENT ON column "api"."transactions"."initiator" IS 'Address of the initiator of the transaction call';
COMMENT ON column "api"."transactions"."nonce" IS 'An account nonce which is used to prevent internal operation replay';
COMMENT ON column "api"."transactions"."destination" IS 'Destination address';
COMMENT ON column "api"."transactions"."amount" IS 'The transaction amount (micro tez)';
COMMENT ON column "api"."transactions"."parameters" IS 'Parameters/code, passed to the target contract';
COMMENT ON column "api"."transactions"."has_internal_delegations" IS 'At least one internal delegation operation';
COMMENT ON column "api"."transactions"."has_internal_originations" IS 'At least one internal origination operation';
COMMENT ON column "api"."transactions"."has_internal_transactions" IS 'At least one internal transaction operation';

-- set view owner

ALTER VIEW "api"."transactions" OWNER TO "api_views_owner";

-- test

-- SELECT * FROM "api"."transactions";

-- -----------------------
-- voting_periods
-- -----------------------

-- create view

/* CREATE OR REPLACE VIEW "api"."voting_periods" AS
SELECT
    "voting_periods"."Index" AS "index",
    CASE
        WHEN "voting_periods"."Kind" = 0 THEN 'proposal'
        WHEN "voting_periods"."Kind" = 1 THEN 'exploration'
        WHEN "voting_periods"."Kind" = 2 THEN 'testing'
        WHEN "voting_periods"."Kind" = 3 THEN 'promotion'
        ELSE NULL
    END AS "kind",
    "voting_periods"."FirstLevel" AS "first_level",
    "voting_periods"."LastLevel" AS "last_level",
    "voting_periods"."TotalRolls" AS "total_rolls",
    "voting_periods"."ParticipationEma" AS "participation_ema",
    "voting_periods"."Quorum" AS "quorum"
FROM
    "public"."VotingPeriods" AS "voting_periods"; 

-- add view comments

 COMMENT ON view "api"."voting_periods" IS 'Voting Period
'; 

-- set view owner

 ALTER VIEW "api"."voting_periods" OWNER TO "api_views_owner"; */

-- test

-- SELECT * FROM "api"."voting_periods";

-- -----------------------
-- voting_snapshots
-- -----------------------

-- create view

/* CREATE OR REPLACE VIEW "api"."voting_snapshots" AS
SELECT
    "voting_snapshots"."Level" AS "level",
    "voting_snapshots"."PeriodId" AS "period_id",
    "voting_period"."Code" AS "voting_period",
    "voting_snapshots"."DelegateId" AS "delegate_id",
    "delegate"."Address" AS "delegate",
    "voting_snapshots"."Rolls" AS "num_rolls"
FROM
    "public"."VotingSnapshots" AS "voting_snapshots"
    LEFT JOIN "public"."VotingPeriods" AS "voting_period" ON "voting_period"."Id" = "voting_snapshots"."PeriodId"
    LEFT JOIN "public"."Accounts" AS "delegate" ON "delegate"."Id" = "voting_snapshots"."DelegateId";

-- add view comments

COMMENT ON view "api"."voting_snapshots" IS 'Voting Snapshot
';

-- set view owner

ALTER VIEW "api"."voting_snapshots" OWNER TO "api_views_owner"; */

-- test

-- SELECT * FROM "api"."voting_snapshots";

-- -----------------------------------------------------
-- privileges
-- -----------------------------------------------------

GRANT USAGE ON SCHEMA api TO api_anon;
GRANT SELECT ON ALL TABLES IN SCHEMA api TO api_anon;
