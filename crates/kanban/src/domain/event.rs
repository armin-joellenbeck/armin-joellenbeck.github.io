#[derive(Debug, PartialEq)]
pub enum Event {
    CardAddedToBoardByUser(String),
    CardTitleChangedByUser(String),
}
