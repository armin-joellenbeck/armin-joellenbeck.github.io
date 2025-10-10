#[derive(Debug, PartialEq)]
pub struct Card(pub String, pub Column);

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Column {
    Backlog,
    Todo,
    Ongoing,
    Done,
}
