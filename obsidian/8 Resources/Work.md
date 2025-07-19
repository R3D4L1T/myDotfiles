---
tag: home
publish: false
banner: "![[space3.jpg]]"
banner_y: 0.470
---
# Work
---
```dataviewjs
let pages = dv.pages("#activity")
  .where(p => !p.file.path.includes("Templates"));

dv.table(
  ["📄 Archivo", "🎯 Activity", "🏗 Work Unit", "📌 progress", "📝 Task"],
  pages.map(p => [
    p.file.link,
    p.activityUnit,
    p.workUnit,
    p.progress,
    "<ul>"+
    p.file.tasks
      .filter(t => !t.completed)
      .map(t => `<li> ${t.text}</li>`)
      .join("") +
      "</ul>"
  ])
);
``` 