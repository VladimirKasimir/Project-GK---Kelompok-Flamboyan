size(640, 390);
background(255, 213, 0);
noStroke();

textSize(30);
fill(0);
text("Wolverhampton Wonderers F.C", 135, 320);

// Border 1 (Colour black)
fill(0);
beginShape();
vertex(265, 35);
vertex(370, 35);
vertex(440, 135); //kanan
vertex(377, 250); //bawah kanan
vertex(263, 250); //bawah kiri
vertex(195, 135); //kiri
endShape(CLOSE);

// Border 2 (Colour White)
fill(255);
beginShape();
vertex(275, 50);
vertex(360, 50);
vertex(420, 135); //kanan
vertex(370, 230); //bawah kanan
vertex(270, 230); //bawah kiri
vertex(215, 135); //kiri
endShape(CLOSE);

// Border 3 (Bg colour)
fill(255, 215, 0);
beginShape();
vertex(277, 55);
vertex(357, 55);
vertex(414, 135); //kanan
vertex(367, 225); //bawah kanan
vertex(273, 225); //bawah kiri
vertex(220, 135); //kiri
endShape(CLOSE);

// Gambar wolf
fill(0);
quad(270, 100, 365, 100, 330, 215, 305, 215); // Kepala
triangle(290, 60, 245, 140, 330, 185); // Telinga Kiri
triangle(345, 60, 305, 180, 390, 140); // Telinga Kanan

fill(255);
triangle(325, 145, 345, 125, 345, 145); // Mata Kanan
triangle(310, 145, 290, 125, 290, 145); // Mata Kiri
