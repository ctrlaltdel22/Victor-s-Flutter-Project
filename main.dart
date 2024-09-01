import 'package:flutter/material.dart';

//Victor's first flutter project
void main() {
  runApp(const MyApp()); //start of home screen of app
}
class ResultPage extends StatefulWidget {
  final String selectedOption;

  const ResultPage({super.key, required this.selectedOption});

  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  late List<List<String?>> matrix;

  @override
  void initState() {
    super.initState();
    matrix = List.generate(3, (_) => List.filled(3, null));
    updateMatrix();
  }

  void updateMatrix() {

    //create list to calculate sequence of numbers based on selected period
    List<List<int>> order = [
      [1, 1], [2, 2], [1, 2], [2, 0], [0, 1],
      [2, 1], [0, 2], [1, 0], [0, 0]
    ];


    //create variable to dropdown menu
    int period = int.parse(widget.selectedOption.replaceAll(RegExp(r'[^0-9]'), ''));


    //create list of 9 numbers
    List<int> numbers = List.generate(9, (index) => 1 + (index + period - 1) % 9);

    //clear matrix by resetting elements to null
    matrix.forEach((row) => row.fillRange(0, row.length, null));


    //update matrix
    for (int i = 0; i < order.length; i++) {
      matrix[order[i][0]][order[i][1]] = numbers[i].toString();
    }

    //change state of widget
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //include appBar
      appBar: AppBar(
        //title of appBar
        title: const Text('Previous Page'),
      ),
      //adjust body
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //grid layout
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          ),
          //number of elements in the grid
          itemCount: 9,
          itemBuilder: (context, index) {
            //create and initialize variables to calculate row and column
            int row = index ~/ 3;
            int col = index % 3;
            return Card(
              child: Center(
                //display matrix
                child: Text(matrix[row][col] ?? '', style: const TextStyle(fontSize: 24)),
              ),
            );
          },
        ),
      ),
    );
  }
}


//start of Period1 widget
class Period1 extends StatefulWidget {
  const Period1({super.key});

  @override
  //create object
  Period1State createState() => Period1State();
}

//gets info from drop down menu
class Period1State extends State<Period1> {
  String? selectedOption;

  //create list of strings with measurements
  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //start of appBar
      appBar: AppBar(
        //appBar title
        title: const Text('Period 1'),
      ),
      body: Center(
        child: Column(
          children: [
            //asking user for input
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            //options for drop down menu
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            //code for button
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          //leads to ResultPage if option is chosen by user
                          builder: (context) => ResultPage(selectedOption: '1')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        //make sure user chooses an option
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                //button to submit
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}

class Period2 extends StatefulWidget {
  const Period2({super.key});

  @override
  Period2State createState() => Period2State();
}

class Period2State extends State<Period2> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 2'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '2')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}

class Period3 extends StatefulWidget {
  const Period3({super.key});

  @override
  Period3State createState() => Period3State();
}

class Period3State extends State<Period3> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 3'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '3')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}

class Period4 extends StatefulWidget {
  const Period4({super.key});

  @override
  Period4State createState() => Period4State();
}

class Period4State extends State<Period4> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 4'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '4')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}


class Period5 extends StatefulWidget {
  const Period5({super.key});

  @override
  Period5State createState() => Period5State();
}

class Period5State extends State<Period5> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 5'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '5')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}

class Period6 extends StatefulWidget {
  const Period6({super.key});

  @override
  Period6State createState() => Period6State();
}

class Period6State extends State<Period6> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 6'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '6')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}

class Period7 extends StatefulWidget {
  const Period7({super.key});

  @override
  Period7State createState() => Period7State();
}

class Period7State extends State<Period7> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 7'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    // Passing '7' directly for Period 7
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '7')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}


class Period8 extends StatefulWidget {
  const Period8({super.key});

  @override
  Period8State createState() => Period8State();
}

class Period8State extends State<Period8> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 8'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    // Passing '8' directly for Period 8
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '8')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}

class Period9 extends StatefulWidget {
  const Period9({super.key});

  @override
  Period9State createState() => Period9State();
}

class Period9State extends State<Period9> {
  String? selectedOption;

  final List<String> options = [
    "N1 (337.6 - 352.5)", "N2 (352.6 - 7.5)", "N3 (7.6 - 22.5)",
    "NE1 (22.6 - 37.5)", "NE2 (37.6 - 52.5)", "NE3 (52.6 - 67.5)",
    "E1 (67.6 - 82.5)", "E2 (82.6 - 97.5)", "E3 (97.6 - 112.5)",
    "SE1 (112.6 - 127.5)", "SE2 (127.6 - 142.5)", "SE3 (142.6 - 157.5)",
    "S1 (157.6 - 172.5)", "S2 (172.6 - 187.5)", "S3 (187.6 - 202.5)",
    "SW1 (202.6 - 217.5)", "SW2 (217.6 - 232.5)", "SW3 (232.6 - 247.5)",
    "W1 (247.6 - 262.5)", "W2 (262.6 - 277.5)", "W3 (277.6 - 292.5)",
    "NW1 (292.6 - 307.5)", "NW2 (307.6 - 322.5)", "NW3 (322.6 - 337.5)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period 9'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'What is the facing?',
              style: TextStyle(fontSize: 25.0),
            ),
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text("Select an Option"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(selectedOption: '9')
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an option before submitting!"))
                    );
                  }
                },
                child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}




class GetInfo extends StatelessWidget {
  const GetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        //option for user to go back to home page
        title: const Text(
          'Back to Home Page',
          //text font
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //user input for move in date
              const Text(
                'What is the move-in period?',
                style: TextStyle(fontSize: 25.0),
              ),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //choice of years, if current period is chosen then user is navigated to chosen page
                      const Text('Year 1864 - Year 1883'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period1()),
                          );
                        },
                        child: const Text('Period 1'),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 1884 - Year 1903'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period2()),
                          );
                        },
                        child: const Text('Period 2'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 1904 - Year 1923'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period3()),
                          );
                        },
                        child: const Text('Period 3'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 1924 - Year 1943'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period4()),
                          );
                        },
                        child: const Text('Period 4'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 1944 - Year 1963'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period5()),
                          );
                        },
                        child: const Text('Period 5'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 1964 - Year 1983'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period6()),
                          );
                        },
                        child: const Text('Period 6'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 1984 - Year 2003'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period7()),
                          );
                        },
                        child: const Text('Period 7'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 2004 - Year 2023'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period8()),
                          );
                        },
                        child: const Text('Period 8'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (BuildContext options) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Year 2024 - Year 2043'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Period9()),
                          );
                        },
                        child: const Text('Period 9'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  //start of the home screen of app
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //title of home screen
              const Text(
                'Feng Shui Calculator',
                //font and style of home screen text
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Archive Black',
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30),
              Builder(

                builder: (BuildContext newContext) {

                  //user input button to start app
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        newContext,
                        MaterialPageRoute(
                            builder: (context) => const GetInfo()),
                      );
                    },
                    child: const Text('Let\'s Calculate!'), //button to start calculator
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
