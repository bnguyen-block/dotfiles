# Alias git to hub
eval "$(hub alias -s)"

gitme() {
  git init
  touch README.md
  git add --all
  git commit -m 'Initial commit'
}

# Purge branch or all branches except master
gbp() {
  if [[ -z "$1" ]]; then
    git branch | grep -v master | xargs -I {} git branch -D {}
  else
    git branch -D "$1"
  fi
}

# Update commit message template. This will overwrite ~/.gitmessage.
# Support JIRA workflow and kowainik workflow
update_git_message_template() {
  local CURRENT_BRANCH
  local GIT_USER
  local JIRA_WORKFLOW_PATTERN
  local KOWAINIK_WORKFLOW_PATTERN
  local PREFIX_MESSAGE

  CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

  # shellcheck disable=SC2001
  PREFIX_MESSAGE=$(echo "$CURRENT_BRANCH" | sed 's/\([A-Z]*[\-|\/][0-9]*\).*/\1/')
  JIRA_WORKFLOW_PATTERN="[A-Z]+-[0-9]+"

  GIT_USER=$(git config user.login)
  KOWAINIK_WORKFLOW_PATTERN="$GIT_USER/[0-9]+"

  COMMITIZEN_JIRA_PATTERN="[A-Za-z]+/$JIRA_WORKFLOW_PATTERN"

  # Current branch name does not match Jira format. Use sample git message.
  if [[ $PREFIX_MESSAGE =~ $JIRA_WORKFLOW_PATTERN ]]; then
    echo "$PREFIX_MESSAGE" | awk -F'-' '{ print toupper($1)"-"$2": " }' >"$HOME/.gitmessage"
  elif [[ $PREFIX_MESSAGE =~ $KOWAINIK_WORKFLOW_PATTERN ]]; then
    echo "$PREFIX_MESSAGE" | awk -F'/' '{ print "[#"$2"]: " }' >"$HOME/.gitmessage"
  elif [[ $CURRENT_BRANCH =~ $COMMITIZEN_JIRA_PATTERN ]]; then
    echo "$CURRENT_BRANCH" | awk -F'/' '{ print ""$2" - "$1"(impact component) - " }' >"$HOME/.gitmessage"
  elif [[ $CURRENT_BRANCH == master ]]; then
    cp "$HOME/.gitmessage.sample" "$HOME/.gitmessage"
  else
    echo "$CURRENT_BRANCH: " >"$HOME/.gitmessage"
  fi
}

gc() {
  update_git_message_template && git commit "$@"
}

gcf() {
  COMMIT_HASH="$1"
  shift
  git commit "$@" --fixup "$COMMIT_HASH"
  git rebase --interactive --autosquash "$COMMIT_HASH"^
}

gbrpr() {
  local pr
  if [[ -z "$1" ]]; then
    pr="pulls"
  else
    pr="pull/$1"
  fi

  git browse -- "$pr"
}