# Waiting list for taken rooms

## Why

When a room is taken, a member can only write to the office team and hope. Meanwhile cancelled and released rooms go to whoever happens to look first. A waiting list gives a freed room to the member who asked for it first.

## What Changes

- A member whose booking is refused can join the waiting list of that slot.
- A cancelled or released slot is offered to the first member on the list, before it becomes free.
- An offer that is not accepted within 15 minutes goes to the next member.
- The office contact is no longer shown on a refused booking.

## Capabilities

| Capability   | Change                                                                             |
| ------------ | ---------------------------------------------------------------------------------- |
| Waiting list | New: joining, offers and their expiry                                              |
| Bookings     | A refused booking offers the waiting list; a cancelled slot goes to the list first |
| Check-in     | A released slot goes to the list first                                             |

## Impact

The booking service, the check-in service and the notifications change. The office team no longer receives requests for taken rooms.

Read the [design](design.md), or go to the requirements of the [waiting list](specs/waiting-list/spec.md), the [bookings](specs/bookings/spec.md) and the [check-in](specs/check-in/spec.md).
