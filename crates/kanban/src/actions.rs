#[derive(Debug, PartialEq)]
pub struct CardTitle(pub String);

impl CardTitle {
    pub fn new(title: &str) -> Self {
        Self(title.to_string())
    }
}

#[derive(Debug, PartialEq)]
pub enum Action {
    UserAddsCardToBoard { id: String, title: CardTitle },
    UserChangesCardTitle { id: String, title: CardTitle },
    UserSelectsCard { id: String },
    UserStartsCard { id: String },
    UserFinishesCard { id: String },
    UserRemovesCard { id: String },
}
