# Vim Enforce Script Syntax

This plugin provides basic syntax highlighting support for Enforce Script, the
scripting language used by Bohemia Interactive's
[Enfusion engine](https://community.bistudio.com/wiki/Enfusion).

The script syntax is documented at
https://community.bistudio.com/wiki/DayZ:Enforce_Script_Syntax.

As Enforce script files are generally named with `.c` suffixes, which collides
with the C language, no auto-detection is provided. I put the following
modeline in my source files to enable this syntax:

```
// vim: ft=enforce
```

<!--
vim: ft=markdown
-->
