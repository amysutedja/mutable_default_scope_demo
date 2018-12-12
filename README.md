# Mutable Default Scope Bug Demo

_This issue is fixed as of Rails 5.0.3._

This repo demonstrates an issue in Rails 4.2.3+ and 5.0+ in which incorrect SQL is generated under the following scenario.

1. A model M has many of child model C.
2. C has a `default_scope` defined which is conditional -- for example, it might return different clauses based on thread-local storage.
3. One condition returns all records, and the other returns a where filter based on a boolean.
4. The child model C is used in a subquery, such as `C.where(id: m_instance.cs)`.
5. A thread exercises both conditions.

If all of these hold, the generated SQL for the full query when the second condition runs becomes invalid.

```
Correct SQL: SELECT "books".* FROM "books" WHERE "books"."deleted" = 'f' AND "books"."id" IN (SELECT "books"."id" FROM "books" WHERE "books"."deleted" = 'f' AND "books"."user_id" = 1)
Invalid SQL: SELECT "books".* FROM "books" WHERE "books"."id" IN (SELECT "books"."id" FROM "books" WHERE "books"."user_id" = 'f')
```

To exercise the test case for this:

```
bin/rake
```
