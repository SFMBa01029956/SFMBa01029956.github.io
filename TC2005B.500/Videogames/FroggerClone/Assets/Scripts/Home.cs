/*
==HOME==
Author: Salvador Federico Milanes Braniff
Desc: Program for managing a home: check if a home is occupied, render frog in home, empty homes on restart.
*/
using UnityEngine;

[RequireComponent(typeof(BoxCollider2D))]
public class Home : MonoBehaviour
{
    //Field for frog obj.
    public GameObject frog;
    private BoxCollider2D boxCollider;

    private void Awake()
    {
        boxCollider = GetComponent<BoxCollider2D>();
    }

    //On activating frog inside home
    private void OnEnable()
    {
        frog.SetActive(true);
        boxCollider.enabled = false;
    }

    //On deactivating frog inside home
    private void OnDisable()
    {
        frog.SetActive(false);
        boxCollider.enabled = true;
    }

    //On frogger arrival to a home
    private void OnTriggerEnter2D(Collider2D other)
    {
        //Check if home is available
        if (!enabled && other.gameObject.CompareTag("Player"))
        {
            enabled = true;
            FindObjectOfType<GameManager>().HomeOccupied();
        }
    }

}
