from foo import hello_world

# Make CLI runnable from source tree with `python src/package`
if not __package__:
    import sys
    from pathlib import Path

    sys.path.insert(0, str(Path(__file__).parent.parent))


def main() -> None:
    print(hello_world())


if __name__ == "__main__":
    main()
