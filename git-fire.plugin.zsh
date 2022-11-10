
REPO='https://github.com/qw3rtman/git-fire.git'
REPO_PATH="${0:h}/git-fire-repo"

function update_git_fire() {
    pushd &> /dev/null
    git pull origin master
    popd &> /dev/null
}

function ensure_repo_path() {
    if [[ ! -e "$REPO_PATH" ]]; then
        git clone "$REPO" "$REPO_PATH" &> /dev/null
        return $?
    fi
    return 0
}

ensure_repo_path

if [[ -f "$REPO_PATH/git-fire" ]]; then
    export PATH=$REPO_PATH:$PATH
    source "${0:h}/alias.sh"
fi

alias git-fire-update="update_git_fire"

