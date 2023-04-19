class Person {
  String name;
  int age;

  Person(this.name, this.age);

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      json['name'],
      json['age'],
    );
  }
}

List<Map<String, dynamic>> peopleData = [
  {
    "name": "John",
    "age": 30,
  },
  {
    "name": "Jane",
    "age": 25,
  },
];

void main(){
  List<Person> people = peopleData.map((data) => Person.fromJson(data)).toList();

  print(people[0].name);

}
