use std::collections::HashMap;

use crate::{
    actions::{Action, CardTitle},
    entities::{Card, Column, Entity},
    events::Event,
};

#[derive(Debug, PartialEq, Default)]
pub struct State {
    entities: HashMap<String, Entity>,
}

impl State {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn evolve(&mut self, event: Event) {
        match event {
            Event::CardAdded { id, title, column } => {
                self.add(id, Entity::Card(Card { title, column }))
            }

            Event::CardTitleChanged { id, title } => {
                if let Some(Entity::Card(card)) = self.get(&id) {
                    card.title = title;
                }
            }

            Event::CardColumnChanged { id, column } => {
                if let Some(Entity::Card(card)) = self.get(&id) {
                    card.column = column;
                }
            }

            Event::CardRemoved { id } => {
                self.remove(&id);
            }
        }
    }

    pub fn decide(&self, action: Action) -> Vec<Event> {
        match action {
            Action::UserAddsCardToBoard {
                id,
                title: CardTitle(title),
            } => {
                vec![Event::CardAdded {
                    id,
                    title,
                    column: Column::Backlog,
                }]
            }

            Action::UserChangesCardTitle {
                id,
                title: CardTitle(title),
            } => {
                vec![Event::CardTitleChanged { id, title }]
            }

            Action::UserSelectsCard { id } => {
                vec![Event::CardColumnChanged {
                    id,
                    column: Column::Todo,
                }]
            }

            Action::UserStartsCard { id } => {
                vec![Event::CardColumnChanged {
                    id,
                    column: Column::Ongoing,
                }]
            }

            Action::UserFinishesCard { id } => {
                vec![Event::CardColumnChanged {
                    id,
                    column: Column::Done,
                }]
            }

            Action::UserRemovesCard { id } => {
                vec![Event::CardRemoved { id }]
            }
        }
    }

    fn add(&mut self, id: String, entity: Entity) {
        self.entities.entry(id).or_insert(entity);
    }

    fn get(&mut self, id: &str) -> Option<&mut Entity> {
        self.entities.get_mut(id)
    }

    fn remove(&mut self, id: &str) {
        self.entities.remove(id);
    }
}

#[cfg(test)]
mod test {
    use super::*;

    fn a_card_id() -> String {
        "a card id".to_string()
    }

    fn a_card_title() -> CardTitle {
        CardTitle::new("a card title")
    }

    #[test]
    fn test_decide_user_adds_card_to_board() {
        let state = State::new();

        assert_eq!(
            state.decide(Action::UserAddsCardToBoard {
                id: a_card_id(),
                title: a_card_title()
            }),
            vec![Event::CardAdded {
                id: a_card_id(),
                title: a_card_title().0,
                column: Column::Backlog
            }]
        );
    }

    #[test]
    fn test_decide_user_changes_card_title() {
        let state = State::new();

        assert_eq!(
            state.decide(Action::UserChangesCardTitle {
                id: a_card_id(),
                title: a_card_title()
            }),
            vec![Event::CardTitleChanged {
                id: a_card_id(),
                title: a_card_title().0
            }]
        );
    }

    #[test]
    fn test_decide_selects_card() {
        let state = State::new();

        assert_eq!(
            state.decide(Action::UserSelectsCard { id: a_card_id() }),
            vec![Event::CardColumnChanged {
                id: a_card_id(),
                column: Column::Todo
            }]
        );
    }

    #[test]
    fn test_decide_starts_card() {
        let state = State::new();

        assert_eq!(
            state.decide(Action::UserStartsCard { id: a_card_id() }),
            vec![Event::CardColumnChanged {
                id: a_card_id(),
                column: Column::Ongoing
            }]
        );
    }

    #[test]
    fn test_decide_finishes_card() {
        let state = State::new();

        assert_eq!(
            state.decide(Action::UserFinishesCard { id: a_card_id() }),
            vec![Event::CardColumnChanged {
                id: a_card_id(),
                column: Column::Done
            }]
        );
    }

    #[test]
    fn test_decide_removes_card() {
        let state = State::new();

        assert_eq!(
            state.decide(Action::UserRemovesCard { id: a_card_id() }),
            vec![Event::CardRemoved { id: a_card_id() }]
        );
    }
}
