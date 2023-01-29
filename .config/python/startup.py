"""Executed on startup of an interactive Python session"""

from __future__ import annotations

import readline
import sys
from os import getenv

# Common imports
try:
    from dataclasses import dataclass  # noqa: F401
    from datetime import datetime, time, timedelta  # noqa: F401
    from pathlib import Path  # noqa: F401
    from pprint import pprint  # noqa: F401
except ImportError:
    pass

# Disable default history file
readline.write_history_file = lambda *args: None


def launch_repl():
    """Launch a better REPL (ptpython), if available"""
    if sys.version_info < (3, 6):
        # Not compatible
        return

    # HACK: inject ptpython
    prefix = Path(getenv("HOMEBREW_PREFIX", "/opt/homebrew"))
    libs = list(prefix.joinpath("opt/ptpython/libexec/lib").glob("python*"))
    if not libs:
        return
    sys.path.append(str(libs[0] / "site-packages"))

    try:
        from ptpython.repl import embed
    except ImportError:
        return

    # Configure repl
    def configure(repl):
        repl.complete_while_typing = True
        repl.confirm_exit = False
        repl.highlight_matching_parenthesis = True
        repl.show_signature = True
        repl.use_code_colorscheme("one-dark")

    # Enable history
    xdg_data = Path(getenv("XDG_DATA_HOME", "~/.local/share")).expanduser()
    history_file = xdg_data / "python" / "history"
    history_file.parent.mkdir(parents=True, exist_ok=True)

    # Launch
    sys.exit(
        embed(
            globals=globals(),
            configure=configure,
            history_filename=history_file,
        )
    )


launch_repl()
