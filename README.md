# Pre-Commit Hook: Convert indents from tabs to spaces

This project is a both a fork and the exact opposite of Andrew Pinkham's
[pre-commit-indents-to-tabs](https://github.com/jambonrose/pre-commit-indents-to-tabs)
plugin.

It converts all indents from tabs to spaces when used with [pre-commit](https://pre-commit.com).

## Usage

This project is intended to be used via
[pre-commit](https://pre-commit.com) and the `.pre-commit-config.yaml`
file.

The code below demonstrates a minimal configuration for usage in
`.pre-commit-config.yaml`.

```yaml
- repo: https://github.com/oliv5/pre-commit-indents-to-spaces
  rev: v0.0.1
  hooks:
      - id: indents-to-tabs
        args: ["--spaces=4"]
```

It is possible to set few plugin parameters. The exemple below forces to
replace each indent by 8 spaces characters instead of the default 4.

```yaml
- repo: https://github.com/oliv5/pre-commit-indents-to-spaces
  rev: v0.0.1
  hooks:
      - id: indents-to-tabs
        args: ["--spaces=8"]
```

## Project Rationale

*By Andrew Pinkham, the author of the original `pre-commit-indents-to-tabs`*

I created this project as a reaction to the Terraform autoformatter.
However, the project can be used in other circumstances.

Autoformatters are great. However, Terraform's `fmt` command indents
code using two-spaces. I have a mild visual impairment, and a two-space
indent is difficult for me.

I want to benefit from all of the other work the autoformatter is doing
for me, and I simply want to replace the space indents with tabs. I
don't want to create my own autoformatter. This pre-commit hook is meant
to be run after the autoformatter to achieve these goals.

Philosophically speaking: Tabs are for indents. Spaces are for
alignment. Tabs allow people to set their own preference, a necessity
for those with different needs.

I hope this helps others with eye issues.

## Credits

Huge thanks to Andrew Pinkham, the author of the original [pre-commit-indents-to-tabs](https://github.com/jambonrose/pre-commit-indents-to-tabs)
plugin.
