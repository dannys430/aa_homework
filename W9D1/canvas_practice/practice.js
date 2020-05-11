document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    const ctx = canvas.getContext('2d');

    //////////////////////

    // INTERIOR
    // horiz line left of half circle
    ctx.beginPath();
    ctx.moveTo(40, 108);
    
    // half circle
    ctx.lineWidth = 4;
    ctx.arc(120, 120, 40, 3.45, 6);
    ctx.stroke();
    
    // horiz line right of half circle
    ctx.beginPath();
    ctx.lineTo(200, 108);
    ctx.lineTo(157, 108);
    ctx.stroke();
    
    // left-bottom horiz line
    ctx.beginPath();
    ctx.lineTo(40, 148);
    ctx.lineTo(90, 148);
    ctx.stroke();

    // right-bottom horiz line
    ctx.beginPath();
    ctx.lineTo(150, 148);
    ctx.lineTo(200, 148);
    ctx.stroke();

    //////////////////////

    // BORDER
    // border elipse
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.ellipse(120, 113.5, 46, 41.5, Math.PI / 1, 6.61, 2.82);
    ctx.stroke();

    // border lines
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.lineTo(77, 100.5);
    ctx.lineTo(40, 100.5);
    ctx.lineTo(40, 156);
    ctx.lineTo(200, 156);
    ctx.lineTo(200, 100.5);
    ctx.lineTo(163, 100.5);
    ctx.stroke();

    //////////////////////
    
    // 'AHMAD TEA'
    ctx.lineWidth = 1.5;
    ctx.font = "25px Times";
    ctx.fillStyle = 'navy';
    ctx.strokeText("AHMAD TEA", 45, 137);
    // ctx.strokeText("AHMAD TEA", 43, 138);

    // 'LONDON'
    ctx.lineWidth = .9;
    ctx.font = "7px Arial";
    ctx.fillStyle = 'navy';
    ctx.strokeText("L  O  N  D  O  N", 95.5, 150);


});


