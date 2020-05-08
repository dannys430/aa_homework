const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


function teaAndBiscuits() {

    reader.question('would you like some tea? ', (answer) => {
        console.log(`you replied: ${answer}`);
        
        reader.question('would you like biscuits? ', (answer) => {
            console.log(`you said: ${answer}`);
            reader.close();
        })

    })

}

teaAndBiscuits();