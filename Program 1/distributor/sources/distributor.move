module::distributor1 {
    use sui::tx_context::{Self, TxContext};
    use sui::vector as vec;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::sui:SUI;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    
    
    // -- Types --
    
    struct Distributor has key {
        id: UID;
        // addresses to transfer
        addresses: vec<address>;

        // number of sui coins to transfer
        sui_kol: vec<u32>;
    }


    // -- private functions --

    // create new Distributor
    fun new(ctx: &mut TxContext): Distributor {
        Distributor {
            id: object::new(ctx),
            addresses: vec::empty();
            sui_kol: vec::empty();
        }
    }

    // -- public functions --

    public fun viewWallets(self: &Distributor): &vector<address> {
        &self.wallets.addresses;
    }

    public fun viewKol(self: &Distributor): &vector<address> {
        &self.wallets.sui_kol;
    }

    public entry fun add_wallet(distributor: &mut Distributor, adr: address, kol: u32) {
        vec::push_back(&mut distributor.addresses, adr);
        vec::push_back(&mut distributor.sui_kol, kol);
    }

    public entry fun clear_dist(distributor: &mut Distributor) {
        let distributor.addresses = vec::empty();
        let distributor.sui_kol = vec::empty();
    } 

    // create new Distributor and send to transaction sender
    public entry fun create(ctx: &mut TxContext) {
        let dist = new(ctx);
        transfer::transfer(dist, tx_context::sender(ctx));
    }

    
    public entry fun distribute(distributor: &Distributor, ctx: &mut TxContext) : _ {
        let length = vec::length(distributor.addresses);
        let i = 0u64;
        while (i < length) {
            // transfer to address
        }

    }

}