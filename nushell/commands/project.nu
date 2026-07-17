export def --env main [] {
  let selected = (
    ^fd
      --type directory
      --max-depth 1
      --absolute-path
      .
      C:\Work\Projects
    | ^fzf
        --prompt "Project > "
        --height 70%
        --layout reverse
        --border
  )

  if ($selected | is-not-empty) {
    cd $selected
  }
}
