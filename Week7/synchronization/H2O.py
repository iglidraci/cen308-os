from threading import Semaphore, Barrier


class H2O:
    def __init__(self):
        self.elements = []
        self.h_semaphore = Semaphore(2)
        self.o_semaphore = Semaphore(1)
        self.b = Barrier(3)

    def hydrogen(self) -> None:
        with self.h_semaphore:
            self.b.wait()
            print("H", end='')

    def oxygen(self) -> None:
        with self.o_semaphore:
            self.b.wait()
            print("O", end='')