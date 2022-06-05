from random import randint
from typing import List
from algorithms import LRU, FIFO


def main():
    frames = 6
    # frames = int(input("Enter the number of frames: "))
    lru = LRU(frames)
    # page_references = [randint(0, 9) for _ in range(30)]
    page_references = [1, 2, 3, 4, 2, 1, 5, 6, 2, 1, 2, 3, 7, 6, 3, 2, 1, 2, 3, 6]
    print(page_references)
    for p in page_references:
        lru.reference(p)
    print(f"LRU total number of page faults: {lru.page_fault}")
    fifo = FIFO(frames)
    for p in page_references:
        fifo.reference(p)
    print(f"FIFO total number of page faults: {fifo.page_fault}")


if __name__ == '__main__':
    main()
    