# Bookings changes

## ADDED Requirements

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

## MODIFIED Requirements

### Requirement: Bookings are made at most 30 days ahead

The system SHALL refuse a booking that starts more than 30 days from today, unless it belongs to a series. A series SHALL start within 30 days and MAY run for twelve weeks from its first booking.

#### Scenario: A booking for next quarter

- **WHEN** a member books a single slot for a day that is 45 days away
- **THEN** the booking is refused and the last day that can be booked is stated

#### Scenario: A series that runs past 30 days

- **WHEN** a member books a weekly series that starts next week and runs for twelve weeks
- **THEN** all twelve bookings are accepted
