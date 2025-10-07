use super::event::Event;

use super::incoming_action::{CardTitle, IncomingAction};

pub fn decide(action: IncomingAction) -> Vec<Event> {
    match action {
        IncomingAction::UserAddsCardToBoard {
            title: CardTitle(title),
        } => {
            vec![Event::CardAddedToBoardByUser(title)]
        }
        IncomingAction::UserChangesCardTitle {
            title: CardTitle(title),
        } => {
            vec![Event::CardTitleChangedByUser(title)]
        }
    }
}

#[cfg(test)]
mod test {
    use super::*;

    const A_CARD_TITLE: &str = "a card title";

    #[test]
    fn test_decide_user_adds_card_to_board() {
        let action = IncomingAction::user_adds_card_board(A_CARD_TITLE);

        let events = vec![Event::CardAddedToBoardByUser(A_CARD_TITLE.to_string())];

        assert_eq!(decide(action), events);
    }

    #[test]
    fn test_decide_user_changes_card_title() {
        let action = IncomingAction::user_user_changes_card_title(A_CARD_TITLE);

        let events = vec![Event::CardTitleChangedByUser(A_CARD_TITLE.to_string())];

        assert_eq!(decide(action), events);
    }
}
