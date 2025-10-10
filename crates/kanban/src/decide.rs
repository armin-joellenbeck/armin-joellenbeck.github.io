use super::actions::{Action, CardTitle};
use super::events::Event;

pub fn decide(action: Action) -> Vec<Event> {
    match action {
        Action::UserAddsCardToBoard {
            title: CardTitle(title),
        } => {
            vec![Event::CardAdded { title }]
        }

        Action::UserChangesCardTitle {
            title: CardTitle(title),
        } => {
            vec![Event::CardTitleChanged { title }]
        }

        Action::UserSelectsCard {} => {
            vec![Event::CardSelected()]
        }

        Action::UserStartsCard {} => {
            vec![Event::CardStarted()]
        }

        Action::UserFinishesCard {} => {
            vec![Event::CardFinished()]
        }

        Action::UserRemovesCard {} => {
            vec![Event::CardRemoved()]
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
    fn test_decide_user_adds_card_to_board() {
        assert_eq!(
            decide(Action::UserAddsCardToBoard {
                title: CardTitle::new(&a_card_title())
            }),
            vec![Event::CardAdded {
                title: a_card_title()
            }]
        );
    }

    #[test]
    fn test_decide_user_changes_card_title() {
        assert_eq!(
            decide(Action::UserChangesCardTitle {
                title: CardTitle::new(&a_card_title()),
            }),
            vec![Event::CardTitleChanged {
                title: a_card_title()
            }]
        );
    }

    #[test]
    fn test_decide_selects_card() {
        assert_eq!(
            decide(Action::UserSelectsCard {}),
            vec![Event::CardSelected()]
        );
    }

    #[test]
    fn test_decide_starts_card() {
        assert_eq!(
            decide(Action::UserStartsCard {}),
            vec![Event::CardStarted()]
        );
    }

    #[test]
    fn test_decide_finishes_card() {
        assert_eq!(
            decide(Action::UserFinishesCard {}),
            vec![Event::CardFinished()]
        );
    }

    #[test]
    fn test_decide_removes_card() {
        assert_eq!(
            decide(Action::UserRemovesCard {}),
            vec![Event::CardRemoved()]
        );
    }
}
