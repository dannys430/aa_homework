import React from "react";

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        // your code here
        this.state = {
            num1: '',
            num2: '',
            result: 0
        };

        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);

        this.add = this.add.bind(this);
        this.subtract = this.subtract.bind(this);
        this.multiply = this.multiply.bind(this);
        this.divide = this.divide.bind(this);

        this.clear = this.clear.bind(this);
    }

    setNum1(event) {
        event.preventDefault()
        this.setState({num1: event.target.value})
    }

    setNum2(event) {
        event.preventDefault()
        this.setState({num2: event.target.value})
    }

    add(event) {
        event.preventDefault()
        const firstNum = Number(this.state.num1);
        const secondNum = Number(this.state.num2);
        this.setState({result: firstNum + secondNum })
    }

    subtract(event) {
        event.preventDefault()
        const firstNum = Number(this.state.num1);
        const secondNum = Number(this.state.num2);
        this.setState({result: firstNum - secondNum })
    }

    multiply(event) {
        event.preventDefault()
        const firstNum = Number(this.state.num1);
        const secondNum = Number(this.state.num2);
        this.setState({result: firstNum * secondNum})
    }

    divide(event) {
        event.preventDefault()
        const firstNum = Number(this.state.num1);
        const secondNum = Number(this.state.num2);
        this.setState({result: firstNum / secondNum})
    }

    clear(event) {
        event.preventDefault()
        this.setState({num1: '', num2: '', result: 0})
    }

    render() {
        return (
            <div>
                <h1>{this.state.result}</h1>   
                <input type="text" value={this.state.num1} onChange={this.setNum1}/>
                <input type="text" value={this.state.num2} onChange={this.setNum2}/>
                <br/>
                <button onClick={this.add}>+</button>
                <button onClick={this.subtract}>-</button>
                <button onClick={this.multiply}>*</button>
                <button onClick={this.divide}>/</button>
                <br/>
                <button onClick={this.clear}>CLEAR</button>
            </div>
        );
    }
}

export default Calculator;