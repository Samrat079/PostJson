# PostJson 📱

<img width="128" height="114" alt="Logo_128" src="https://github.com/user-attachments/assets/4f893f9e-f6fb-45c9-9286-f81438521257" />

---
## 📖 Overview

**PostJson** is a Flutter mobile application that demonstrates how to work with **dummy JSON data** in a structured and efficient way.

The app simulates a simple content platform where users can:

* Log in
* View posts
* Read comments
* Post comments

It is built as a learning project to showcase **JSON parsing, model-based architecture, and cross-platform Flutter development**.

---

## ✨ Features

* 🔐 Simple Login UI
* 📝 Posts rendering from JSON
* 💬 Comments linked to posts
* ⚡ Efficient data handling using combined models
* 📱 Runs on **Android & iOS**

---

## 🧠 Architecture

The app uses a **model-driven approach** where data is structured into separate entities and then optimized using a combined model.

### 🧩 Core Models

* `User`
* `Post`
* `Comment`
* `UserPost` (combined model)

---

### 🔗 Model Relationship (Diagram 1)

```
User        Post        Comment
 |            |             |
 |            |             |
 +------------+-------------+
              |
              v
         [ UserPost ]
      (Merged Model)
```

**UserPost** combines user + post data into a single structure.
This avoids repeatedly fetching or mapping data during runtime.

---

### 🔄 Data Flow (Diagram 2)

```
Dummy JSON
    |
    v
Services (Parsing Layer)
    |
    v
Models (User, Post, Comment)
    |
    v
UserPost (Optimized Model)
    |
    v
UI (Screens & Widgets)
```

---

### ⚡ Optimization Strategy

Instead of making multiple calls like:

```
Posts → Fetch User (per post) ❌
```

The app merges data once:

```
Fetch → Combine → Reuse Everywhere ✅
```

This results in:

* Fewer data operations
* Cleaner UI logic
* Better performance

---

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* Dummy / Local JSON data

---

## 🚀 Getting Started

### Installation

```bash
git clone https://github.com/Samrat079/PostJson.git
cd PostJson
flutter pub get
flutter run
```

## 📦 Releases

All builds are available in the **Releases** section:

* 📥 Android APKs
* 🍎 iOS builds (if provided)

👉 Check them directly on GitHub under **Releases**

---

## 📸 Screenshots


---

## 🧪 Try It Yourself

The best way to understand this project is to **explore it hands-on**:

* Run the app
* Inspect the models
* Modify the JSON
* See how the UI reacts

Clone it, break it, improve it — that’s the goal 🚀

---

## 🤝 Contributing

Feel free to fork the repo and submit pull requests.

---

## 📄 License

This project is open-source and available under the MIT License.

