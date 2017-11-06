document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext('2d');

  ctx.fillStyle = 'red';
  ctx.fillRectv(0, 0, 100, 200);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = 'yellow';
  ctx.lineWidth = 4;
  ctx.stroke();
  ctx.fillStyle = 'green';
  ctx.fill();
});
