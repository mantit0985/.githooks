# ⚓ .githooks Hub

This repository provides centralized Git hooks and quality gates to ensure consistency, security, and precision across all projects in the `mantit0985` ecosystem.

## 🎯 Purpose

The goal of this hub is to eliminate "it works on my machine" by providing shared, version-controlled hooks that automate:
- **Linting**: Enforcing markdown and code standards.
- **Security**: Preventing secrets from being committed.
- **Consistency**: Ensuring conventional commit messages.

## 📂 Structure

- `hooks/`: The actual hook scripts (e.g., `pre-commit`, `commit-msg`).
- `scripts/`: Helper utilities used by the hooks.
- `concepts/`: Documentation on the technical implementation of specific hooks.
- `tests/`: Verification suites for hook behavior.

## 🚀 Installation

To apply these hooks to a local repository:
1. Clone this repository.
2. Symlink the desired hooks from `hooks/` to `.git/hooks/` in your target project.
3. Ensure scripts in `scripts/` are executable.

## 🛠️ Maintenance

Hooks are audited against the account's [Standards](https://github.com/mantit0985/.github/blob/master/docs/standards.md). Any changes to the quality gates must be proposed via a PR.

---
*Part of the mantit0985 RQE Ecosystem*
