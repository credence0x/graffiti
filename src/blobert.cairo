use graffiti::elements::TagBuilder;
use graffiti::{Tag, TagImpl};

use graffiti::blob::{blob_trait, blob_head};

fn blobert() -> ByteArray {
    let root: Tag = TagImpl::new("svg")
        .attr("xmlns", "http://www.w3.org/2000/svg")
        .attr("preserveAspectRatio", "xMinYMin meet")
        .attr("viewBox", "0 0 350 350");

    let body: Tag = TagImpl::new("image")
        .attr("href", "data:image/png;base64," + blob_trait())
        .attr("x", "0")
        .attr("y", "0")
        .attr("width", "100px")
        .attr("height", "100px");

    let head: Tag = TagImpl::new("image")
        .attr("href", "data:image/png;base64," + blob_head())
        .attr("x", "0")
        .attr("y", "0")
        .attr("width", "100px")
        .attr("height", "100px");

    root.insert(body).insert(head).build()
}

#[cfg(test)]
mod tests {
    use super::{blobert};

    #[test]
    #[available_gas(1000000000)]
    fn test_add() {
        let blob = blobert();

        println!("blob: {}", blob);
    }
}
