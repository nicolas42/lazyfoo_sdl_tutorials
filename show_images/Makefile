CC = g++ -o $@ -Iinclude -framework SDL2 -framework SDL2_image -framework SDL2_mixer -framework SDL2_net -framework SDL2_ttf

all: show_images

clean: 
	rm first show_images

first:
	$(CC) $@.cpp

show_images:
	$(CC) $@.cpp

render_text:
	$(CC) $@.cpp
