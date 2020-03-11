#!/usr/bin/env python3

from engine import Controller
from rmg import RandomMoveGenerator
from human import HumanPlayer

con = Controller(RandomMoveGenerator(), RandomMoveGenerator())
conWinner = con.start()
if conWinner < 3:
    print(f"Player {conWinner} won!")
else:
    print("Draw!")
