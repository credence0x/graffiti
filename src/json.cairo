use core::option::OptionTrait;
use graffiti::ToBytes;
use core::array::ArrayTrait;
const BRACKET_OPEN: felt252 = '{';
const BRACKET_CLOSE: felt252 = '}';

const QUOTE: felt252 = '"';
const COLON: felt252 = ':';
const COMMA: felt252 = ',';

const NAME: felt252 = 'name';
const DESCRIPTION: felt252 = 'description';
const IMAGE: felt252 = 'image';
const ATTRIBUTES: felt252 = 'attributes';

const TRAIT_TYPE: felt252 = 'trait_type';
const VALUE: felt252 = 'value';

const SQUARE_BRACKET_OPEN: felt252 = '[';
const SQUARE_BRACKET_CLOSE: felt252 = ']';
// {
//   "name": "Token Name",
//   "description": "A description of what this token represents",
//   "image": "URL_to_an_image",
//   "attributes": [
//     {
//       "trait_type": "Base",
//       "value": "Starfish"
//     },
//     {
//       "trait_type": "Eyes",
//       "value": "Big"
//     },
//   ]
// }

#[derive(Drop)]
struct Attribute {
    key: ByteArray,
    value: Option<ByteArray>,
    children: Option<JsonBuilder>
}

impl JsonBuilderDefault of Default<JsonBuilder> {
    fn default() -> JsonBuilder {
        JsonBuilder { data: Option::None }
    }
}


#[derive(Drop)]
struct JsonBuilder {
    data: Option<Array<Attribute>>
}
trait AttributeTrait<Attribute> {
    fn to_bytes(self: Attribute) -> ByteArray;
}

impl AttributeImpl of AttributeTrait<Attribute> {
    fn to_bytes(mut self: Attribute) -> ByteArray {
        let mut ba1 = Default::default();

        ba1.append_word(QUOTE, 1);
        ba1.append(@self.key);
        ba1.append_word(QUOTE, 1);
        ba1.append_word(COLON, 1);

        let mut children = match self.children {
            Option::Some(children) => children,
            Option::None => { Default::default() }
        };

        let mut value = match self.value {
            Option::Some(value) => value,
            Option::None => { Default::default() }
        };

        if (children.data.is_some()) {
            let mut data = match children.data {
                Option::Some(data) => data,
                Option::None => { Default::default() }
            };

            ba1.append_word(SQUARE_BRACKET_OPEN, 1);

            if (data.len() > 0) {
                loop {
                    match data.pop_front() {
                        Option::Some(attr) => {
                            ba1.append_word(BRACKET_OPEN, 1);
                            ba1.append(@attr.into().to_bytes());
                            ba1.append_word(BRACKET_CLOSE, 1);
                            if (data.len() == 1) {
                                ba1.append_word(COMMA, 1);
                            } else {
                                ba1.append_word(SQUARE_BRACKET_CLOSE, 1);
                            }
                        },
                        Option::None => { break; },
                    };
                };
            }
        } else {
            ba1.append_word(QUOTE, 1);
            ba1.append(@value);
            ba1.append_word(QUOTE, 1);
        }

        ba1
    }
}

trait Builder<T> {
    fn new(name: ByteArray) -> T;
    fn add(self: T, key: ByteArray, value: ByteArray) -> T;
    fn add_array(self: T, key: ByteArray, value: JsonBuilder) -> T;
    fn build(self: T) -> ByteArray;
}

impl JsonImpl of Builder<JsonBuilder> {
    fn new(name: ByteArray) -> JsonBuilder {
        JsonBuilder { data: Option::None }
    }
    fn add(mut self: JsonBuilder, key: ByteArray, value: ByteArray) -> JsonBuilder {
        let mut data = match self.data {
            Option::Some(data) => data,
            Option::None => { Default::default() }
        };

        data.append(Attribute { key, value: Option::Some(value), children: Option::None });

        self.data = Option::Some(data);
        self
    }
    fn add_array(mut self: JsonBuilder, key: ByteArray, value: JsonBuilder) -> JsonBuilder {
        let mut data = match self.data {
            Option::Some(data) => data,
            Option::None => { Default::default() }
        };

        data.append(Attribute { key, value: Option::None, children: Option::Some(value) });

        self.data = Option::Some(data);
        self
    }
    fn build(mut self: JsonBuilder) -> ByteArray {
        let mut ba1 = Default::default();

        ba1.append_word(BRACKET_OPEN, 1);

        let mut data = match self.data {
            Option::Some(data) => data,
            Option::None => { Default::default() }
        };

        loop {
            match data.pop_front() {
                Option::Some(attr) => {
                    ba1.append(@attr.into().to_bytes());

                    if (data.len() == 1) {
                        ba1.append_word(COMMA, 1);
                    }
                },
                Option::None => { break; },
            };
        };

        ba1.append_word(BRACKET_CLOSE, 1);

        ba1
    }
}

#[cfg(test)]
mod tests {
    use super::{JsonImpl, JsonBuilder, Builder, AttributeTrait, Attribute};

    #[test]
    #[available_gas(1000000000)]
    fn test_add() {
        let json = JsonImpl::new("metadata");

        let h = json.add("name", "Token Name");
        let h = h.add("description", "A description of what this token represents");

        let h = h.build();

        println!("json: {}", h);
    }

    #[test]
    #[available_gas(1000000000)]
    fn test_add_array() {
        let json = JsonImpl::new("metadata");

        let h = json.add("name", "Token Name");

        // let mut attributes: Array = Default::default();

        let nested = JsonImpl::new("nested");

        let nested = nested.add("trait_type", "Base");
        let nested = nested.add("value", "Starfish");

        let h = h.add_array("attributes", nested);

        let h = h.build();
        println!("json: {}", h);
    }
}
