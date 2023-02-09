function plogin
    set -l key_file $(mktemp)
    op read -f -o $key_file "op://Private/Artifactory API Key/credential" >/dev/null
    podman login -u michael.goodness@mlb.com --password-stdin <$key_file artifacts.mlbinfra.net
end
