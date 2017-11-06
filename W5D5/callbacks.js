window.setTimeout(function () {
  alert('HAMMER TIME!');
}, 5000);

function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is HAMMER TIME!`);
  });
}

const readline = require('readline');

const reader = readline.createInterface({


  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (firstAns) {
    console.log(`You replied ${firstAns}.`);
    reader.question('Would you like some biscuits?', function (secondAns) {
      console.log(`You replied ${secondAns}.`);

      const first = (firstAns === 'yes') ? 'do' : 'don\'t';
      const second = (secondAns === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}


function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();


Noodles.chase(Markov);

Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);
