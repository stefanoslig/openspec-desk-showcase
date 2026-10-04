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

The system SHALL refuse a booking that starts more than 30 days from today, unless it belongs to a series. A series SHALL start within 30 days and MAY run for twelve weeks from its first booking.

#### Scenario: A booking for next quarter

- **WHEN** a member books a single slot for a day that is 45 days away
- **THEN** the booking is refused and the last day that can be booked is stated

#### Scenario: A series that runs past 30 days

- **WHEN** a member books a weekly series that starts next week and runs for twelve weeks
- **THEN** all twelve bookings are accepted

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

### Requirement: Members book a weekly series

The system SHALL let a member book a room for the same slot every week, for up to twelve weeks, as one series.

#### Scenario: Every week is free

- **WHEN** a member books a room on Mondays from 10:00 to 11:00 for eight weeks, and the room is free in each of those slots
- **THEN** eight bookings are confirmed as one series

#### Scenario: One week is taken

- **WHEN** the room is taken in one of the weeks
- **THEN** the other weeks are booked and the member is told which week was skipped

### Requirement: A series is cancelled whole or one booking at a time

The system SHALL let the member cancel one booking of a series, or all of its bookings that have not started.

#### Scenario: Cancelling one week

- **WHEN** the member cancels the booking of one week
- **THEN** that booking is removed and the other bookings of the series stay

#### Scenario: Cancelling the series

- **WHEN** the member cancels the series after its third week
- **THEN** the bookings of the remaining weeks are removed and the past ones stay in the history
