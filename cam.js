
(function refresh() {
	var 
	rte = 180000, // 3 Minute refresh rate
	ele = document.querySelectorAll( '[data-feature*="refresh"]' ),
	utc = new Date().getTime(),
	uri = function( u ) {
		return u.split( '?', 1 )[0];
	};
	
	for ( var i in ele ) {
		var m = ele[i];
		
		if ( typeof m !== 'object' ) {
			continue;
		}
		
		if ( m.hasAttribute( 'src' ) ) {
			m.setAttribute( 
				'src', 
				uri( m.getAttribute( 'src' ) ) + '?' + utc
			);
		}
		
		if ( m.hasAttribute( 'href' ) ) {
			m.setAttribute( 
				'href', 
				uri( m.getAttribute( 'href' ) ) + '?' + utc
			);
		}
	}
	
	setTimeout( refresh, rte );
})();

