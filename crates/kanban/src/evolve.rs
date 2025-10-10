use super::entities::{Card, Column};
use super::events::Event;

pub fn evolve(card: Card, event: Event) -> Card {
    let Card(title, column) = card;
    match event {
        Event::CardAdded { title: _ } => todo!(),
        Event::CardTitleChanged { title } => Card(title, column),
        Event::CardSelected() => Card(title, Column::Todo),
        Event::CardStarted() => Card(title, Column::Ongoing),
        Event::CardFinished() => Card(title, Column::Done),
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
                Card(String::new(), Column::Backlog),
                Event::CardTitleChanged {
                    title: a_card_title()
                }
            ),
            Card(a_card_title(), Column::Backlog)
        );
    }

    #[test]
    fn test_card_selected() {
        assert_eq!(
            evolve(Card(String::new(), Column::Backlog), Event::CardSelected()),
            Card(String::new(), Column::Todo)
        )
    }
    #[test]
    fn test_card_started() {
        assert_eq!(
            evolve(Card(String::new(), Column::Backlog), Event::CardStarted()),
            Card(String::new(), Column::Ongoing)
        )
    }
    #[test]
    fn test_card_finished() {
        assert_eq!(
            evolve(Card(String::new(), Column::Backlog), Event::CardFinished()),
            Card(String::new(), Column::Done)
        )
    }
}
