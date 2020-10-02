import React, {useState, useRef} from "react"
import "./style.scss"

const App = () => {
    const [color, setColor] = useState("black");
    const [message, setMessage] = useState("");
    const colorRef = useRef();
      
    const handleClick = (e) => {
        changeColor(colorRef.current.value);
    }

    const isColor = (strColor) => {
        var s = new Option().style;
        s.color = strColor;
        return s.color === strColor;
    }
    
    const changeColor = (colorText) => {
        let inputColor = colorText.toLowerCase()
        if(inputColor==="") {
            setMessage("You clicked without entering color.");
        } else {
            if(isColor(inputColor)) {
                setColor(inputColor);
            } else {
                setMessage(`You entered "${inputColor}". Please enter a valid color.`);
            }
        }
    }


    return (
        <div className="app">
            <div className="circle" style={{backgroundColor: color}}> </div>
            <div> Please enter color to change the color of the circle</div>
            <input type="text" ref={colorRef} />
            <button onClick={handleClick}> Click to change color </button>
            <div className="message"> {message} </div>
        </div>
    );
}

export default App