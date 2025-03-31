# Issues não finalizadas
```dataview
	TABLE 
	started_at, 
	tags,
	choice(done, "✅", "❌") AS Finalizada 
	FROM "synchro/issues"
	where done != true
```
# Especs
```dataview
	TABLE 
	started_at, 
	tags,
	assign,
	choice(done, "✅", "❌") AS Finalizada 
	FROM "synchro/issues"
	where espec = true
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

