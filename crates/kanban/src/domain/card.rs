use super::event::Event;

#[derive(Debug, PartialEq)]
pub struct Card(pub String);


impl Card {
    pub fn evolve(self, event: Event) -> Card {
        match event {
            Event::CardAddedToBoardByUser(title) => Card(title),
            Event::CardTitleChangedByUser(title) => Card(title),
        }
    }
}

#[cfg(test)]
mod test {
    use super::*;

    fn a_card_title() -> String {
        "a card title".to_string()
    }

    #[test]
    fn test_card_added_to_board_by_user()  {
        let card = Card(String::new());
        let event = Event::CardAddedToBoardByUser(a_card_title());

        let result = card.evolve(event);

        assert_eq!(result, Card(a_card_title()));
            
    }

    #[test]
    fn test_card_title_changed_by_user() {
        
    }
}
