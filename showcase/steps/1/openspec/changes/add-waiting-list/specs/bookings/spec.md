# Bookings changes

## MODIFIED Requirements

### Requirement: Members book a room

The system SHALL let a member book a room for a time slot in which the room has no other booking, and SHALL offer the waiting list when the room is taken.

#### Scenario: The room is free

- **WHEN** a member books a room for a slot without other bookings
- **THEN** the booking is confirmed and the slot shows the member's name

#### Scenario: The slot overlaps another booking

- **WHEN** a member books a room for a slot that overlaps a confirmed booking
- **THEN** the booking is refused, the overlapping booking is shown, and the member can join the waiting list of the slot

### Requirement: Members cancel bookings

The system SHALL let a member cancel a booking they made, until the booking starts. A cancelled slot SHALL go to its waiting list before it becomes free.

#### Scenario: Cancelling before the start

- **WHEN** a member cancels their booking an hour before it starts and nobody is waiting
- **THEN** the booking is removed and the slot is free again

#### Scenario: Cancelling a running booking

- **WHEN** a member tries to cancel a booking that has started
- **THEN** the cancellation is refused

#### Scenario: Someone is waiting for the slot

- **WHEN** a member cancels a booking of a slot that has a waiting list
- **THEN** the slot is offered to the first member on the list

## REMOVED Requirements

### Requirement: Taken rooms show the office contact

**Reason**: The waiting list replaces asking the office team for a taken room.

**Migration**: A member joins the waiting list from the refused booking.

## RENAMED Requirements

- FROM: `### Requirement: Members book a free room`
- TO: `### Requirement: Members book a room`
