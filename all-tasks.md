# Todo
```dataview
TASK
FROM "daily-todo"
WHERE !completed
GROUP BY file.name
```
# Done
## Ultimos 7 dias
```dataview
TASK
FROM "daily-todo"
where completed
and (date("today") - date(file.name)) < dur(1 week)
```

## Restante
```dataview
LIST
FROM "daily-todo"
WHERE (date("today") - date(file.name)) >= dur(1 week)
```





