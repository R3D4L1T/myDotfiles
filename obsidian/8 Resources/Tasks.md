---
tag: home
publish: false
banner: "![[space3.jpg]]"
banner_y: 0.470
---
# Tasks
---
```dataview
TABLE created, status, priority, category
FROM #task 
WHERE !contains(file.path, "Templates")
SORT created DESC
```


# Events
```dataview
TABLE eventDateTime, duration, location
FROM #event 
WHERE !contains(file.path, "Templates")
WHERE eventDateTime >= date(now)
SORT eventDate ASC
```
