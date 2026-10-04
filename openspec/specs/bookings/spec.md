# Bookings

## Purpose

Let members reserve a meeting room for a time slot and rely on the room being theirs.

## Requirements

### Requirement: Members book a free room

The system SHALL let a member book a room for a time slot in which the room has no other booking.

#### Scenario: The room is free

- **WHEN** a member books a room for a slot without other bookings
- **THEN** the booking is confirmed and the slot shows the member's name

#### Scenario: The slot overlaps another booking

- **WHEN** a member books a room for a slot that overlaps a confirmed booking
- **THEN** the booking is refused and the overlapping booking is shown

### Requirement: Bookings last at most four hours

The system SHALL refuse a booking that lasts longer than four hours.

#### Scenario: A five-hour booking

- **WHEN** a member books a room from 09:00 to 14:00
- **THEN** the booking is refused and the four-hour limit is stated

### Requirement: Bookings are made at most 30 days ahead

The system SHALL refuse a booking that starts more than 30 days from today.

#### Scenario: A booking for next quarter

- **WHEN** a member books a room for a day that is 45 days away
- **THEN** the booking is refused and the last day that can be booked is stated

### Requirement: Members cancel their own bookings

The system SHALL let a member cancel a booking they made, until the booking starts.

#### Scenario: Cancelling before the start

- **WHEN** a member cancels their booking an hour before it starts
- **THEN** the booking is removed and the slot is free again

#### Scenario: Cancelling a running booking

- **WHEN** a member tries to cancel a booking that has started
- **THEN** the cancellation is refused

### Requirement: Taken rooms show the office contact

The system SHALL show the e-mail address of the office team when a booking is refused because the room is taken.

#### Scenario: A refused booking

- **WHEN** a booking is refused because the slot overlaps another booking
- **THEN** the office team's e-mail address is shown, with a note to ask there for the room
