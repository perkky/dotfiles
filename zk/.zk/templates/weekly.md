---
Title: Week Starting {{sh (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) }}
EOW Check Complete: false
Tags:
  - #weekly
---
# {{sh (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) }}

## Navigation
### Daily
[Monday](journal/daily/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +0"))) '%Y/%Y-%m-%d'}})
[Tuesday](journal/daily/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +1"))) '%Y/%Y-%m-%d'}})
[Wednesday](journal/daily/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +2"))) '%Y/%Y-%m-%d'}})
[Thursday](journal/daily/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +3"))) '%Y/%Y-%m-%d'}})
[Friday](journal/daily/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +4"))) '%Y/%Y-%m-%d'}})

### Weekly
[Last Week ({{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " -7"))) '%Y/%Y-%m-%d'}})](journal/weekly/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " -7"))) '%Y/%Y-%m-%d'}})
[Next Week ({{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +7"))) '%Y/%Y-%m-%d'}})](journal/weekly/{{format-date (date (sh (prepend (prepend "./get_monday_of_week_simple.sh " (format-date now '%Y-%m-%d')) " +7"))) '%Y/%Y-%m-%d'}})

## Tasks

## Notes
