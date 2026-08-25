{pkgs, ...}:
with pkgs; [
  alejandra
  bat
  buf
  cmake
  delta
  diff-so-fancy
  difftastic
  docker-compose
  entr
  fd
  ghcid
  github-cli
  gnupg
  gopls
  graphviz
  hadolint
  hlint
  htop
  hub
  hugo
  jd-diff-patch
  jq
  just
  lua
  luajitPackages.luacheck
  luarocks
  markdownlint-cli
  markdownlint-cli2
  mise
  mkcert
  moreutils
  nixfmt
  nixpkgs-fmt
  # nushell
  ormolu
  pandoc
  pdftk
  # Disable tests/test_inject.py: newer pytest rejects its single-string
  # parametrize values, breaking test collection (fails to build otherwise)
  (pipx.overrideAttrs (old: {
    disabledTestPaths = (old.disabledTestPaths or [ ]) ++ [ "tests/test_inject.py" ];
  }))
  plantuml
  # Disable 3 executor tests with stale output-string assertions
  # (fails to build otherwise)
  (poetry.overrideAttrs (old: {
    disabledTests = (old.disabledTests or [ ]) ++ [
      "test_execute_executes_a_batch_of_operations"
      "test_execute_prints_warning_for_yanked_package"
    ];
  }))
  postgresql_17
  pylint
  python312Packages.sqlparse
  ripgrep
  ruff
  shellcheck
  shfmt
  sqlint
  stylish-haskell
  stylua
  terraform-ls
  tldr
  tree
  tree-sitter
  usage
  uv
  watch
  wget
  witr
  # Skip two tests that probe the process table, which the darwin Nix
  # sandbox blocks (fails to build otherwise; not fixed upstream as of 0.68.0)
  (worktrunk.overrideAttrs (old: {
    checkFlags = (old.checkFlags or [ ]) ++ [
      "--skip=shell::utils::tests::test_process_name_and_ppid_self"
      "--skip=shell::utils::tests::test_probe_reports_invoked_name_for_sh"
    ];
  }))
  xclip
  yaml-language-server
  yamllint
  yarn
  yq
]
