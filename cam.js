
(function refresh() {
	var 
	rte = 180000, // 3 Minute refresh rate
	img = document.querySelectorAll( '[data-feature*="refresh"]' ),
	utc = new Date().getTime(),
	uri = function( u ) {
		return u.split( '?', 1 )[0];
	};
	
	for ( var i in img ) {
		var m = img[i];
		
		if ( typeof m !== 'object' ) {
			continue;
		}
		
		m.setAttribute( 
			'src', 
			uri( m.getAttribute( 'src' ) ) + '?' + utc
		);
	}
	
	setTimeout( refresh, rte );
})();

