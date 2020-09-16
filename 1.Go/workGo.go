package main

import "fmt"

type Person struct {
	age uint16
}

func exactTwice(people []Person) bool {
	for i:=0; i<len(people); i++{
		for j:=i+1; j<len(people); j++{
			if people[i].age * 2 == people[j].age || people[i].age == people[j].age * 2 {
				return true;
			}
		}
	}
	return false;
}

func atLeastTwice(people []Person) bool {
	for i:=0; i<len(people); i++{
		for j:=i+1; j<len(people); j++{
			if (people[i].age * 2 <= people[j].age) || (people[j].age * 2 <= people[i].age) {
				return true;
			}
		}
	}
	return false;
}

func main (){
	var people []Person
	person1 := Person{age:5}
	person2 := Person{age:9}
	person3 := Person{age:10}
	person4 := Person{age:12}
	person5 := Person{age:13}

	people = append(people, person1, person2, person3, person4, person5)

	var resultExact = exactTwice(person)
	fmt.Println(resultExact)
}

// package main
// import "fmt"

// const usixteenbitmax float64 = 65535
// const kmhMultiple float64 = 1.60934

// type car struct {
// 	gasPedal uint16
// 	brakePedal uint16
// 	steeringWheel int16
// 	topSpeedKmh float64
// }

// func (c car) kmh() float64 {
// 	c.topSpeedKmh = 500
// 	return float64(c.gasPedal) * (c.topSpeedKmh/usixteenbitmax)
// }

// func (c car) mph() float64 {
// 	return float64(c.gasPedal) * (c.topSpeedKmh/usixteenbitmax/kmhMultiple)
// }

// func (c *car) newTopSpead(newSpeed float64){
// 	c.topSpeedKmh = newSpeed
// }

// func main() {
// 	aCar := car{gasPedal:65000,
// 				brakePedal: 0,
// 				steeringWheel: 12531,
// 				topSpeedKmh: 225.0}

// 	fmt.Println(aCar.gasPedal)
// 	fmt.Println(aCar.kmh())
// 	fmt.Println(aCar.mph())
// 	aCar.newTopSpead(500)
// 	fmt.Println(aCar.kmh())
// 	fmt.Println(aCar.mph())
// }
