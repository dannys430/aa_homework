// function titleize(names, callback) {
//     let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
//     callback(titleized);

// };

// titleize(["Mary", "John", "Harry"], (names) => {
//     names.forEach(name => console.log(name));
// });


// elephant constructor
function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
}

Elephant.prototype.grow = function() {
    this.height += 12;
}

Elephant.prototype.addTrick = function(...tricks) {
    this.tricks.push(...tricks);
}

Elephant.prototype.play = function() {
    min = Math.ceil(0);
    max = Math.floor(this.tricks.length);
    rand_index = Math.floor(Math.random() * (max - min)) + min;

    console.log(this.name + " is " + this.tricks[rand_index]);    
}

Elephant.paradeHelper = function (elephants) {
    elephants.forEach(elephant => console.log(elephant.name + " is trotting by!"));
    // console.log(elephant.name + " is trotting by!");
}


let anna = new Elephant('Anna', 32, ['painting pictures', 'jumping', 'clapping back'])

// console.log(anna);

// console.log(anna.name);
// console.log(anna.height);
// console.log(anna.tricks);

// anna.addTrick('walking on water', 'eating dishes');

// anna.play();

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// console.log(herd);

// console.log(herd[0].play());

// Elephant.paradeHelper(ellie);

Elephant.paradeHelper(herd);

