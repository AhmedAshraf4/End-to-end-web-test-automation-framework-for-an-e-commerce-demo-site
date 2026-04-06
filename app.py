from flask import Flask, jsonify, request

app = Flask(__name__)

POSTS = [
    {"id": 1, "title": "Battery management system", "category": "automotive"},
    {"id": 2, "title": "Vehicle integration test", "category": "testing"},
]

@app.get("/health")
def health():
    return jsonify({"status": "ok"}), 200

@app.get("/posts")
def get_posts():
    return jsonify(POSTS), 200

@app.get("/posts/<int:post_id>")
def get_post(post_id):
    for post in POSTS:
        if post["id"] == post_id:
            return jsonify(post), 200
    return jsonify({"error": "Post not found"}), 404

@app.post("/posts")
def create_post():
    data = request.get_json(silent=True) or {}
    title = data.get("title")
    category = data.get("category")

    if not title or not category:
        return jsonify({"error": "title and category are required"}), 400

    new_post = {
        "id": len(POSTS) + 1,
        "title": title,
        "category": category,
    }
    POSTS.append(new_post)
    return jsonify(new_post), 201

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=False)