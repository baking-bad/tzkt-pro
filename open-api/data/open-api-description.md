TzKT Pro in a nutshell is headless [TzKT indexer](https://github.com/baking-bad/tzkt) + PostgreSQL DB + set of SQL Views + [PostgREST](http://postgrest.org/) API gateway. It is an [open-source](https://github.com/baking-bad/tzkt-pro) project available both for commercial and non-commercial use (with attribution).

### TzKT Pro vs. TzKT API

TzKT Pro is less performant, cache-unfriendly, and does not contain extra data (aliases, tokens info, other metadata).  
On the other hand it provides a higher level of flexibility and allows to make custom queries almost as if you were using raw SQL.

### Terms of Use

If your application or service uses TzKT Pro software (self-deployed version) you should mention that fact on your website or application by placing the label **\"Powered by TzKT\"** with a direct link to [pro.tzkt.io](https://pro.tzkt.io).  

API endpoint provided at `pro.tzkt.io` is currently working in demo mode:
* Authorization token is `baking_bad`;
* There are no rate limits, however abusers will be selectively restricted.

Paid subscription options (with SLA) will be available in the nearest future.

### Client libraries

PostgREST ecosystem includes a set of [client libraries](http://postgrest.org/en/v7.0.0/ecosystem.html#client-side-libraries) developed by the community, and they all are compatible with TzKT Pro.  
We recommend using those built by the [Supabase](https://github.com/supabase) team as they are most maintained, documented, and share a common super-convenient chaining syntax:
* [Javascript](https://github.com/supabase/postgrest-js)
* [Python](https://github.com/supabase/postgrest-py)
* [Rust](https://github.com/supabase/postgrest-rs)
* [Dart](https://github.com/supabase/postgrest-dart)

### Contacts Us

Feel free to ask any questions about TzKT Pro and Tezos in general. Our team is always happy to help!

- Email: hello@baking-bad.org
- Twitter: https://twitter.com/TezosBakingBad
- Telegram: [tg://resolve?domain=baking_bad_chat](tg://resolve?domain=baking_bad_chat)
- Slack: https://tezos-dev.slack.com/archives/CV5NX7F2L
