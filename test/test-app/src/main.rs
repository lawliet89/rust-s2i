extern crate hyper;
use hyper::server::{Server, Request, Response};

fn main() {
    println!("Running server");
    Server::http("0.0.0.0:8080")
        .unwrap()
        .handle(move |_req: Request, res: Response| {
            println!("Request!");
            res.send(b"I love Rust").unwrap();
        })
        .unwrap();
}
