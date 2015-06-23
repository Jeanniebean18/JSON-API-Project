#Pet Tracker

Build a program that tracks a user's pet('s) medicine given, grooming and vet visits. 

For example, today I gave each of my pets a dose of Frontline for flea prevention. I'd like to track which animals recieved this dose, the date recieved and when I need to do it again. Increment is chosen by me. 

##Description

- [ ] Table of owners (users). (id & name)
- [ ]  Table of pets. (id, name, owner_id(foreign key))
- [ ]Table of events. (id, name, date, category_id(foreign key), reminder_time(increment chosen by user for        reoccurence))
- [ ]Table of event categories (id, name). Categories would include: Medicine, Grooming Visit, and Vet Visit.
- [ ]Bridge table for pets and events. (primary key, pet_id(foreign key), event_id(foreign key))

##Requirements

- [ ] At least three models (Owner, Pet, Event, Category)
- [ ] At least one one-to-many relationship (One owner to many pets)
- [ ] At least one many-to-many relationship (One event could contain many pets, pets can have many events)
- [ ] Unit tests for all business logic
- [ ] Ability to fully interact with the application from the browser_


##"Should" Cases

- [ ] Create a new user.
- [ ] Edit user name.
- [ ] Delete a user.
- [ ] Create pets (names) for user.
- [ ] Edit pet names.
- [ ] Delete pet names.
- [ ] Create an event by category (vet, medicine, grooming) and include note if need be.
- [ ] Choose which pets were affected by this event.
- [ ] Choose date of event (would like a timestamp instead later on this to save user a step, assuming today is the day you performed the event. They could change this later.)
- [ ] Choose when the pets should have this event reoccur. Or rather when the user should be reminded of the next occurence of the event. (push notification)
- [ ] Edit event -  name, pets involved or date and reoccurence increment chosen. 
- [ ] Delete an event.
- [ ] Fetch all pets for a user.
- [ ] Fetch all events for a given pet.
- [ ] Fetch all pets for a given event.
- [ ] If event deleted, it should delete row from both event table and bridge table.


##"Should Not" Cases

- [ ] Create a category ( I want to keep this really simple, if I find feedback warrants more than these categories,
- [ ] I'll considering adding them. But not user added.)
- [ ] Delete a category.
- [ ] Create an event without category, name, pet(s) involved, date or increment reminder.
- [ ] Change a category of an event. They begin an event by choosing the category first, so they should have no reason to change the category.
- [ ] Should not limit user on amount of pets to add. 

####Should not and should case? 

- [ ] If a pet is deleted, should not affect event unless this animal was the only one on that event. If pet id 
is nil for event in bridge table, it should also delete event.

##Rules

- Class names should be singular. Pet
- Table names should be plural. pets
- Foreign keys should be singular plus _id ... E.g. category_id
- Instance Methods

- For models (meaning classes that have an associated table), you'll definitely have some instance methods for interacting with a given row/record. Some rules for those methods:

- A method that fetches information through a relationship (e.g. a pets's events) should be named "the plural form of the class". Hence, a Pet object has a method events.
- The method that deletes an object should be called delete.

###Class Methods

- The method that returns all of a class's records should be called all.
- Methods that search for potentially many records should have the word where in their method name.
