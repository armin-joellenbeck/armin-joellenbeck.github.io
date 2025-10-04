#[derive(Debug, PartialEq)]
pub enum Event {
    CardAddedToBoardByUser { title: String },
    CardTitleChangedByUser { title: String },
}

impl Event {
    pub fn card_added_to_board_by_user(title: &str) -> Self {
        Self::CardAddedToBoardByUser {
            title: title.to_string(),
        }
    }
    pub fn card_title_changed_by_user(title: &str) -> Self {
        Self::CardTitleChangedByUser {
            title: title.to_string(),
        }
    }
}
