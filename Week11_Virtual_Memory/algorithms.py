from typing import Union
from dataclasses import dataclass


@dataclass
class Node:
    page: Union[int, None]
    next: "Node"
    prev: "Node"


class LRU:
    def __init__(self, capacity: int, verbose: bool = False) -> None:
        self.__capacity: int = capacity
        self.__head: Node = Node(None, None, None)
        self.__tail: Node = Node(None, None, self.__head)
        self.__head.next = self.__tail
        self.__cache = {}
        self.page_fault = 0
        self.__verbose = verbose

    def _remove_from_dll(self, node: Node) -> None:
        prev = node.prev
        nxt = node.next
        prev.next = nxt
        nxt.prev = prev

    def _add_to_tail(self, node: Node) -> None:
        last = self.__tail.prev
        last.next = node
        node.prev = last
        node.next = self.__tail
        self.__tail.prev = node

    def reference(self, page):
        if page not in self.__cache:
            self.page_fault += 1
            if self.__verbose:
                print(f"Reference {page} caused page fault")
        else:
            self._remove_from_dll(self.__cache[page])
        node = Node(page, None, None)
        self._add_to_tail(node)
        self.__cache[page] = node
        if len(self.__cache) > self.__capacity:
            key_to_remove = self.__head.next.page # LRU page
            self._remove_from_dll(self.__head.next)
            self.__cache.pop(key_to_remove)
            if self.__verbose:
                print(f"Page {key_to_remove} swapped out of memory")


class FIFO:
    def __init__(self, capacity: int, verbose: bool = False) -> None:
        self.__capacity = capacity
        self.__verbose = verbose
        self.__queue = []
        self.page_fault = 0
    
    def reference(self, page: int):
        if page not in self.__queue:
            self.__queue.append(page)
            self.page_fault += 1
            if self.__verbose:
                print(f'Page {page} caused page fault')
            if len(self.__queue) > self.__capacity:
                removed_page = self.__queue.pop(0)
                if self.__verbose:
                    print(f"Page {removed_page} swapped out of memory")

