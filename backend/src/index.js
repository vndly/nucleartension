#!/usr/bin/env node

import { create } from "domain";
import { initializeApp, cert } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import fs from "fs";
import path from "path";

const serviceAccountPath = path.resolve("./secret/service-account.json");
const serviceAccount = JSON.parse(fs.readFileSync(serviceAccountPath, "utf8"));

initializeApp({
  credential: cert(serviceAccount),
});

const db = getFirestore();

async function run() {
  /*const docRef = db.collection("users").doc("alice");
  await docRef.set({ name: "Alice", age: 30 });
  console.log("Document written!");

  const snapshot = await docRef.get();
  console.log("Data:", snapshot.data());*/

  const colRef = db.collection("matches");
  colRef.onSnapshot((snapshot) => {
    snapshot.docChanges().forEach((change) => {
      if (change.type === "added") {
        console.log(`New match ${change.doc.id}:`, change.doc.data());
      }
    });
  });

  await createMap(db, "test", "./temp/test_map.json");
}

async function createMap(db, name, filePath) {
  const data = JSON.parse(fs.readFileSync(path.resolve(filePath), "utf8"));

  const colRef = db.collection("matches");
  await colRef.doc(name).set(data);
}

run().catch((err) => {
  console.error("Error running CLI:", err);
  process.exit(1);
});
