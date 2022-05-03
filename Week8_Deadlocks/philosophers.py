from threading import Lock
from abc import ABC, abstractmethod

class DP(ABC):
    def __init__(self) -> None:
        self.philosophers = ["Descartes", "Plato", "Socrates", "Thales", "Machiavelli"]
        self.chopsticks = [Lock() for _ in range(5)]
        
    @abstractmethod
    def eat(self, i):
        pass

class DPBad(DP):
    """
    deadlock if all philosophers pick up the left chopstick
    """
    def __init__(self):
        super().__init__()
    
    def eat(self, i):
        pass
        

class DP1(DP):
    """
    Allow at most 4 philosophers sitting simultaneously at the table
    """
    def __init__(self) -> None:
        super().__init__()
        
    def eat(self, i):
        pass
        

class DP2(DP):
    """
    Use an asymmetric solution
    Odd numbered philosopher picks up first the left chopstick then the right
    Even numbered philosopher picks up first the right chopstick then the left
    """
    def __init__(self) -> None:
        super().__init__()
    
    def eat(self, i):
        pass
        