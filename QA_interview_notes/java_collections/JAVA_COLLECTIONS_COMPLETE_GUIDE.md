# Java Collections - Complete Guide 🎯

## Table of Contents
1. [What are Collections?](#what-are-collections)
2. [Collections Hierarchy](#collections-hierarchy)
3. [List vs Set vs Map](#list-vs-set-vs-map)
4. [Detailed Comparison Tables](#detailed-comparison-tables)
5. [Simple Examples](#simple-examples)
6. [When to Use What](#when-to-use-what)

---

## What are Collections? 🤔

**Simple Explanation:**
Think of Collections as different types of **containers/boxes** that store multiple items. Each container has different rules about:
- How items are stored (order matters or not)
- How many of same item you can store (duplicates allowed or not)
- How fast you can find items
- How items are organized

**Real-World Analogy:**
- **List** = A queue at a movie theater (order matters - first come, first served)
- **Set** = A group of unique people (no duplicates, no specific order)
- **Map** = A dictionary (word → meaning relationship)

---

## Collections Hierarchy 📊

```
Collection Interface (Top Level)
│
├── List (Ordered, Allows Duplicates)
│   ├── ArrayList
│   ├── LinkedList
│   └── Vector (Legacy)
│
├── Set (Unique, No Duplicates)
│   ├── HashSet
│   ├── TreeSet
│   └── LinkedHashSet
│
└── Queue (FIFO - First In First Out)
    ├── PriorityQueue
    └── Deque

Map Interface (Separate - Key-Value Pairs)
│
├── HashMap
├── TreeMap
├── LinkedHashMap
└── Hashtable (Legacy)
```

---

## List vs Set vs Map 🎯

### **LIST** - Ordered Collection with Duplicates ✅
```
Index:  0      1      2      3
      ["Apple", "Banana", "Apple", "Cherry"]
       ↑ Duplicates allowed
       ↑ Index-based access
```

### **SET** - Unique Collection, No Duplicates ✅
```
{"Apple", "Banana", "Cherry"}
 ↑ No duplicates allowed
 ↑ No specific order (generally)
```

### **MAP** - Key-Value Pairs ✅
```
{
  "Name" → "Venkatesh",
  "Age" → 25,
  "City" → "Bangalore"
}
↑ Key-Value relationships
↑ Each key is unique
```

---

## Detailed Comparison Tables 📋

### **Table 1: List Implementations Comparison**

| Feature | **ArrayList** | **LinkedList** | **Vector** |
|---------|---------------|----------------|-----------|
| **Data Structure** | Dynamic Array | Doubly Linked List | Dynamic Array (Legacy) |
| **Order** | Maintains insertion order | Maintains insertion order | Maintains insertion order |
| **Duplicates** | ✅ Allowed | ✅ Allowed | ✅ Allowed |
| **Access (get)** | ⚡ O(1) - Very Fast | ❌ O(n) - Slow | ⚡ O(1) - Very Fast |
| **Insert/Delete** | 🐢 O(n) - Slow | ⚡ O(1) - Very Fast | 🐢 O(n) - Slow |
| **Memory Usage** | 💾 Less (continuous) | 💾 More (nodes + pointers) | 💾 More |
| **Thread Safe** | ❌ No | ❌ No | ✅ Yes (Synchronized) |
| **Performance** | Best for random access | Best for add/remove | Outdated |
| **Use Case** | Most common choice | Frequent insertions/deletions | Avoid using |

### **Table 2: Set Implementations Comparison**

| Feature | **HashSet** | **TreeSet** | **LinkedHashSet** |
|---------|------------|-----------|------------------|
| **Data Structure** | Hash Table | Red-Black Tree | Hash Table + Linked List |
| **Order** | ❌ No order | ✅ Sorted order | ✅ Insertion order |
| **Duplicates** | ❌ Not allowed | ❌ Not allowed | ❌ Not allowed |
| **Search Speed** | ⚡ O(1) - Very Fast | 🐢 O(log n) - Good | ⚡ O(1) - Very Fast |
| **Insert/Delete** | ⚡ O(1) - Very Fast | 🐢 O(log n) - Good | ⚡ O(1) - Very Fast |
| **Memory Usage** | 💾 Less | 💾 Moderate | 💾 More |
| **Thread Safe** | ❌ No | ❌ No | ❌ No |
| **Sorting** | ❌ No | ✅ Automatic sorting | ❌ No |
| **Null Allowed** | ✅ Yes (1 null) | ❌ No | ✅ Yes (1 null) |
| **Use Case** | Unique items, fast access | Sorted unique items | Unique items + order |

### **Table 3: Map Implementations Comparison**

| Feature | **HashMap** | **TreeMap** | **LinkedHashMap** | **Hashtable** |
|---------|-----------|-----------|-----------------|-----------|
| **Data Structure** | Hash Table | Red-Black Tree | Hash Table + Linked List | Hash Table (Legacy) |
| **Order** | ❌ No specific order | ✅ Sorted by key | ✅ Insertion order | ❌ No order |
| **Key-Value Pairs** | ✅ Unique keys | ✅ Unique keys | ✅ Unique keys | ✅ Unique keys |
| **Duplicates** | ✅ Duplicate values OK | ✅ Duplicate values OK | ✅ Duplicate values OK | ✅ Duplicate values OK |
| **Search** | ⚡ O(1) - Very Fast | 🐢 O(log n) - Good | ⚡ O(1) - Very Fast | ⚡ O(1) - Very Fast |
| **Insert/Delete** | ⚡ O(1) - Very Fast | 🐢 O(log n) - Good | ⚡ O(1) - Very Fast | ⚡ O(1) - Very Fast |
| **Thread Safe** | ❌ No | ❌ No | ❌ No | ✅ Yes (Synchronized) |
| **Null Keys** | ✅ Yes (1 null key) | ❌ No | ✅ Yes (1 null key) | ❌ No |
| **Null Values** | ✅ Yes (multiple) | ✅ Yes (multiple) | ✅ Yes (multiple) | ❌ No |
| **Performance** | Best choice | Sorted needs | Insertion order needs | Avoid using |
| **Use Case** | Most common | Sorted data | Maintain order | Legacy code only |

### **Table 4: Quick Decision Matrix**

| **What You Need** | **Best Choice** | **Why?** |
|-----------------|----------------|---------|
| Store items in order + random access | **ArrayList** | Fast access, maintains order |
| Frequent insert/delete from middle | **LinkedList** | O(1) insertion/deletion |
| Unique items, fast lookup | **HashSet** | O(1) lookup, no duplicates |
| Unique items in sorted order | **TreeSet** | Automatic sorting |
| Key → Value relationships | **HashMap** | Fast, most common |
| Sorted Key → Value relationships | **TreeMap** | Sorted by key |
| Maintain Key → Value insertion order | **LinkedHashMap** | Order preserved |
| Queue behavior (FIFO) | **Queue/LinkedList** | FIFO principle |
| Priority-based items | **PriorityQueue** | Highest priority first |

---

## Simple Examples 💻

### **1. ArrayList - Simple Shopping List**

```java
import java.util.ArrayList;
import java.util.List;

public class ArrayListExample {
    public static void main(String[] args) {
        // Creating a shopping list (order matters)
        List<String> shoppingList = new ArrayList<>();
        
        // Adding items
        shoppingList.add("Milk");           // Index 0
        shoppingList.add("Bread");          // Index 1
        shoppingList.add("Eggs");           // Index 2
        shoppingList.add("Milk");           // Index 3 - Duplicate allowed!
        
        System.out.println("Shopping List: " + shoppingList);
        // Output: [Milk, Bread, Eggs, Milk]
        
        // Accessing by index
        System.out.println("First item: " + shoppingList.get(0));  // Milk
        System.out.println("Size: " + shoppingList.size());        // 4
        
        // Iterating
        for (String item : shoppingList) {
            System.out.println("- " + item);
        }
    }
}
```

**Real World Use:** Shopping lists, to-do lists, student enrollment

---

### **2. HashSet - Unique Colors**

```java
import java.util.HashSet;
import java.util.Set;

public class HashSetExample {
    public static void main(String[] args) {
        // Creating a set of unique colors
        Set<String> colors = new HashSet<>();
        
        // Adding colors
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Red");        // Duplicate - won't be added!
        
        System.out.println("Colors: " + colors);
        // Output: [Red, Blue, Green] or any order (HashSet has no order)
        
        System.out.println("Size: " + colors.size());  // 3 (not 4)
        
        // Check if exists
        System.out.println("Has Red? " + colors.contains("Red"));  // true
        
        // Remove
        colors.remove("Blue");
        System.out.println("After remove: " + colors);
    }
}
```

**Real World Use:** Unique user IDs, tags without duplicates, unique email addresses

---

### **3. TreeSet - Sorted Unique Marks**

```java
import java.util.Set;
import java.util.TreeSet;

public class TreeSetExample {
    public static void main(String[] args) {
        // Creating sorted set of student marks
        Set<Integer> marks = new TreeSet<>();
        
        // Adding marks (order doesn't matter during addition)
        marks.add(95);
        marks.add(78);
        marks.add(88);
        marks.add(78);  // Duplicate - won't be added!
        marks.add(82);
        
        System.out.println("Marks (Sorted): " + marks);
        // Output: [78, 82, 88, 95] - Automatically sorted!
        
        System.out.println("Highest mark: " + ((TreeSet<Integer>) marks).last());
        System.out.println("Lowest mark: " + ((TreeSet<Integer>) marks).first());
    }
}
```

**Real World Use:** Leaderboards, sorted ratings, ranking systems

---

### **4. HashMap - Student Records**

```java
import java.util.HashMap;
import java.util.Map;

public class HashMapExample {
    public static void main(String[] args) {
        // Creating a map of student ID → Student Name
        Map<Integer, String> students = new HashMap<>();
        
        // Adding key-value pairs
        students.put(101, "Arjun");      // Key 101 → Value "Arjun"
        students.put(102, "Priya");
        students.put(103, "Rohan");
        students.put(101, "Arjun Singh"); // Same key - value updated!
        
        System.out.println("All Students: " + students);
        // Output: {101=Arjun Singh, 102=Priya, 103=Rohan}
        
        // Get by key
        System.out.println("Student 102: " + students.get(102));  // Priya
        
        // Check if key exists
        System.out.println("Has 102? " + students.containsKey(102));  // true
        
        // Iterate through entries
        for (Map.Entry<Integer, String> entry : students.entrySet()) {
            System.out.println("ID: " + entry.getKey() + ", Name: " + entry.getValue());
        }
    }
}
```

**Real World Use:** Database records, phone directories, configuration settings

---

### **5. TreeMap - Sorted Dictionary**

```java
import java.util.Map;
import java.util.TreeMap;

public class TreeMapExample {
    public static void main(String[] args) {
        // Creating a sorted dictionary (Word → Definition)
        Map<String, String> dictionary = new TreeMap<>();
        
        // Adding entries
        dictionary.put("Zebra", "An African striped animal");
        dictionary.put("Apple", "A red fruit");
        dictionary.put("Mango", "A sweet tropical fruit");
        
        System.out.println("Dictionary: " + dictionary);
        // Output: {Apple=..., Mango=..., Zebra=...} - Sorted alphabetically!
        
        // Iterate (will be in sorted order)
        for (String word : dictionary.keySet()) {
            System.out.println(word + " → " + dictionary.get(word));
        }
    }
}
```

**Real World Use:** Sorted contact lists, alphabetically sorted configurations

---

### **6. LinkedHashSet - Insertion Order Unique Colors**

```java
import java.util.LinkedHashSet;
import java.util.Set;

public class LinkedHashSetExample {
    public static void main(String[] args) {
        // Creating a set that maintains insertion order
        Set<String> colors = new LinkedHashSet<>();
        
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Red");  // Duplicate - won't be added
        colors.add("Yellow");
        
        System.out.println("Colors: " + colors);
        // Output: [Red, Blue, Green, Yellow] - Insertion order maintained!
        
        System.out.println("Size: " + colors.size());  // 4
    }
}
```

**Real World Use:** Browser history (unique URLs in order), activity logs

---

### **7. LinkedHashMap - Insertion Order Key-Values**

```java
import java.util.LinkedHashMap;
import java.util.Map;

public class LinkedHashMapExample {
    public static void main(String[] args) {
        // Creating a map that maintains insertion order
        Map<String, Integer> ages = new LinkedHashMap<>();
        
        ages.put("Arjun", 25);
        ages.put("Priya", 23);
        ages.put("Rohan", 26);
        ages.put("Arjun", 26);  // Update - won't change insertion order
        
        System.out.println("Ages: " + ages);
        // Output: {Arjun=26, Priya=23, Rohan=26} - Insertion order maintained!
        
        for (Map.Entry<String, Integer> entry : ages.entrySet()) {
            System.out.println(entry.getKey() + " → " + entry.getValue());
        }
    }
}
```

**Real World Use:** LRU (Least Recently Used) caches, form submissions in order

---

## When to Use What? 🎯

### **Decision Tree**

```
START: I need to store multiple items

├─ YES: I need Order? (Index-based access)
│  └─ ArrayList ✅ (Most common for lists)
│
├─ YES: Frequent Add/Delete from middle?
│  └─ LinkedList ✅
│
├─ YES: Need UNIQUE items only (NO duplicates)?
│  │
│  ├─ YES: Need sorted?
│  │  └─ TreeSet ✅
│  │
│  ├─ YES: Need to maintain insertion order?
│  │  └─ LinkedHashSet ✅
│  │
│  └─ NO: Any order OK?
│     └─ HashSet ✅ (Fastest)
│
└─ YES: Need Key → Value relationships?
   │
   ├─ YES: Need sorted by key?
   │  └─ TreeMap ✅
   │
   ├─ YES: Need to maintain insertion order?
   │  └─ LinkedHashMap ✅
   │
   └─ NO: Any order OK?
      └─ HashMap ✅ (Most common for maps)
```

---

## Performance Cheat Sheet ⚡

### **Time Complexity Comparison**

| Operation | ArrayList | LinkedList | HashSet | TreeSet | HashMap | TreeMap |
|-----------|-----------|-----------|---------|---------|---------|---------|
| Get | O(1) | O(n) | O(1) | O(log n) | O(1) | O(log n) |
| Add | O(1)* | O(1) | O(1) | O(log n) | O(1) | O(log n) |
| Remove | O(n) | O(1) | O(1) | O(log n) | O(1) | O(log n) |
| Contains | O(n) | O(n) | O(1) | O(log n) | O(1) | O(log n) |

**Note:** * = O(n) if adding in middle

---

## Common Interview Questions 🎤

### **Q1: What's the difference between ArrayList and LinkedList?**
**A:** 
- ArrayList: Array-based, fast random access O(1), slow insertion/deletion in middle O(n)
- LinkedList: Linked nodes, slow random access O(n), fast insertion/deletion O(1)
- Use ArrayList for random access, LinkedList for frequent modifications

### **Q2: Why can't TreeSet/TreeMap have null?**
**A:** TreeSet/TreeMap use sorting (Comparable interface). When sorting, it tries to compare null with other objects, which throws NullPointerException. HashMap/HashSet don't sort, so they can handle null.

### **Q3: When would you use HashSet vs TreeSet?**
**A:**
- HashSet: When you need fastest access and don't care about order (O(1))
- TreeSet: When you need sorted unique items (O(log n)) or need range queries

### **Q4: What's the benefit of LinkedHashMap over HashMap?**
**A:** LinkedHashMap maintains insertion order, useful for implementing LRU caches or when order matters.

### **Q5: Why is HashMap preferred over Hashtable?**
**A:** Hashtable is legacy and synchronized (slow). HashMap is modern, unsynchronized (fast), and can be wrapped with Collections.synchronizedMap() if needed.

---

## Practice Exercise 🧠

```java
// Create a program that:
// 1. Takes 10 student names (allowing duplicates)
// 2. Stores in ArrayList (should have 10 items)
// 3. Creates a unique set from ArrayList (should have fewer if duplicates)
// 4. Creates a sorted set of names
// 5. Creates a map of student ID → name
// 6. Displays all in different formats

public class CollectionsPractice {
    public static void main(String[] args) {
        // TODO: Implement this
    }
}
```

---

## Summary Table 📊

| Collection | Best For | Speed | Order | Unique | Use Case |
|-----------|----------|-------|-------|--------|----------|
| ArrayList | Random access | O(1) Get | ✅ | ❌ | Most common list |
| LinkedList | Add/Delete | O(1) Insert | ✅ | ❌ | Queue operations |
| HashSet | Unique items fast | O(1) | ❌ | ✅ | Fast uniqueness |
| TreeSet | Sorted unique | O(log n) | ✅ Sorted | ✅ | Leaderboards |
| LinkedHashSet | Unique + order | O(1) | ✅ Insertion | ✅ | History tracking |
| HashMap | Key-value fast | O(1) | ❌ | ✅ Keys | Database records |
| TreeMap | Sorted key-value | O(log n) | ✅ Sorted | ✅ Keys | Sorted config |
| LinkedHashMap | KV + order | O(1) | ✅ Insertion | ✅ Keys | LRU Cache |

---

**Happy Learning! 🚀**

Remember: Choose your collection based on:
1. Do you need ORDER?
2. Do you need UNIQUE items?
3. Do you need fast SEARCH, INSERT, or DELETE?
4. Do you need KEY-VALUE pairs?

Answer these questions, and you'll always pick the right collection! ✨

