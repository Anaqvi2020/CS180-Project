
#region Draw Buttons & Background
//////////////////////////////////////////////////////////////////////////////

if ( screen_alpha > 0 ){
draw_set_color( c_black );
draw_set_alpha( screen_alpha );
draw_rectangle( 0,0, gwidth, gheight, false );
draw_set_alpha( 1 );
draw_set_color( c_white );
draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_set_font( fnt_small_bold ); //If you're using your own fonts, set them here.

	// Draw Buttons
	for( var i=0; i<bc; i++; ){
		draw_text_transformed_color( bx[i]-50,by[i],bstring[i],bsca[i],bsca[i],0,bcol[i],bcol[i],bcol[i],bcol[i],balpha[i] * screen_alpha );
	}
	
// draw player 1 controls
draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_text_ext(50, 50, "Player 1 Controls:\nWASD: Movement\nC: Light Attack\nV: Heavy Attack\nB: Guard\nN: Dash", 50, 350);
// draw player 2 controls
draw_text_ext(1050, 50, "Player 2 Controls:\nArrow Keys: Movement\n/ (Slash): Light Attack\n. (Period): Heavy Attack\n, (Comma): Guard\nM: Dash", 50, 350);
}


//////////////////////////////////////////////////////////////////////////////
#endregion