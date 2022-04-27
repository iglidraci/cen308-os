from threading import Semaphore


class H2O:
    def __init__(self):
        self.nr_h = 0
        self.nr_o = 0
        self.h_semaphore = Semaphore(1)
        self.o_semaphore = Semaphore(0)

    def hydrogen(self) -> None:
        with self.h_semaphore:
            print("H", end='')
            self.nr_h += 1
            if self.nr_h == 2:
                self.nr_o = 0
                self.o_semaphore.release()
            else:
                self.h_semaphore.release()

    def oxygen(self) -> None:
        with self.o_semaphore:
            print("O", end='')
            if self.nr_o == 1:
                self.nr_h = 0
                self.h_semaphore.release()
