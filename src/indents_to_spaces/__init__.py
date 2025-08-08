"""Replace spaces with tabs in lines that begin with spaces."""
from __future__ import annotations

import sys
import argparse
import subprocess
from typing import Sequence

from .convert import convert_indents

__version__ = "0.0.3"


def main(argv: Sequence[str] | None = None) -> int:
    """Convert indents when invoked from command line"""
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "filenames",
        nargs="+",
        type=argparse.FileType("rb+"),
        help="Files to convert",
    )
    parser.add_argument(
        "--run",
        type=str,
        help="Comma-delimited commands to run before indent replacement",
    )
    parser.add_argument(
        "--spaces",
        type=int,
        default=4,
        metavar="INTEGER",
        help="How many spaces to replace a tab",
    )
    args = parser.parse_args(argv)

    if args.run:
        run_cmd: list[str] = args.run.split(",")
        subprocess.run(run_cmd)

    return convert_indents(args.filenames, args.spaces)


if __name__ == "__main__":
    raise SystemExit(main())
