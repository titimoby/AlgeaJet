// variables
set direction = 1;
set jumping = false;
set font = game.createFont("emulogic", 12, game.color.WHITE);

// stage
set stage = game.createStage(0, -10);
set gameLayer = stage.createLayer();
set scoreLayer = stage.createLayer();
gameLayer.createRepeatedImage("PlanetCute/Sky");

scoreLayer
.createButton(font, "black", "debug", stage.getWidth() - 115, stage.getHeight() - 70)
.onTap ({ game.setDebug(!game.getDebug()); });
/*
set astro = gameLayer.createActorAnim("JetPak/astroWalkLeft", 4 ,1);
astro.typeDynamic().hitCircle(15);
astro.setFrameDuration(0.25);
astro.move(600,200);
astro.setXVelocity(-4);
*/
// floor
/*set x = 0;
set i = 0;
loop(200) {
	set ground = gameLayer.createActor("JetPak/ground");
	ground.move(x, 35);
	ground.typeStatic().hitSquare(75);
	x = x + ground.getWidth();
}
*/

set astro = gameLayer.createActorAnim("JetPak/astroWalkLeft", 4 ,1);
astro.move(200, 700);
astro.typeDynamic().hitSquare(0);
astro.stop();
astro.applyForceX(25);

// floor
set x = 0;
set i = 0;
loop(200) {	
	set ground = gameLayer.createActor("JetPak/ground");
	ground.move(x, 35);
	ground.typeStatic().hitSquare(0);
	x = x + ground.getWidth();
}

stage.onKey((ch) {
	if (ch == game.key.LEFT) {
		astro.setFriction(0).impulseX(-0.1).applyForceX(-50);
		direction = -1;
	}else if (ch == game.key.RIGHT) {
		astro.setFriction(0).impulseX(0.1).applyForceX(50);
		direction = 1;
	}else if (ch == game.key.UP) {
		if (!jumping) astro.applyForceY(0).impulse(0, 11);
		jumping = true;
	}else if (ch == game.key.SPACE) {
		
	}
});
