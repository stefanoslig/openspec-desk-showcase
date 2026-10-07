# Check-in changes

## MODIFIED Requirements

### Requirement: Unattended rooms are released

The system SHALL release a booking that is not checked in ten minutes after its start, and SHALL offer the rest of the slot to its waiting list.

#### Scenario: Nobody checks in

- **WHEN** ten minutes pass after the start without a check-in and nobody is waiting
- **THEN** the booking is removed and the room is free for the rest of the slot

#### Scenario: Someone is waiting for the slot

- **WHEN** ten minutes pass after the start without a check-in and the slot has a waiting list
- **THEN** the booking is removed and the rest of the slot is offered to the first member on the list
