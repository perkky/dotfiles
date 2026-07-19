---
Title: {{format-date now '%A %Y-%m-%d'}}
EOD Check Complete: false
Tags:
  - #daily
---

# {{format-date now '%Y-%m-%d'}}

## Navigation
[This Week](journal/weekly/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +0"))) '%Y/%Y-%m-%d'}})
[ Yesterday ({{format-date (date "yesterday") '%A'}}) ](journal/daily/{{format-date (date "yesterday") '%Y/%Y-%m-%d'}}) <-> [ Tomorrow ({{format-date (date "yesterday") '%A'}})](journal/daily/{{format-date (date "tomorrow") '%Y/%Y-%m-%d'}})

## Tasks

## Notes
