function _git_finishpr
    set -l default_branch "$(git head-branch)"
    git checkout $default_branch && git pull origin $default_branch
    git push --delete origin $argv[1]
    git branch --delete --force $argv[1]
end
