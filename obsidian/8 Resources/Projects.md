---
tag: home
publish: false
banner: "![[space3.jpg]]"
banner_y: 0.470
---
# Projects
---
```dataview
TABLE title, startDate, dueDate, progress, priority
FROM #project 
WHERE !contains(file.path, "Templates")
```


# Task Project
```dataviewjs

let pages = dv.pages("#project").where(p => !p.file.path.includes("Templates") );

dv.table(["Project", "Tasks"],
  pages.map(p => [
    p.file.link,
    p.file.tasks
      .filter(t => !t.completed)
      .map(t => t.text)
      .join("<br>")
  ])
);
``` 