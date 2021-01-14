omg:
	# g++ -framework SDL2 01_hello_SDL/01_hello_SDL.cpp -o 1
	# g++ -framework SDL2 02_getting_an_image_on_the_screen/02_getting_an_image_on_the_screen.cpp -o 2
	# g++ -framework SDL2 03_event_driven_programming/03_event_driven_programming.cpp -o 3
	# g++ -framework SDL2 04_key_presses/04_key_presses.cpp -o 4
	# g++ -framework SDL2 05_optimized_surface_loading_and_soft_stretching/05_optimized_surface_loading_and_soft_stretching.cpp -o 5
	# g++ -framework SDL2 -framework SDL2_image 06_extension_libraries_and_loading_other_image_formats/06_extension_libraries_and_loading_other_image_formats.cpp -o 6
	# g++ -framework SDL2 -framework SDL2_image 07_texture_loading_and_rendering/07_texture_loading_and_rendering.cpp -o 7
	# g++ -framework SDL2 -framework SDL2_image 08_geometry_rendering/08_geometry_rendering.cpp -o 8
	# g++ -framework SDL2 -framework SDL2_image 15_rotation_and_flipping/15_rotation_and_flipping.cpp -o 15
	# g++ -framework SDL2 -framework SDL2_image -framework SDL2_ttf 16_true_type_fonts/16_true_type_fonts.cpp -o 16
	g++ -framework SDL2 -framework SDL2_image -framework SDL2_ttf 34_audio_recording/34_audio_recording.cpp -o 34

clean:
	rm 1 2 3 4 5 6 7 8 15 16