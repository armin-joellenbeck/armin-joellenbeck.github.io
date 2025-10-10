#[derive(Debug, PartialEq)]
pub enum Event {
    CardAdded { title: String },
    CardTitleChanged { title: String },
    CardSelected(),
    CardStarted(),
    CardFinished(),
    CardRemoved(),
}
