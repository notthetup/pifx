#!/usr/bin/python

import pygame
import os

os.environ['SDL_AUDIODRIVER'] = 'alsa';
#os.environ['AUDIODEV'] = 'hw:1';
os.environ['AUDIODEV'] = 'hw:0,1';

pygame.mixer.init()
pygame.mixer.music.load("/usr/share/sounds/alsa/Front_Left.wav");


pygame.mixer.music.play()
while pygame.mixer.music.get_busy() == True:
    continue
