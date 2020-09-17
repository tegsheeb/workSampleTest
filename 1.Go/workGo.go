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
	var peopleOne, peopleTwo, peopleThree []Person
	person1 := Person{age: 5}
	person2 := Person{age: 9}
	person3 := Person{age: 11}
	person4 := Person{age: 12}
	person5 := Person{age: 10}


	peopleOne = append(peopleOne, person1, person2, person3, person4, person5)
	peopleTwo = append(peopleTwo, person3, person4, person5)

	fmt.Println(exactTwice(peopleOne))
	fmt.Println(exactTwice(peopleTwo))
	fmt.Println(atLeastTwice(peopleOne))
	fmt.Println(atLeastTwice(peopleTwo))
	fmt.Println(atLeastTwice(peopleThree))
	fmt.Println(atLeastTwice(peopleThree))
}
