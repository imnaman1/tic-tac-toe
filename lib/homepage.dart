import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayO = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int fillBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player X',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(xScore.toString(),
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.0)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player 0',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(oScore.toString(),
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.0)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[700]),
                        ),
                        child: Center(
                          child: Text(
                            displayO[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 24.0),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Tic-Tac-Toe',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayO[index] == '') {
        displayO[index] = 'O';
        fillBox += 1;
      } else if (!oTurn && displayO[index] == '') {
        displayO[index] = 'X';
        fillBox += 1;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayO[0] == displayO[1] &&
        displayO[0] == displayO[2] &&
        displayO[0] != '') {
      _showDialog(displayO[0]);
    } else if (displayO[3] == displayO[4] &&
        displayO[3] == displayO[5] &&
        displayO[3] != '') {
      _showDialog(displayO[3]);
    } else if (displayO[6] == displayO[7] &&
        displayO[6] == displayO[8] &&
        displayO[6] != '') {
      _showDialog(displayO[6]);
    } else if (displayO[0] == displayO[3] &&
        displayO[0] == displayO[6] &&
        displayO[0] != '') {
      _showDialog(displayO[0]);
    } else if (displayO[1] == displayO[4] &&
        displayO[1] == displayO[7] &&
        displayO[1] != '') {
      _showDialog(displayO[1]);
    } else if (displayO[2] == displayO[5] &&
        displayO[2] == displayO[8] &&
        displayO[2] != '') {
      _showDialog(displayO[2]);
    } else if (displayO[0] == displayO[4] &&
        displayO[0] == displayO[8] &&
        displayO[0] != '') {
      _showDialog(displayO[0]);
    } else if (displayO[2] == displayO[4] &&
        displayO[2] == displayO[6] &&
        displayO[2] != '') {
      _showDialog(displayO[2]);
    } else if (fillBox == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game resulted in Draw'),
            actions: [
              TextButton(
                onPressed: () {
                  _clearGame();
                  Navigator.pop(context);
                },
                child: Text('Play Again'),
              ),
            ],
          );
        });
  }

  void _showDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner ' + winner),
            actions: [
              TextButton(
                onPressed: () {
                  _clearGame();
                  Navigator.pop(context);
                },
                child: Text('Play Again'),
              ),
            ],
          );
        });
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _clearGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayO[i] = '';
      }
    });
    fillBox = 0;
  }
}
