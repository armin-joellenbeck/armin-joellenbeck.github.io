use super::entities::{Card, Column};
use super::events::Event;

pub fn evolve(card: Card, event: Event) -> Card {
    let Card{title, column} = card;
    match event {
        Event::CardAdded { title: _ } => todo!(),
        Event::CardTitleChanged { title } => Card{title, column},
        Event::CardSelected() => Card{title, column: Column::Todo},
        Event::CardStarted() => Card{title, column: Column::Ongoing},
        Event::CardFinished() => Card{title, column: Column::Done},
        Event::CardRemoved() => todo!(),
    }
}

#[cfg(test)]
mod test {
    use super::*;

    fn a_card_title() -> String {
        "a card title".to_string()
    }

    #[test]
    fn test_card_title_changed() {
        assert_eq!(
            evolve(
                Card{title: String::new(), column: Column::Backlog},
                Event::CardTitleChanged {
                    title: a_card_title()
                }
            ),
            Card{title: a_card_title(), column: Column::Backlog}
        );
    }

    #[test]
    fn test_card_selected() {
        assert_eq!(
            evolve(Card{title: String::new(), column:Column::Backlog}, Event::CardSelected()),
            Card{title:String::new(), column:Column::Todo}
        )
    }
    #[test]
    fn test_card_started() {
        assert_eq!(
            evolve(Card{title:String::new(), column:Column::Backlog}, Event::CardStarted()),
            Card{title:String::new(), column:Column::Ongoing}
        )
    }
    #[test]
    fn test_card_finished() {
        assert_eq!(
            evolve(Card{title:String::new(), column:Column::Backlog}, Event::CardFinished()),
            Card{title:String::new(), column:Column::Done}
        )
    }
}
