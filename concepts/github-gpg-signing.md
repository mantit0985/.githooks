# GitHub GPG Signing & Verified Commits

This guide details the process of achieving the "Verified" badge on GitHub commits, specifically handling privacy restrictions and identity mismatches.

## 🎯 The "Verified" Requirement
For a commit to be marked as **Verified**, three things must match exactly:
1. **Commit Author Email** $\rightarrow$ Must be a verified email on the GitHub account.
2. **GPG Key UID** $\rightarrow$ Must contain that same email address.
3. **Public Key** $\rightarrow$ Must be uploaded to the user's GitHub settings.

## 🛠️ The "Noreply" Workflow (Privacy Bypass)
When GitHub's "Block command line pushes that expose my email" setting is active, pushes with a personal email are rejected (`GH007`). The solution is to use the GitHub-provided noreply address.

### Step-by-Step Execution
1. **Identify Noreply Email**: Found in GitHub Settings $\rightarrow$ Emails (e.g., `282219401+username@users.noreply.github.com`).
2. **Generate GPG Key**: Create a new key specifically for this email.
   ```bash
   # Batch generation example
   gpg --batch --gen-key <script_file>
   ```
3. **Upload Key to GitHub**: Use the `gh` CLI to upload the armored public key.
   ```bash
   PUB_KEY=$(gpg --armor --export <KEY_ID>)
   gh api user/gpg_keys -f "armored_public_key=$PUB_KEY"
   ```
4. **Configure Git**: Update local or global config.
   ```bash
   git config user.email "282219401+username@users.noreply.github.com"
   git config user.signingkey <KEY_ID>
   git config commit.gpgsign true
   ```
5. **Flatten & Push (Sandbox)**: If history is messy, flatten the repo to a single commit to ensure all subsequent commits are verified.
   ```bash
   git checkout --orphan latest_branch && git add -A && git commit -m "Clean start" && git branch -D master && git branch -m master && git push -f origin master
   ```

## ⚠️ Common Pitfalls
- **Local vs Global**: Local `.git/config` overrides `~/.gitconfig`. Always check local settings in a repo.
- **UID Mismatch**: If the GPG key UID says `github@brainxio.org` but the commit says `manny.titsidu@brainxio.org`, it will be **unverified**.
- **Privacy Block**: `GH007` error is a server-side block. Either disable the setting in GitHub UI or use the noreply email.
