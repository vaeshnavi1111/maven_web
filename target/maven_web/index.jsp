<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .calculator {
            display: inline-block;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        input[type="text"] {
            width: 100%;
            height: 40px;
            margin-bottom: 10px;
            text-align: right;
            font-size: 16px;
        }
        button {
            width: 23%;
            height: 40px;
            margin: 1%;
            font-size: 16px;
            cursor: pointer;
        }
        .operator {
            background-color: #4CAF50;
            color: white;
        }
        .clear {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <input type="text" id="result" readonly />
        <br>
        <button onclick="appendNumber('7')">7</button>
        <button onclick="appendNumber('8')">8</button>
        <button onclick="appendNumber('9')">9</button>
        <button class="operator" onclick="setOperator('+')">+</button>
        <br>
        <button onclick="appendNumber('4')">4</button>
        <button onclick="appendNumber('5')">5</button>
        <button onclick="appendNumber('6')">6</button>
        <button class="operator" onclick="setOperator('-')">-</button>
        <br>
        <button onclick="appendNumber('1')">1</button>
        <button onclick="appendNumber('2')">2</button>
        <button onclick="appendNumber('3')">3</button>
        <button class="operator" onclick="setOperator('')"></button>
        <br>
        <button onclick="appendNumber('0')">0</button>
        <button onclick="appendNumber('.')">.</button>
        <button class="clear" onclick="clearResult()">C</button>
        <button class="operator" onclick="setOperator('/')">/</button>
        <br>
        <button style="width: 98%;" onclick="calculateResult()">=</button>
    </div>

    <script>
        let equation = ''; // Store the full equation for display
        let operator = ''; // Store the current operator
        let currentInput = ''; // Current number input

        function appendNumber(number) {
            currentInput += number; // Add digit to current number
            equation += number; // Add digit to the equation
            updateDisplay(equation);
        }

        function setOperator(op) {
            if (currentInput === '' && equation === '') return; // Prevent operator without numbers
            if (currentInput === '' && equation.slice(-1).match(/[\+\-\*\/]/)) {
                // Replace the last operator if clicked twice
                equation = equation.slice(0, -1) + op;
            } else {
                operator = op;
                equation += op; // Add operator to the equation
                currentInput = ''; // Reset current input for next number
            }
            updateDisplay(equation);
        }

        function calculateResult() {
            if (equation === '' || equation.slice(-1).match(/[\+\-\*\/]/)) return; // Prevent invalid equation
            try {
                const result = eval(equation); // Evaluate the equation
                updateDisplay(result);
                equation = result.toString(); // Set result as the next starting point
                currentInput = '';
            } catch (e) {
                updateDisplay('Error');
            }
        }

        function clearResult() {
            equation = '';
            currentInput = '';
            operator = '';
            updateDisplay('');
        }

        function updateDisplay(value) {
            document.getElementById('result').value = value;
        }
    </script>
</body>
</html>
