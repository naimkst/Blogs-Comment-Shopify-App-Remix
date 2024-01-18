/*
  Warnings:

  - Added the required column `title` to the `Comment` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Comment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "blogId" TEXT NOT NULL,
    "commentId" TEXT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "status" TEXT NOT NULL
);
INSERT INTO "new_Comment" ("blogId", "comment", "commentId", "email", "id", "name", "status") SELECT "blogId", "comment", "commentId", "email", "id", "name", "status" FROM "Comment";
DROP TABLE "Comment";
ALTER TABLE "new_Comment" RENAME TO "Comment";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
