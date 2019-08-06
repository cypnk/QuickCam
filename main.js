navigator.getUserMedia = navigator.getUserMedia || navigator.mozGetUserMedia;

window.onload = () => {
	const w		= 1920 / 3;
	const h		= 1080 / 3;
	const i		= document.createElement( 'img' );
	const c		= document.createElement( 'canvas' );
	const v		= document.createElement( 'video' );
	
	document.body.appendChild(i);
	
	c.width		= w;
	c.height	= h;
	c.style		= 'display: none';
	document.body.appendChild( c );
	
	const x		= c.getContext( '2d' );
	
	v.width		= w;
	v.height	= h;
	v.style		= 'display: none';
	document.body.appendChild( v );
	
	navigator.getUserMedia( {video: true}, s => {
		v.srcObject	= s;
		v.play();
		l();
	}, () => {} );
	
	const l = () => {
		x.drawImage( v, 0, 0, c.width, c.height );
		d();
		i.setAttribute( 'src', c.toDataURL( 'image/png' ) );
		setTimeout( l, 1000 );
	};
	
	const d = () => {
		const px = 10;
		const py = c.height - 10;
		const dt = ( new Date().toGMTString() ) + ' / yourcustomtext';
		
		x.font		= "normal 12px Courier";
		x.strokeStyle	= "black";
		x.lineWidth	= 1;
		x.strokeText( dt, px, py );
		
		x.fillStyle	= "orange";
		x.fillText( dt, px, py );
	};
};



