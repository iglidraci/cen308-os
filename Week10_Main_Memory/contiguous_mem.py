from dataclasses import dataclass


class ContiguousMemoryError(Exception):
    pass


@dataclass
class Partition:
    start: int
    end: int
    process: str = None
    prev: "Partition" = None
    next: "Partition" = None


SIZE = int(input("Enter the size:"))
memory_size = 0
memory = Partition(0, SIZE-1)


def create_partition(start, end, process, prev, nxt):
    new_partition = Partition(start, end, process, prev, nxt)
    if prev:
        prev.next = new_partition
    if nxt:
        nxt.prev = new_partition
    return new_partition


def first_fit(process, size):
    current = memory
    while current:
        if not current.process and current.end - current.start + 1 >= size:
            current.process = process
            current.next = create_partition(
                current.start + size, current.end, None, current, current.next
            )
            current.end = current.start + size - 1
            break
        else:
            current = current.next


def best_fit(process, size):
    pass


def worst_fit(process, size):
    pass


def request_memory(process, size, method):
    if method == "F":
        first_fit(process, size)
    elif method == "B":
        best_fit(process, size)
    elif method == "W":
        worst_fit(process, size)
    else:
        raise ContiguousMemoryError("Wrong allocate method")


def release_memory(process):
    global memory
    current = memory
    while current:
        if current.process == process:
            current.process = None
        # merge with the previous partition if it's a hole
        if not current.process and current.prev and not current.prev.process:
            tmp = current.prev
            current.prev = tmp.prev
            if tmp.prev:
                tmp.prev.next = current
            current.start = tmp.start
        if not current.prev:
            memory = current
        current = current.next


def compaction():
    pass


def show_stats():
    print("_"*30)
    current = memory
    while current:
        print(f"{current.start} - {current.end} ", end='')
        if current.process:
            print(f"Process {current.process}")
        else:
            print("Hole")
        current = current.next
    print("_"*30)


while True:
    try:
        command = input(">").split(" ")
        if len(command) == 4 and command[0] == "RQ":
            # RQ P0 40000 W
            request_memory(*command[1:])
        elif len(command) == 2 and command[0] == "RL":
            # RL P0
            release_memory(command[1])
        elif len(command) == 1:
            if command[0] == "C":
                compaction()
            elif command[0] == "STAT":
                show_stats()
            elif command[0] == "EXIT":
                exit(1)
    except ContiguousMemoryError as e:
        print(e)
