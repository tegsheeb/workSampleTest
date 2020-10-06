package main

import (
	"fmt"
)

type Person struct {
	age uint16
}

/*
// Time Complexity: O(n^2)
func exactTwice(people []Person) bool {
	for i := range people {
		for j := range people {
			if people[i].age*2 == people[j].age || people[i].age == people[j].age*2 {
				return true
			}
		}
	}
	return false
}
*/

/*
// Time Complexity: O(n)
func exactTwice(people []Person) bool {
	ages := make(map[uint16]bool)

	for _, person := range people {
		ages[person.age] = true
	}

	for _, person := range people {
		if _, ok := ages[person.age*2]; ok {
			return true
		}
	}
	return false
}
*/

/* exactTwice func with the following constraint: 
	* Age is an integer with values that range from 0 to 50
	* you may only use variables of numeric types (no array/slice/map)
	* must have linear time complexity with just a single loop
	* you may not use addition, subtraction, multiplication, division or modulo operators
	* the function may not consist of more than 15 lines of code
	* the function may not call other functions
*/

/*
// Version 1: bitwise operation, single loop, O(n) time complexity with 12 lines
func exactTwice(people []Person) bool {
	original := people[0].age 
	leftShift := people[0].age << 1
	rightShift := people[0].age >> 1

	for i := 1; i < len(people); i++{
		original ^= people[i].age
		leftShift ^= (people[i].age << 1)
		rightShift ^= (people[i].age >> 1)
	}
	return (original & (leftShift ^ rightShift)) == 0
}
*/

// Version 2: bitwise operation, O(n) time complexity with 17 lines
func exactTwice(people []Person) bool {
	for age := 0; age <= 25; age++ {
		twiceAge := age << 1
		foundAge := false
		foundTwiceAge := false
		for _, Person := range people {
			if Person.age == uint16(age) {
				foundAge = true
			} else if Person.age == uint16(twiceAge) {
				foundTwiceAge = true
			}
		}
		if foundAge && foundTwiceAge {
			return true
		}
	}
	return false
}

/*
// Time Complexity: O(n^2)
func atLeastTwice(people []Person) bool {
	for i := range people {
		for j := range people {
			if (people[i].age*2 <= people[j].age) || (people[j].age*2 <= people[i].age) {
				return true
			}
		}
	}
	return false
}
*/

// Time Complexity: O(n)
func atLeastTwice(people []Person) bool {
	if len(people) == 0 {
		return false
	}

	minAge := people[0].age
	maxAge := people[0].age

	for _, person := range people {
		if person.age < minAge {
			minAge = person.age
		}

		if maxAge < person.age {
			maxAge = person.age
		}
	}

	return minAge*2 <= maxAge
}

func main() {
	var peopleOne, peopleTwo ,peopleThree []Person
	person1 := Person{age: 9}
	person2 := Person{age: 19}
	person3 := Person{age: 0}
	person4 := Person{age: 12}
	person5 := Person{age: 25}
	person6 := Person{age: 17}
	person7 := Person{age: 50}

	peopleOne = append(peopleOne, person1, person2, person3, person4, person5, person6, person7)
	peopleTwo = append(peopleTwo, person1, person2, person3)

	fmt.Println(exactTwice(peopleOne))
	fmt.Println(exactTwice(peopleTwo))
	fmt.Println(atLeastTwice(peopleOne))
	fmt.Println(atLeastTwice(peopleTwo))
	fmt.Println(atLeastTwice(peopleThree))
	fmt.Println(atLeastTwice(peopleThree))
}
