set -x PIP_DISABLE_PIP_VERSION_CHECK 1
set -x PIP_REQUIRE_VIRTUALENV 1
set -x PIPX_DEFAULT_PYTHON /usr/local/bin/python3 # don't break venv's on brew upgrade
set -x POETRY_VIRTUALENVS_IN_PROJECT true
set -x PYTHONDONTWRITEBYTECODE 1
