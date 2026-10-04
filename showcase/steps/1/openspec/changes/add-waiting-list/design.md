# Design: waiting list

## Approach

Each slot of a room has its own list, ordered by the time of joining. Cancelling and releasing a booking both end in the same step: when the slot has a list, the slot is held and offered to the first member; otherwise it becomes free.

## Decisions

- **One offer at a time.** Offering the slot to everyone on the list would turn it into a race, which is what the list replaces.
- **An offer holds the slot for 15 minutes.** A released room has already lost ten minutes, so a long wait would leave little of the slot.
- **The office contact is removed.** With a list, a request by e-mail would let a member jump the queue.

## Open questions

- Should a member be able to wait for any room of a size instead of one room? Not in this change.
