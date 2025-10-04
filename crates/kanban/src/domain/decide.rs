use crate::domain::event::Event;

use crate::domain::incoming_action::{CardTitle, IncomingAction};

pub fn decide(action: &IncomingAction) -> Vec<Event> {
    match action {
        IncomingAction::UserAddsCardToBoard {
            title: CardTitle(title),
        } => {
            vec![Event::card_added_to_board_by_user(title)]
        }
        IncomingAction::UserChangesCardTitle {
            title: CardTitle(title),
        } => {
            vec![Event::card_title_changed_by_user(title)]
        }
    }
}

#[cfg(test)]
mod test {
    use super::*;

    const A_CARD_TITLE: &str = "a card title";

    #[test]
    fn test_decide_user_adds_card_to_board() {
        assert_eq!(
            decide(&IncomingAction::user_adds_card_board(A_CARD_TITLE)),
            vec![Event::card_added_to_board_by_user(A_CARD_TITLE)]
        );
    }

    #[test]
    fn test_decide_user_changes_card_title() {
        assert_eq!(
            decide(&IncomingAction::user_user_changes_card_title(A_CARD_TITLE)),
            vec![Event::card_title_changed_by_user(A_CARD_TITLE)]
        );
    }
}
