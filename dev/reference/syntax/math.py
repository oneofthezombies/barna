from typing import Tuple, TypeVar, Union, Optional

T = TypeVar('T')
Right = Tuple[None, T]
Left = Tuple[Exception, None]
Either = Union[Right, Left]

def add(a, b) -> Either[int]:
    return a + b, None

def subtract(a, b) -> Tuple[int, None]:
    return a - b, None

def multiply(a, b) -> Tuple[int, None]:
    return a * b, None

def divide(a, b) -> Tuple[float, None]:
    if b == 0:
        return None, Exception("Cannot divide by zero")
    return a / b, None

def main():
    pass
