# Check-in changes

## ADDED Requirements

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
