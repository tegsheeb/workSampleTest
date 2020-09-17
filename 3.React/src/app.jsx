import React, {Component} from "react"
import "./style.scss"

class App extends Component {
    constructor() {
        super()
        this.state = {
            inputColor: "",
            currentColor: "black",
            message: ''
            }
  
      this.handleChange = this.handleChange.bind(this)
      this.changeColor = this.changeColor.bind(this)
    }
  
    handleChange(event) {
      this.setState({inputColor: event.target.value})
    }
  
    isColor(strColor){
        var s = new Option().style;
        s.color = strColor;
        return s.color == strColor;
    }
    
    changeColor() {
        let inputColor = this.state.inputColor.toLowerCase()
        if(this.isColor(inputColor)) {
            this.setState({
                currentColor : inputColor
            })
            this.setState({
                inputColor : "",
                message : "",
            })
        } else {
            this.setState({
                message : "Please enter a valid color"
            })
        }
    }

    render() {
      return (
        <div className="app">
        <div className="circle" style={{backgroundColor: this.state.currentColor}}> </div>
        <form >
          <label>
            Enter color of the circle:
            <input type="text" value={this.state.inputColor} onChange={this.handleChange} />
          </label>
        </form>
        <button onClick={this.changeColor}> Change color! </button>
        <div> {this.state.message}</div>
        </div>
      );
    }
  }

export default App