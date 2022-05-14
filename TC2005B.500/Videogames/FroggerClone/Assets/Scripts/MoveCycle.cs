/*
==MOVECYCLE==
Authors: Salvador Federico Milanes Braniff, Tonatiuh Reyes Huerta
Desc: Program for controlling objects on the environment and looping them.
To avoid resource waste, object instances are transformed back to their original position instead of being destroyed and reinstanced.
*/
using UnityEngine;

public class MoveCycle : MonoBehaviour {
    //Fields for direction, speed and size(length of obj)
    public Vector2 direction = Vector2.right;
    public float speed = 1f;
    public int size = 1;

    private Vector3 leftEdge;
    private Vector3 rightEdge;

    private void Start() {
        //Transform Camera's point of view limits into world bounds for respawn positions.
        leftEdge = Camera.main.ViewportToWorldPoint(Vector3.zero);
        rightEdge = Camera.main.ViewportToWorldPoint(Vector3.right);
    }

    private void Update()
    {
        // Check if the object is past the right edge of the screen
        if (direction.x > 0 && (transform.position.x - size) > rightEdge.x) {
            transform.position = new Vector3(leftEdge.x - size, transform.position.y, transform.position.z);
        }
        // Check if the object is past the left edge of the screen
        else if (direction.x < 0 && (transform.position.x + size) < leftEdge.x) {
            transform.position = new Vector3(rightEdge.x + size, transform.position.y, transform.position.z);
        }
        // Move the object
        else {
            transform.Translate(direction * speed * Time.deltaTime);
        }
    }

}