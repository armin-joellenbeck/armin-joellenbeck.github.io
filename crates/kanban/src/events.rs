use crate::entities::Column;

#[derive(Debug, PartialEq)]
pub enum Event {
    CardAdded {
        id: String,
        title: String,
        column: Column,
    },
    CardTitleChanged {
        id: String,
        title: String,
    },
    CardColumnChanged {
        id: String,
        column: Column,
    },
    CardRemoved {
        id: String,
    },
}
