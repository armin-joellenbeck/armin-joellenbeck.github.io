#[derive(Debug, PartialEq)]
pub enum IncomingAction {
    UserAddsCardToBoard { title: CardTitle },
    UserChangesCardTitle { title: CardTitle },
}

impl IncomingAction {
    pub fn user_adds_card_board(title: &str) -> Self {
        Self::UserAddsCardToBoard {
            title: CardTitle::new(title),
        }
    }

    pub fn user_user_changes_card_title(title: &str) -> Self {
        Self::UserChangesCardTitle {
            title: CardTitle::new(title),
        }
    }
}

#[derive(Debug, PartialEq)]
pub struct CardTitle(pub String);

impl CardTitle {
    pub fn new(title: &str) -> Self {
        Self(title.to_string())
    }
}
