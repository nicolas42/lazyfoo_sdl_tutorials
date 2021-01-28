// https://gist.github.com/cdave1/10563386
#include "SDL.h"
#include "SDL_mixer.h"

// static const char *MY_COOL_MP3 = "out.mp3"

int main(int argc, char **argv) {
    
    printf("usage: play_mp3 <filename>\n");
    static const char *MY_COOL_MP3 = argv[1];

    int result = 0;
    int flags = MIX_INIT_MP3;

    if (SDL_Init(SDL_INIT_AUDIO) < 0) {
        printf("Failed to init SDL\n");
        exit(1);
    }

    if (flags != (result = Mix_Init(flags))) {
        printf("Could not initialize mixer (result: %d).\n", result);
        printf("Mix_Init: %s\n", Mix_GetError());
        exit(1);
    }

    Mix_OpenAudio(22050, AUDIO_S16SYS, 2, 640);
    Mix_Music *music = Mix_LoadMUS(MY_COOL_MP3);
    Mix_PlayMusic(music, 1);

    // while (!SDL_QuitRequested()) {
    //     SDL_Delay(250);
    // }

    SDL_Event e;
    bool quit = false;
    while (!quit){
        while (SDL_PollEvent(&e)){
            if (e.type == SDL_QUIT){
                quit = true;
            }
            if (e.type == SDL_KEYDOWN){
                quit = true;
            }
            if (e.type == SDL_MOUSEBUTTONDOWN){
                quit = true;
            }
        }
    }

    Mix_FreeMusic(music);
    SDL_Quit();
    return 0;
}
