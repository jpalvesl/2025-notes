# Todo
```dataview
TASK
FROM "daily-todo"
WHERE !completed
GROUP BY file.name
```
# Done
```dataview
TASK
FROM "daily-todo"
where completed
```

## Restantes
```dataview
LIST
FROM "daily-todo"
WHERE (date("today") - date(file.name)) >= dur(1 week)
```




