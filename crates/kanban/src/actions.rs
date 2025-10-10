#[derive(Debug, PartialEq)]
pub struct CardTitle(pub String);

impl CardTitle {
    pub fn new(title: &str) -> Self {
        Self(title.to_string())
    }
}

#[derive(Debug, PartialEq)]
pub enum Action {
    UserAddsCardToBoard { title: CardTitle },
    UserChangesCardTitle { title: CardTitle },
    UserSelectsCard {},
    UserStartsCard {},
    UserFinishesCard {},
    UserRemovesCard {}, 
}
