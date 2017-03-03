
# NetLogo Table Extension

## Building

Use the netlogo.jar.url environment variable to tell sbt which NetLogo.jar to compile against (defaults to NetLogo 6.0). For example:

    sbt -Dnetlogo.jar.url=file:///path/to/NetLogo/target/NetLogo.jar package

If compilation succeeds, `table.jar` will be created.

## Using

The table extension is pre-installed in NetLogo.

To use the table extension in your model, add a line to the top of your Code tab:

```
extensions [table]
```

If your model already uses other extensions, then it already has an
`extensions` line in it, so just add `table` to the list.

For more information on using NetLogo extensions,
see the [Extensions Guide](http://ccl.northwestern.edu/netlogo/docs/extensions.html)

### When to Use

In general, anything you can do with an table in NetLogo, you could
also just use a list for. But you may want to consider using an table
instead for speed reasons. Lists and tables have different performance
 characteristics, so you may be able to make your model run faster by
selecting the appropriate data structure.

Tables are useful when you need to do associate values with other
values. For example, you might make a table of words and their
definitions. Then you can look up the definition of any word. Here,
the words are the &quot;keys&quot;. You can easily retrieve the value
for any key in the table, but not vice versa.

Unlike NetLogo's lists and strings, tables are
"mutable". That means that you can actually modify them
directly, rather than constructing an altered copy as with lists. If
the table is used in more than one place in your code, any
changes you make will show up everywhere. It's tricky to write
code involving mutable structures and it's easy to make subtle
errors or get surprising results, so we suggest sticking with lists
and strings unless you're certain you want and need mutability.

### Example

```NetLogo
let dict table:make
table:put dict "turtle" "cute"
table:put dict "bunny" "cutest"
print dict
=> {{table: "turtle" -> "cute", "bunny" -> "cutest" }}
print table:length dict
=> 2
print table:get dict "turtle"
=> "cute"
print table:get dict "leopard"
=> (error)
print table:keys dict
=> ["turtle" "bunny"]
```

## Primitives

[`table:clear`](#tableclear)
[`table:counts`](#tablecounts)
[`table:group-by`](#tablegroup-by)
[`table:from-list`](#tablefrom-list)
[`table:get`](#tableget)
[`table:has-key?`](#tablehas-key?)
[`table:keys`](#tablekeys)
[`table:length`](#tablelength)
[`table:make`](#tablemake)
[`table:put`](#tableput)
[`table:remove`](#tableremove)
[`table:to-list`](#tableto-list)
[`table:values`](#tablevalues)


### `table:clear`

```NetLogo
table:clear table
```

Removes all key-value pairs from *table*.


### `table:counts`

```NetLogo
table:counts list
```

Counts the occurrences of each element of the given list and reports the counts in a table.


### `table:group-by`

```NetLogo
table:group-by agentset-or-list
```


Groups the elements of the agentset or list based on the result of the reporter.
The results of the reporter become the keys in the table.
When grouping a list, each item of the list will be passed into the reporter as an argument and the values of table will be lists.
When grouping an agentset, the agents will run the reporter.

Example of running on a list:

```
observer> show table:group-by range 10 [ num -> num mod 3 ]
observer: {{table: [[0 [0 3 6 9]] [1 [1 4 7]] [2 [2 5 8]]]}}
```

Example of running on an agentset:

```
observer> create-turtles 100 [ set color one-of [ red green blue ] ]
observer> show table:group-by turtles [ color ]
observer: {{table: [[105 (agentset, 38 turtles)] [55 (agentset, 32 turtles)] [15 (agentset, 30 turtles)]]}}



### `table:from-list`

```NetLogo
table:from-list list
```


Reports a new table with the contents of *list*.
*list* must be a list of two element lists, or pairs.
The first element in the pair is the key and the second element is the value.



### `table:get`

```NetLogo
table:get table key
```

Reports the value that *key* is mapped to in the table. Causes an error if there is no entry for the key.


### `table:has-key?`

```NetLogo
table:has-key? table key
```

Reports true if *key* has an entry in *table*.


### `table:keys`

```NetLogo
table:keys table
```

Reports a list of all the keys in *table*, in the same order the keys were inserted.


### `table:length`

```NetLogo
table:length table
```

Reports the number of entries in *table*.


### `table:make`

```NetLogo
table:make
```

Reports a new, empty table.


### `table:put`

```NetLogo
table:put table key value
```

Maps *key* to *value* in *table*. If an entry already exists in the table for the given key, it is replaced.


### `table:remove`

```NetLogo
table:remove table key
```

Removes the mapping in *table* for *key*.


### `table:to-list`

```NetLogo
table:to-list table
```


Reports a list with the content of <i>table</i>. The list will be a
list of two element lists, or pairs. The first element in the pair is
the key and the second element is the value. The keys appear in the
same order they were inserted.


### `table:values`

```NetLogo
table:values table
```


Reports a list with the entries of <i>table</i>. The entries will appear
in the same order they were inserted, with duplicates included.


## Terms of Use

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)

The NetLogo table extension is in the public domain.  To the extent possible under law, Uri Wilensky has waived all copyright and related or neighboring rights.
