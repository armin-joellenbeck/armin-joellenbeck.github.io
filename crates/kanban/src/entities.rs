#[derive(Debug, PartialEq)]
pub struct Card {
    pub title: String,
    pub column: Column,
}

#[derive(Debug, PartialEq)]
pub enum Column {
    Backlog,
    Todo,
    Ongoing,
    Done,
}
