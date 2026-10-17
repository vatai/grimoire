#!/usr/bin/env python3
"""Generate a Catppuccin Mocha mesh-gradient wallpaper."""
import random
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

WIDTH, HEIGHT = 2880, 1800
BASE = (30, 30, 46)
CRUST = (17, 17, 27)
BLOBS = [
    ((203, 166, 247), (0.15, 0.25), 0.55),  # mauve
    ((137, 180, 250), (0.80, 0.20), 0.50),  # blue
    ((148, 226, 213), (0.70, 0.85), 0.45),  # teal
    ((245, 194, 231), (0.25, 0.80), 0.40),  # pink
    ((250, 179, 135), (0.50, 0.50), 0.25),  # peach
]


def draw_blob(canvas, color, center, radius_ratio):
    cx, cy = center[0] * canvas.width, center[1] * canvas.height
    radius = radius_ratio * canvas.width / 2
    layer = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    ImageDraw.Draw(layer).ellipse(
        (cx - radius, cy - radius, cx + radius, cy + radius), fill=color + (110,)
    )
    canvas.alpha_composite(layer)


def vertical_vignette(width, height):
    rows = np.linspace(0.0, 1.0, height)[:, None]
    return np.repeat(rows, width, axis=1)


def add_grain(array, amount=4.0):
    rng = np.random.default_rng(7)
    noise = rng.normal(0.0, amount, array.shape[:2])[:, :, None]
    return np.clip(array + noise, 0, 255)


def render(output_path):
    small = Image.new("RGBA", (WIDTH // 8, HEIGHT // 8), BASE + (255,))
    for color, center, radius in BLOBS:
        draw_blob(small, color, center, radius)
    blurred = small.filter(ImageFilter.GaussianBlur(small.width // 7))
    big = np.asarray(blurred.resize((WIDTH, HEIGHT), Image.LANCZOS).convert("RGB"), dtype=float)
    vignette = vertical_vignette(WIDTH, HEIGHT)[:, :, None]
    big = big * (1 - 0.35 * vignette) + np.array(CRUST) * 0.35 * vignette
    Image.fromarray(add_grain(big).astype(np.uint8)).save(output_path, quality=92)


if __name__ == "__main__":
    render(sys.argv[1] if len(sys.argv) > 1 else "wallpaper.jpg")
