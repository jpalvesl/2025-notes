# Issues não finalizadas
```dataview
	TABLE 
	started_at, 
	tags,
	choice(done, "✅", "❌") AS Finalizada 
	FROM "synchro/issues"
	where done != true
```
# Issues finalizadas
```dataview
	TABLE 
	started_at, 
	tags,
	choice(done, "✅", "❌") AS Finalizada 
	FROM "synchro/issues"
	where done = true
```

