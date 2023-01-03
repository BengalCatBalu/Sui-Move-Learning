1. Why Move - article from sui networks - https://docs.sui.io/learn/why-move
    "EVM assets are encoded as entries in owner_address -> <bytes encoding asset> hash maps. Asset updates and transfers work by updating entries in this map. There is no type or value representing an asset, and thus an asset cannot be passed as an argument, returned from a function, or be stored inside of another asset. Only unstructured bytes can be passed across contract boundaries, and thus each asset is forever trapped inside the contract that defines it.
    Move assets are arbitrary user-defined types. Assets can be passed as arguments, returned from functions, and stored inside other assets. In addition, assets can flow freely across contract boundaries without losing their integrity thanks to Move's built-in resource safety 1 2 protections."

2. Important: In Sui Move, package names are always in CamelCase, while the address alias is lowercase, for examples sui = 0x2 and std = 0x1. So: Sui = name of the imported package (Sui = sui framework), sui = address alias of 0x2, sui::sui = module sui under the address 0x2, and sui::sui::SUI = type in the module above.

3. sui move new my_first_package

4. Package metadata such as name and version ([package] section)
    Other packages that this package depends on ([dependencies] section). This package only depends on the Sui Framework, but other third-party dependencies should be added here.
    A list of named addresses ([addresses] section). These names can be used as convenient aliases for the given addresses in the source code.

5. Let's break down the four different parts of this code:

    Imports: these allow our module to use types and functions declared in other modules. In this case, we pull in imports from three different modules.
    Struct declarations: these define types that can be created/destroyed by this module. Here the key abilities indicate that these structs are Sui objects that can be transferred between addresses. The store ability on the sword allows it to appear in fields of other structs and to be transferred freely.
    Module initializer: this is a special function that is invoked exactly once when the module is published.
    Accessor functions--these allow the fields of the fields of module's struct to be read from other modules.