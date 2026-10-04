# Design: recurring bookings

## Approach

A series is a set of ordinary bookings that share a series id. Check-in, release and the calendar keep working on single bookings and need to know nothing about series.

## Decisions

- **A taken week is skipped, the series is not refused.** A series that fails on one clash would send members back to booking week by week. The confirmation lists the skipped week.
- **Twelve weeks at most.** Long enough for a quarter, short enough that a meeting that stopped happening does not block a room for a year.
- **The 30-day limit applies to the first booking only.** Otherwise no series could be longer than four weeks.

## Open questions

- Should a series be cancelled when it is released three weeks in a row? Not in this change.
