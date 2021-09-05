/* You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node. */

SELECT BST.N, CASE WHEN BST.P IS NULL THEN 'Root'
WHEN (BST.P IS NOT NULL AND BST.N NOT IN (SELECT DISTINCT BST.P FROM BST WHERE BST.P IS NOT NULL))
THEN 'Leaf'
ELSE 'Inner' END
FROM BST
ORDER BY BST.N
