Tic Tac Toe & Battleship


--  Never update State directly, always use setState()
--  Never alter the DOM directly, always operate on a value in state
        --  aka DO NOT CHANGE INDEX.HTML
--  Only call setState once per method or render cycle
--  State is for values that change, Props is for values to pass to a child component, constants should be set outside the component

tic tac toe tips:
this.state={
    player1: {selected: true/false, icon: null, name:
    player2:
    ai:
    sounds:
    effects:
}
^^ everything that will change in code


when setting up grid, return each individual square as a key. will treat it like index but way better?