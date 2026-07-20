# Additional executable paths
#
# Existing Windows and Scoop tools remain higher in PATH.
# MSYS2 is appended so it supplies tools such as Neovim when
# no Windows-native version is already available.

let delta_dir = (
    $env.LOCALAPPDATA
    | path join "Programs" "scoop" "apps" "delta" "current"
)

let just_dir = (
    $env.LOCALAPPDATA
    | path join "Programs" "scoop" "apps" "just" "current"
)

let msys2_ucrt64_bin = ($env.MSYS2_ROOT | path join 'ucrt64' 'bin')

let additional_paths = [
    $delta_dir
    $just_dir
    $msys2_ucrt64_bin
]

let existing_paths = (
    $additional_paths
    | where { |path| $path | path exists }
)

$env.PATH = (
    $env.PATH
    | append $existing_paths
    | uniq
)
