function git-rebase-preserve-author
    set -l branch (git symbolic-ref --short HEAD)
    set -l stash (git stash create)

    git checkout $argv[1]; and git pull; and git checkout $branch; or exit 1

    git rebase --rebase-merges $argv[1]

    set -l root_dir (git rev-parse --show-toplevel)
    set -l stopped_sha_file $root_dir/.git/rebase-merge/stopped-sha

    while test -f "$stopped_sha_file"
        set -l stopped_sha (cat $stopped_sha_file)
        set -l git_author_string "(git show -s --format='%an <%ae>' $stopped_sha)"

        for c in (git diff --name-only --diff-filter=U)
            eval $GIT_EDITOR $root_dir/$c
        end

        git commit --all --author="$git_author_string"
        git rebase --continue
    end
end
