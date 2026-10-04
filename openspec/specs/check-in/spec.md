# Check-in

## Purpose

Free the rooms that nobody shows up for, so that a booked room is a used room.

## Requirements

### Requirement: Members check in at the room

The system SHALL let the member who booked a room check in on the room's panel, from five minutes before the booking starts.

#### Scenario: Checking in on time

- **WHEN** the member taps "Check in" on the panel two minutes before the start
- **THEN** the booking is marked as checked in

#### Scenario: Someone else tries to check in

- **WHEN** a member who did not make the booking taps "Check in"
- **THEN** the check-in is refused

### Requirement: Unattended rooms are released

The system SHALL release a booking that is not checked in ten minutes after its start.

#### Scenario: Nobody checks in

- **WHEN** ten minutes pass after the start without a check-in
- **THEN** the booking is removed and the room is free for the rest of the slot

### Requirement: The member is told about a release

The system SHALL notify the member who booked when their booking is released.

#### Scenario: A released booking

- **WHEN** a booking is released
- **THEN** the member receives a message that names the room and the slot
