---
title: Vim Cheat sheet 
date: 2018-12-23 14:15:33
tags: programming
---

## Find and replace

```bash
:%s/foo/bar/g
```

[substitute](http://vim.wikia.com/wiki/Search_and_replace);


## VSCode Vim

VS Code has a lot of nifty tricks and we try to preserve some of them:

gd - jump to definition.
gq - on a visual selection reflow and wordwrap blocks of text, preserving commenting style. Great for formatting documentation comments.
gb - adds another cursor on the next word it finds which is the same as the word under the cursor.
af - visual mode command which selects increasingly large blocks of text. For example, if you had "blah (foo [bar 'ba|z'])" then it would select 'baz' first. If you pressed af again, it'd then select [bar 'baz'], and if you did it a third time it would select "(foo [bar 'baz'])".
gh - equivalent to hovering your mouse over wherever the cursor is. Handy for seeing types and error messages without reaching for the mouse!