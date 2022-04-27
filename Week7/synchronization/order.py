from threading import Semaphore


class Foo:
    def __init__(self):
        self.first_sem = Semaphore(1)
        self.second_sem = Semaphore(0)
        self.third_sem = Semaphore(0)

    def first(self) -> None:
        with self.first_sem:
            print("first")
            self.second_sem.release()

    def second(self) -> None:
        with self.second_sem:
            print("second")
            self.third_sem.release()

    def third(self) -> None:
        with self.third_sem:
            print("third")
