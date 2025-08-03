import { QueryDocumentSnapshot } from "firebase-admin/firestore";

/**
 * @param {QueryDocumentSnapshot} doc
 */
export async function processMatch(doc) {
  console.log(`New match ${doc.id}:`, doc.data());
}
