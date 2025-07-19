---
created: <% tp.date.now("YYYY-MM-DD") %>
activityUnit: <% tp.file.folder(true).split("/").pop() %>
workUnit: <% tp.file.folder(true).split("/")[tp.file.folder(true).split("/").length - 2] %>
progress: 55
tags: [activity]
---

```meta-bind
INPUT[progressBar(title(Progress), minValue(0), maxValue(100)): progress]
```


# <% tp.file.title %>

## 🎯 Objective
this is the objetive

---

> [!TASKS] ✅ Task
> - [ ] step 1
> - [ ] step 2

---

## 📝 Notes

- note note