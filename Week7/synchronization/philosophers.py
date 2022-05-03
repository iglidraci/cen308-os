import random
from threading import Semaphore, Lock
from time import sleep


class DPBad:
    """
    deadlock if all philosophers pick up the left chopstick
    """
    def __init__(self, philosophers):
        self.chopsticks = [Lock() for _ in range(5)]
        self.philosophers = philosophers

    def eat(self, i):
        seconds = random.random()
        left = i
        right = (i - 1) % 5
        self.chopsticks[left].acquire()
        print(f'{self.philosophers[i]} picked the left chopstick')
        sleep(seconds)
        self.chopsticks[right].acquire()
        print(f'{self.philosophers[i]} picked the right chopstick')
        print(f'{self.philosophers[i]} eating')
        print(f'{self.philosophers[i]} put down the left chopstick')
        print(f'{self.philosophers[i]} put down the right chopstick')
        self.chopsticks[left].release()
        self.chopsticks[right].release()


class DP2:
    """
    Use an asymmetric solution
    Odd numbered philosopher picks up first the left chopstick then the right
    Even numbered philosopher picks up first the right chopstick then the left
    """
    def __init__(self, philosophers):
        self.chopsticks = [Lock() for _ in range(5)]
        self.philosophers = philosophers

    def print_actions(self, i):
        print(f'{self.philosophers[i]} picked the left chopstick')
        print(f'{self.philosophers[i]} picked the right chopstick')
        print(f'{self.philosophers[i]} eating')
        print(f'{self.philosophers[i]} put down the left chopstick')
        print(f'{self.philosophers[i]} put down the right chopstick')

    def eat(self, i):
        seconds = random.random()
        print(f'{self.philosophers[i]} thinking for {seconds}')
        sleep(seconds)
        left = i
        right = (i - 1) % 5
        if (i + 1) % 2 == 1:
            with self.chopsticks[left], self.chopsticks[right]:
                self.print_actions(i)
        else:
            with self.chopsticks[right], self.chopsticks[left]:
                self.print_actions(i)


class DP1:
    """
    Allow at most 4 philosophers sitting simultaneously at the table
    """
    def __init__(self, philosophers):
        self.simultaneously = Semaphore(4)
        self.chopsticks = [Lock() for _ in range(5)]
        self.philosophers = philosophers

    def eat(self, i):
        seconds = random.random()
        print(f'{self.philosophers[i]} thinking for {seconds}')
        sleep(seconds)
        self.simultaneously.acquire()
        left = i
        right = (i - 1) % 5
        self.chopsticks[left].acquire()
        self.chopsticks[right].acquire()
        print(f'{self.philosophers[i]} picked the left chopstick')
        print(f'{self.philosophers[i]} picked the right chopstick')
        print(f'{self.philosophers[i]} eating')
        print(f'{self.philosophers[i]} put down the left chopstick')
        print(f'{self.philosophers[i]} put down the right chopstick')
        self.chopsticks[left].release()
        self.chopsticks[right].release()
        self.simultaneously.release()
