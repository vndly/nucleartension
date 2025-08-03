#!/usr/bin/env node

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

  colRef.doc("test").set({
    id: "test",
    width: 100,
    height: 100,
    regions: [
      {
        id: "6",
        slots: 10,
        vertices: [
          [-38.02, -33.51],
          [-19.4, -33.51],
          [-9.63, -16.55],
          [-19.12, -0.04],
          [-38.37, 0.0],
          [-47.89, -16.64],
        ],
      },
      {
        id: "5",
        slots: 10,
        vertices: [
          [-37.49, 0.27],
          [-18.87, 0.27],
          [-9.1, 17.23],
          [-18.59, 33.73],
          [-37.84, 33.78],
          [-47.36, 17.14],
        ],
      },
      {
        id: "4",
        slots: 10,
        vertices: [
          [-9.1, 17.23],
          [9.51, 17.23],
          [19.28, 34.19],
          [9.79, 50.69],
          [-9.45, 50.74],
          [-18.97, 34.1],
        ],
      },
      {
        id: "3",
        slots: 10,
        vertices: [
          [19.38, 0.36],
          [38.0, 0.36],
          [47.77, 17.32],
          [38.28, 33.82],
          [19.03, 33.87],
          [9.51, 17.23],
        ],
      },
      {
        id: "2",
        slots: 10,
        vertices: [
          [19.1, -33.1],
          [37.72, -33.1],
          [47.49, -16.14],
          [38.0, 0.36],
          [18.75, 0.41],
          [9.23, -16.23],
        ],
      },
      {
        id: "1",
        slots: 10,
        vertices: [
          [-9.28, -50.06],
          [9.33, -50.06],
          [19.1, -33.1],
          [9.61, -16.6],
          [-9.63, -16.55],
          [-19.15, -33.19],
        ],
      },
      {
        id: "0",
        slots: 10,
        vertices: [
          [-9.63, -16.55],
          [8.98, -16.55],
          [18.75, 0.41],
          [9.26, 16.91],
          [-9.98, 16.96],
          [-19.5, 0.32],
        ],
      },
    ],
  });
}

run().catch((err) => {
  console.error("Error running CLI:", err);
  process.exit(1);
});
