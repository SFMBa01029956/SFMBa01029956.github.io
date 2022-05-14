/*
==ANIMATEDSPRITE==
Authors: Salvador Federico Milanes Braniff, Tonatiuh Reyes Huerta
Desc: Program for animating a sprite. Code adapted from Zigurous

*/
using UnityEngine;

[RequireComponent(typeof(SpriteRenderer))]
public class AnimatedSprite : MonoBehaviour
{
    //Fields for sprite renderer, specific animation sprites list, anim. time
    public SpriteRenderer spriteRenderer { get; private set; }
    public Sprite[] sprites = new Sprite[0];
    public float animationTime = 0.5f;
    public int animationFrame { get; private set; }
    public bool loop = true;

    //Called on first frame
    private void Awake()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    //Called once as soon as object is created
    private void Start()
    {
        InvokeRepeating(nameof(Advance), animationTime, animationTime);
    }

    private void Advance()
    {
        if (!spriteRenderer.enabled) {
            return;
        }

        animationFrame++;

        if (animationFrame >= sprites.Length && loop) {
            animationFrame = 0;
        }

        if (animationFrame >= 0 && animationFrame < sprites.Length) {
            spriteRenderer.sprite = sprites[animationFrame];
        }
    }

    public void Restart()
    {
        animationFrame = -1;

        Advance();
    }

}
