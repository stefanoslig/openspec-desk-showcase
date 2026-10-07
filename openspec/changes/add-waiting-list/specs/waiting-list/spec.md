# Waiting list

## ADDED Requirements

### Requirement: Members join the waiting list of a taken slot

The system SHALL let a member join the waiting list of a slot that someone else has booked, and SHALL keep the list in the order of joining.

#### Scenario: Joining the list

- **WHEN** a member's booking is refused because the room is taken, and the member chooses "Join waiting list"
- **THEN** the member is added to the end of the list and sees their position

#### Scenario: Leaving the list

- **WHEN** a waiting member chooses "Leave waiting list"
- **THEN** the member is removed and the members behind move up

### Requirement: A freed slot is offered to the first waiting member

The system SHALL offer a slot that is cancelled or released to the first member on its waiting list, with a notification.

#### Scenario: The slot is cancelled

- **WHEN** the booking of a slot with a waiting list is cancelled
- **THEN** the first member on the list is notified and can accept the slot

#### Scenario: The offer is accepted

- **WHEN** the member accepts the offer
- **THEN** the slot is booked for that member and the member leaves the list

### Requirement: An offer expires after 15 minutes

The system SHALL pass an offer that is not accepted within 15 minutes to the next member on the list, and SHALL free the slot when the list is empty.

#### Scenario: The offer is ignored

- **WHEN** a member does not accept an offer within 15 minutes
- **THEN** the offer goes to the next member on the list

#### Scenario: Nobody is left

- **WHEN** the last member on the list lets the offer expire
- **THEN** the slot becomes free for everyone
