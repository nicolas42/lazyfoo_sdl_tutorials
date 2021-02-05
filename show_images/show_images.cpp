#include <stdio.h>
#include "SDL2/SDL.h"
#include "SDL2/SDL_image.h"
#include "basic.h"

const int SCREEN_WIDTH = 1200;
const int SCREEN_HEIGHT = 800;


int main( int argc, char* argv[] )
{

	// string s = read_file("basic.h");
	// string c = copy_string(s);
	// strings lines = split_string(c, "\n\r");

	// for (size_t i = 0; i < min(20, lines.length); i++){
	// 	printf("{%s}\n", lines.data[i]);
	// }

	// // printf("%s", s.data);


	SDL_Init( SDL_INIT_VIDEO );
	IMG_Init( IMG_INIT_PNG & IMG_INIT_JPG );

	SDL_Window* window = SDL_CreateWindow( "Press any key :)", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN );
	SDL_Surface* window_surface = SDL_GetWindowSurface( window );



	const char *filenames[] = { 
		// "./-1504123321.jpg",
		// "./7bf7d813b5984086a56a414e6921a3d6_md.jpg",
		"./test.png",
		"./test.bmp"
	};
	int filenames_index = 0;
	const int filenames_length = 4;

	for (int i=0; i<filenames_length; i+=1) printf("%s\n", filenames[i]);



	SDL_Surface* image_surface;

	SDL_SetWindowTitle(window, filenames[filenames_index]);
	image_surface = IMG_Load( filenames[filenames_index] );
	// image_surface = SDL_ConvertSurface( image_surface, window_surface->format, 0 );
	SDL_BlitSurface( image_surface, NULL, window_surface, NULL );
	SDL_UpdateWindowSurface( window );
	bool needs_update = false;


	SDL_Event e;
	bool quit = false;
	while (!quit){
		while (SDL_PollEvent(&e)){
			if (e.type == SDL_QUIT){
				quit = true;
			}
			if (e.type == SDL_KEYDOWN){
				if (e.key.keysym.sym == SDLK_RIGHT) {
					filenames_index += 1;
					if ( filenames_index >= filenames_length ) filenames_index = 0;
					needs_update = true;

				} else if (e.key.keysym.sym == SDLK_LEFT) {
					filenames_index += -1;
					if ( filenames_index < 0 ) filenames_index = filenames_length-1;
					needs_update = true;
				}
				if (needs_update) {
					SDL_SetWindowTitle(window, filenames[filenames_index]);
					image_surface = IMG_Load( filenames[filenames_index] );
					// image_surface = SDL_ConvertSurface( image_surface, window_surface->format, 0 );
					SDL_BlitSurface( image_surface, NULL, window_surface, NULL );
					SDL_UpdateWindowSurface( window );
					needs_update = false;
				}
			}
			if (e.type == SDL_MOUSEBUTTONDOWN){
				SDL_SetWindowTitle(window, "You clicked the window!");
			}
		}
	}




	SDL_FreeSurface( image_surface );
	SDL_DestroyWindow( window );
	SDL_Quit();

	return 0;
}
