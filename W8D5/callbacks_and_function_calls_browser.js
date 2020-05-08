// passing in hTime as a callback function
window.setTimeout(hTime, 5000);

// defining the hTime function
function hTime() {
    alert('HAMMERTIME');
}


//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////


function hammerTime(time) {
    window.setTimeout(hTimeAlert, time);

    function hTimeAlert() {                 
        alert(`${time} is hammertime!`);  // this hTimeAlert callback function has 'closed over' the 'time' variable.
    }
}



