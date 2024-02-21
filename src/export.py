import os

if os.name == 'nt':
    from impl import cmd as impl
elif os.name == 'posix':
    from impl import unix as impl
else:
    raise ImportError(f"Unsupported OS: {os.name}")


if __name__ == '__main__':
    impl.hello()
