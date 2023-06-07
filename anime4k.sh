#!/bin/bash

file=$1
out=$2
shader_path=$HOME/.config/mpv/shaders

set -xe

ffmpeg -y -i $file -init_hw_device vulkan -vf format=rgba64le, --glsl-shaders="\
    ~/.config/mpv/shaders/Anime4K_Clamp_Highlights.glsl:\
    ~/.config/mpv/shaders/Anime4K_Restore_CNN_VL.glsl:\
    ~/.config/mpv/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:\
    ~/.config/mpv/shaders/Anime4K_AutoDownscalePre_x2.glsl:\
    ~/.config/mpv/shaders/Anime4K_AutoDownscalePre_x4.glsl:\
    ~/.config/mpv/shaders/Anime4K_Darken_HQ.glsl:\
    ~/.config/mpv/shaders/Anime4K_Upscale_CNN_x2_M.glsl" \
 format=yuv420p -vcodec libx264 -an \
  $out.mp4
