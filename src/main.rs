use std::error::Error;

use lambda_runtime::{error::HandlerError, lambda, Context};
use serde_json::Value;

fn main() -> Result<(), Box<dyn Error>> {
    lambda!(handler);
    Ok(())
}

fn handler(event: Value, _: Context) -> Result<Value, HandlerError> {
    Ok(event)
}
