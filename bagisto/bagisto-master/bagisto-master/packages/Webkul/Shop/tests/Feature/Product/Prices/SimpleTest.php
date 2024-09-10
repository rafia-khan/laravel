<?php

use Webkul\CartRule\Models\CartRule;
use Webkul\CartRule\Models\CartRuleCoupon;
use Webkul\CatalogRule\Models\CatalogRule;
use Webkul\CatalogRule\Models\CatalogRuleProductPrice;
use Webkul\Checkout\Models\Cart;
use Webkul\Checkout\Models\CartItem;
use Webkul\Customer\Models\Customer;
use Webkul\Customer\Models\CustomerAddress;
use Webkul\Faker\Helpers\Product as ProductFaker;
use Webkul\Product\Models\ProductCustomerGroupPrice;
use Webkul\Tax\Models\TaxCategory;
use Webkul\Tax\Models\TaxMap;
use Webkul\Tax\Models\TaxRate;

use function Pest\Laravel\getJson;
use function Pest\Laravel\postJson;

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the no coupon type for all customer group type', function () {
    // Arrange.
    (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1, 2, 3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.store', [
        'quantity' => rand(1, 10),
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should add a simple product to the cart with a cart rule of the no coupon type for all customer group type', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1, 2, 3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $quantity = rand(1, 10),
    ]))
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.cart.item-add-to-cart'))
        ->assertJsonPath('data.items.0.quantity', $quantity);

    $this->assertPrice($product->price, $response['data']['items'][0]['price']);

    $this->assertPrice($cartRule->discount_amount, $response['data']['discount_amount']);

    $this->assertPrice(($product->price * $quantity) - $cartRule->discount_amount, $response['data']['grand_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the no coupon type for guest customer', function () {
    // Arrange.
    (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.store', [
        'quantity' => rand(1, 10),
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should add a simple product to the cart with a cart rule of the no coupon type for guest customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $quantity = rand(1, 10),
    ]))
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.cart.item-add-to-cart'))
        ->assertJsonPath('data.items.0.quantity', $quantity);

    $this->assertPrice($product->price, $response['data']['items'][0]['price']);

    $this->assertPrice($cartRule->discount_amount, $response['data']['discount_amount']);

    $this->assertPrice(($product->price * $quantity) - $cartRule->discount_amount, $response['data']['grand_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the no coupon type for general customer', function () {
    // Arrange.
    (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([2]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 2]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'quantity' => rand(1, 10),
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should add a simple product to the cart with a cart rule of the no coupon type for general customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([2]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 2]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $quantity = rand(1, 10),
    ]))
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.cart.item-add-to-cart'))
        ->assertJsonPath('data.items.0.quantity', $quantity);

    $this->assertPrice($product->price, $response['data']['items'][0]['price']);

    $this->assertPrice($cartRule->discount_amount, $response['data']['discount_amount']);

    $this->assertPrice(($product->price * $quantity) - $cartRule->discount_amount, $response['data']['grand_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the no coupon type for wholesaler customer', function () {
    // Arrange.
    (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'quantity' => rand(1, 10),
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should add a simple product to the cart with a cart rule of the no coupon type for wholesaler customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 0,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $quantity = rand(1, 10),
    ]))
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.cart.item-add-to-cart'))
        ->assertJsonPath('data.items.0.quantity', $quantity)
        ->assertJsonPath('data.discount_amount', $cartRule->discount_amount);

    $this->assertPrice($product->price, $response['data']['items'][0]['price']);

    $this->assertPrice(($product->price * $quantity) - $cartRule->discount_amount, $response['data']['grand_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);
});

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the specific coupon type for all customer grouped types', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1, 2, 3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $customer = Customer::factory()->create();

    $cart = Cart::factory()->create([
        'customer_id'         => $customer->id,
        'customer_email'      => $customer->email,
        'customer_first_name' => $customer->first_name,
        'customer_last_name'  => $customer->last_name,
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    cart()->setCart($cart);

    cart()->collectTotals();

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.coupon.apply'))
        ->assertJsonValidationErrorFor('code')
        ->assertUnprocessable();

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should add a simple product to the cart with a cart rule of the specific coupon type for all customer grouped types', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1, 2, 3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => $couponCode = fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $customer = Customer::factory()->create();

    $cart = Cart::factory()->create([
        'customer_id'         => $customer->id,
        'customer_email'      => $customer->email,
        'customer_first_name' => $customer->first_name,
        'customer_last_name'  => $customer->last_name,
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    cart()->setCart($cart);

    cart()->collectTotals();

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.coupon.apply'), [
        'code' => $couponCode,
    ])
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.coupon.success-apply'))
        ->assertJsonPath('data.id', $cart->id);

    $this->assertPrice($discountAmount, $response['data']['discount_amount']);

    $this->assertPrice($product->price, $response['data']['sub_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the specific coupon type for guest customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => $couponCode = fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $cart = Cart::factory()->create([
        'customer_email'      => fake()->email(),
        'customer_first_name' => fake()->firstName(),
        'customer_last_name'  => fake()->lastName(),
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.coupon.apply'))
        ->assertJsonValidationErrorFor('code')
        ->assertUnprocessable();

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should add a simple product to the cart with a cart rule of the specific coupon type for guest customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([1]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => $couponCode = fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $cart = Cart::factory()->create([
        'customer_email'      => fake()->email(),
        'customer_first_name' => fake()->firstName(),
        'customer_last_name'  => fake()->lastName(),
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    cart()->setCart($cart);

    cart()->collectTotals();

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.coupon.apply'), [
        'code' => $couponCode,
    ])
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.coupon.success-apply'))
        ->assertJsonPath('data.id', $cart->id);

    $this->assertPrice($discountAmount, $response['data']['discount_amount']);

    $this->assertPrice($product->price, $response['data']['sub_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the specific coupon type for general customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([2]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => $couponCode = fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $customer = Customer::factory()->create();

    $cart = Cart::factory()->create([
        'customer_id'         => $customer->id,
        'customer_email'      => $customer->email,
        'customer_first_name' => $customer->first_name,
        'customer_last_name'  => $customer->last_name,
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.coupon.apply'), [
        'code' => $couponCode,
    ])
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.coupon.success-apply'))
        ->assertJsonPath('data.id', $cart->id);

    $this->assertPrice($discountAmount, $response['data']['discount_amount']);

    $this->assertPrice($product->price, $response['data']['sub_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should add a simple product to the cart with a cart rule of the specific coupon type for general customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([2]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => $couponCode = fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $customer = Customer::factory()->create();

    $cart = Cart::factory()->create([
        'customer_id'         => $customer->id,
        'customer_email'      => $customer->email,
        'customer_first_name' => $customer->first_name,
        'customer_last_name'  => $customer->last_name,
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.coupon.apply'), [
        'code' => $couponCode,
    ])
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.coupon.success-apply'))
        ->assertJsonPath('data.id', $cart->id);

    $this->assertPrice($discountAmount, $response['data']['discount_amount']);

    $this->assertPrice($product->price, $response['data']['sub_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should fails the validation error when the product id not provided add a simple product to the cart with a cart rule of the specific coupon type for wholesaler customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => $couponCode = fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $cart = Cart::factory()->create([
        'customer_id'         => $customer->id,
        'customer_email'      => $customer->email,
        'customer_first_name' => $customer->first_name,
        'customer_last_name'  => $customer->last_name,
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.coupon.apply'))
        ->assertJsonValidationErrorFor('code')
        ->assertUnprocessable();

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should add a simple product to the cart with a cart rule of the specific coupon type for wholesaler customer', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $cartRule = CartRule::factory()->afterCreating(function (CartRule $cartRule) {
        $cartRule->cart_rule_customer_groups()->sync([3]);

        $cartRule->cart_rule_channels()->sync([1]);
    })->create([
        'name'                      => fake()->uuid(),
        'description'               => fake()->sentence(),
        'action_type'               => 'by_fixed',
        'discount_amount'           => $discountAmount = rand(1, 50),
        'usage_per_customer'        => rand(1, 50),
        'uses_per_coupon'           => rand(1, 50),
        'condition_type'            => 2,
        'status'                    => 1,
        'discount_quantity'         => 1,
        'apply_to_shipping'         => 1,
        'use_auto_generation'       => 0,
        'times_used'                => 0,
        'coupon_type'               => 1,
        'end_other_rules'           => 0,
        'uses_attribute_conditions' => 0,
        'discount_step'             => 0,
        'free_shipping'             => 0,
        'sort_order'                => 0,
        'conditions'                => json_decode('[{"value": "20000", "operator": "<=", "attribute": "cart_item|base_price", "attribute_type": "price"}]'),
        'starts_from'               => null,
        'ends_till'                 => null,
    ]);

    $cartRuleCoupon = CartRuleCoupon::factory()->create([
        'cart_rule_id' => $cartRule->id,
        'code'         => $couponCode = fake()->numerify('bagisto-########'),
        'type'         => 0,
        'is_primary'   => 1,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $cart = Cart::factory()->create([
        'customer_id'         => $customer->id,
        'customer_email'      => $customer->email,
        'customer_first_name' => $customer->first_name,
        'customer_last_name'  => $customer->last_name,
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.coupon.apply'), [
        'code' => $couponCode,
    ])
        ->assertOk()
        ->assertJsonPath('message', trans('shop::app.checkout.coupon.success-apply'))
        ->assertJsonPath('data.id', $cart->id);

    $this->assertPrice($discountAmount, $response['data']['discount_amount']);

    $this->assertPrice($product->price, $response['data']['sub_total']);

    $this->assertModelWise([
        CartRule::class => [
            $this->prepareCartRule($cartRule),
        ],
    ]);

    $this->prepareCartRuleCustomerGroup($cartRule);

    $this->prepareCartRuleChannel($cartRule);

    $this->prepareCartRuleCoupon($cartRuleCoupon);
});

it('should check tax is applying for the simple product into the cart for simple product', function () {
    // Arrange.
    $taxCategory = TaxCategory::factory()->create();

    $taxRate = TaxRate::factory()->create([
        'zip_code' => '',
        'country'  => $countryCode = 'IN',
    ]);

    TaxMap::factory()->create([
        'tax_category_id' => $taxCategory->id,
        'tax_rate_id'     => $taxRate->id,
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            4  => 'tax_category_id',
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'tax_category_id' => [
                'integer_value' => $taxCategory->id,
            ],
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $customer = Customer::factory()->create();

    $cart = Cart::factory()->create([
        'customer_id'         => $customer->id,
        'customer_email'      => $customer->email,
        'customer_first_name' => $customer->first_name,
        'customer_last_name'  => $customer->last_name,
    ]);

    CartItem::factory()->create([
        'product_id' => $product->id,
        'sku'        => $product->sku,
        'type'       => $product->type,
        'name'       => $product->name,
        'cart_id'    => $cart->id,
    ]);

    CustomerAddress::factory()->create([
        'email'        => $customer->email,
        'country'      => $countryCode,
        'cart_id'      => $cart->id,
        'address_type' => 'cart_billing',
    ]);

    CustomerAddress::factory()->create([
        'email'        => $customer->email,
        'country'      => $countryCode,
        'cart_id'      => $cart->id,
        'address_type' => 'cart_shipping',
    ]);

    cart()->setCart($cart);

    cart()->collectTotals();

    $cart->refresh();

    $response = getJson(route('shop.checkout.onepage.summary'))
        ->assertOk()
        ->assertJsonPath('data.id', $cart->id);

    $this->assertPrice($cart->tax_total, $response['data']['tax_total']);

    $this->assertPrice($product->price, $response['data']['sub_total']);

    $this->assertPrice($cart->grand_total, $response['data']['grand_total']);
});

it('should fails the validation error when the product id not provided check customer group price for guest customer with fixed price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'fixed',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 1,
    ]);

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.store', [
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should check customer group price for guest customer with fixed price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'fixed',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 1,
    ]);

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items.0.quantity', $productCustomerGroupPrice->qty)
        ->assertJsonPath('data.items_qty', $productCustomerGroupPrice->qty);

    $this->assertPrice($productCustomerGroupPrice->value * $productCustomerGroupPrice->qty, $response['data']['grand_total']);

    $this->assertPrice($productCustomerGroupPrice->value * $productCustomerGroupPrice->qty, $response['data']['grand_total']);

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should fails the validation error when the product id not provided check customer group price for guest customer with discount price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'discount',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 1,
    ]);

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.store', [
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should check customer group price for guest customer with discount price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'discount',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 1,
    ]);

    $totalAmount = $product->price * $productCustomerGroupPrice->qty;

    $grandTotal = ($totalAmount - ($totalAmount * ($productCustomerGroupPrice->value / 100)));

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', $productCustomerGroupPrice->qty);

    $this->assertPrice($grandTotal, $response['data']['grand_total']);

    $this->assertPrice($grandTotal, $response['data']['sub_total']);

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should fails the validation when product id not provided when check customer group price for general customer with fixed price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'fixed',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 2,
    ]);

    $customer = Customer::factory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should check customer group price for general customer with fixed price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'fixed',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 2,
    ]);

    $customer = Customer::factory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items.0.quantity', $productCustomerGroupPrice->qty)
        ->assertJsonPath('data.items_qty', $productCustomerGroupPrice->qty);

    $this->assertPrice($productCustomerGroupPrice->value * $productCustomerGroupPrice->qty, $response['data']['grand_total']);

    $this->assertPrice($productCustomerGroupPrice->value * $productCustomerGroupPrice->qty, $response['data']['sub_total']);

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should fails the validation error when product id not provided when check customer group price for general customer with discount price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'discount',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 2,
    ]);

    $customer = Customer::factory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should check customer group price for general customer with discount price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'discount',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 2,
    ]);

    $customer = Customer::factory()->create();

    $totalAmount = $product->price * $productCustomerGroupPrice->qty;

    $grandTotal = ($totalAmount - ($totalAmount * ($productCustomerGroupPrice->value / 100)));

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', $productCustomerGroupPrice->qty);

    $this->assertPrice($grandTotal, $response['data']['grand_total']);

    $this->assertPrice($grandTotal, $response['data']['sub_total']);

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should fails the validation error when product id not provided check customer group price for wholesale customer with fixed price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'fixed',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 3,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should check customer group price for wholesale customer with fixed price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'fixed',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 3,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items.0.quantity', $productCustomerGroupPrice->qty)
        ->assertJsonPath('data.items_qty', $productCustomerGroupPrice->qty);

    $this->assertPrice($productCustomerGroupPrice->value * $productCustomerGroupPrice->qty, $response['data']['grand_total']);

    $this->assertPrice($productCustomerGroupPrice->value * $productCustomerGroupPrice->qty, $response['data']['sub_total']);

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should fails the validation error when product id not provided check customer group price for wholesale customer with discount price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'discount',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 3,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should check customer group price for wholesale customer with discount price type for simple product', function () {
    // Arrange.
    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $productCustomerGroupPrice = ProductCustomerGroupPrice::factory()->create([
        'qty'               => rand(2, 5),
        'value_type'        => 'discount',
        'value'             => rand(20, 50),
        'product_id'        => $product->id,
        'customer_group_id' => 3,
    ]);

    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $totalAmount = $product->price * $productCustomerGroupPrice->qty;

    $grandTotal = ($totalAmount - ($totalAmount * ($productCustomerGroupPrice->value / 100)));

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'quantity'   => $productCustomerGroupPrice->qty,
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', $productCustomerGroupPrice->qty);

    $this->assertPrice($grandTotal, $response['data']['grand_total']);

    $this->assertPrice($grandTotal, $response['data']['sub_total']);

    $this->assertDatabaseHas('product_customer_group_prices', [
        'qty'               => $productCustomerGroupPrice->qty,
        'value_type'        => $productCustomerGroupPrice->value_type,
        'value'             => $productCustomerGroupPrice->value,
        'product_id'        => $productCustomerGroupPrice->product_id,
        'customer_group_id' => $productCustomerGroupPrice->customer_group_id,
    ]);
});

it('should fails the validation error when product id not provided check discount price if catalog rule applied for percentage price for simple product for guest customer into cart', function () {
    // Arrange.
    CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([1]);
    })->create([
        'status'     => 1,
        'sort_order' => 1,
    ]);

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.store', [
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();
});

it('should check discount price if catalog rule applied for percentage price for simple product for guest customer into cart', function () {
    // Arrange.
    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([1]);
    })->create([
        'status'     => 1,
        'sort_order' => 1,
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $grandTotal = $product->price - ($product->price * ($catalogRule->discount_amount / 100));

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', 1);

    $this->assertPrice($grandTotal, $response['data']['grand_total']);

    $this->assertPrice($grandTotal, $response['data']['sub_total']);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should fails the validation error when product id not provided check discount price if catalog rule applied for percentage price for simple product for general customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create();

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([2]);
    })->create([
        'status'     => 1,
        'sort_order' => 1,
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for percentage price for simple product for general customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create();

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([2]);
    })->create([
        'status'     => 1,
        'sort_order' => 1,
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $grandTotal = $product->price - ($product->price * ($catalogRule->discount_amount / 100));

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', 1);

    $this->assertPrice($grandTotal, $response['data']['grand_total']);

    $this->assertPrice($grandTotal, $response['data']['sub_total']);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should fails the validation error when the product id not provided check discount price if catalog rule applied for percentage price for simple product for wholesaler customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([3]);
    })->create([
        'status'     => 1,
        'sort_order' => 1,
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for percentage price for simple product for wholesaler customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([3]);
    })->create([
        'status'     => 1,
        'sort_order' => 1,
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    $grandTotal = $product->price - ($product->price * ($catalogRule->discount_amount / 100));

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', 1);

    $this->assertPrice($grandTotal, $response['data']['grand_total']);

    $this->assertPrice($grandTotal, $response['data']['sub_total']);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should fails the validation error when the product id not provided check discount price if catalog rule applied for fixed price for simple product for guest customer into cart', function () {
    // Arrange.
    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([1]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    // Act and Assert.
    postJson(route('shop.api.checkout.cart.store', [
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for fixed price for simple product for guest customer into cart', function () {
    // Arrange.
    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([1]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', 1);

    $this->assertPrice($product->price - $catalogRule->discount_amount, $response['data']['grand_total']);

    $this->assertPrice($product->price - $catalogRule->discount_amount, $response['data']['sub_total']);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should fails the validation error when the product id not provided check discount price if catalog rule applied for fixed price for simple product for general customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create(['customer_group_id' => 2]);

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([2]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for fixed price for simple product for general customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create(['customer_group_id' => 2]);

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([2]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', 1);

    $this->assertPrice($product->price - $catalogRule->discount_amount, $response['data']['grand_total']);

    $this->assertPrice($product->price - $catalogRule->discount_amount, $response['data']['sub_total']);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should fails the validation error when the product id not provided check discount price if catalog rule applied for fixed price for simple product for wholesaler customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([3]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    // Act and Assert.
    $this->loginAsCustomer($customer);

    postJson(route('shop.api.checkout.cart.store', [
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertJsonValidationErrorFor('product_id')
        ->assertUnprocessable();

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for fixed price for simple product for wholesaler customer into cart', function () {
    // Arrange.
    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([3]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $response = postJson(route('shop.api.checkout.cart.store', [
        'product_id' => $product->id,
        'is_buy_now' => '0',
        'quantity'   => '1',
        'rating'     => '0',
    ]))
        ->assertOk()
        ->assertJsonPath('data.items_count', 1)
        ->assertJsonPath('data.items_qty', 1);

    $this->assertPrice($product->price - $catalogRule->discount_amount, $response['data']['grand_total']);

    $this->assertPrice($product->price - $catalogRule->discount_amount, $response['data']['sub_total']);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for fixed price for simple product for guest customer', function () {
    // Arrange.
    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([1]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->assertModelWise([
        CatalogRuleProductPrice::class => [
            [
                'price'             => $product->price - $catalogRule->discount_amount,
                'customer_group_id' => 1,
                'catalog_rule_id'   => $catalogRule->id,
                'product_id'        => $product->id,
            ],
        ],
    ]);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for fixed price for simple product for general customer', function () {
    // Arrange.
    $customer = Customer::factory()->create();

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([2]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $this->assertModelWise([
        CatalogRuleProductPrice::class => [
            [
                'price'             => $product->price - $catalogRule->discount_amount,
                'customer_group_id' => 2,
                'catalog_rule_id'   => $catalogRule->id,
                'product_id'        => $product->id,
            ],
        ],
    ]);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for fixed price for simple product for wholesaler customer', function () {
    // Arrange.
    $customer = Customer::factory()->create();

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([3]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
        'action_type' => 'by_fixed',
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $this->assertModelWise([
        CatalogRuleProductPrice::class => [
            [
                'price'             => $product->price - $catalogRule->discount_amount,
                'customer_group_id' => 3,
                'catalog_rule_id'   => $catalogRule->id,
                'product_id'        => $product->id,
            ],
        ],
    ]);
});

it('should check discount price if catalog rule applied for percentage price for simple product for guest customer', function () {
    // Arrange.
    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([1]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
            26 => 'guest_checkout',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
            'guest_checkout' => [
                'boolean_value' => true,
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->assertModelWise([
        CatalogRuleProductPrice::class => [
            [
                'price'             => $product->price - ($product->price * ($catalogRule->discount_amount / 100)),
                'customer_group_id' => 1,
                'catalog_rule_id'   => $catalogRule->id,
                'product_id'        => $product->id,
            ],
        ],
    ]);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for percentage price for simple product for general customer', function () {
    // Arrange.
    $customer = Customer::factory()->create();

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([2]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $this->assertModelWise([
        CatalogRuleProductPrice::class => [
            [
                'price'             => $product->price - ($product->price * ($catalogRule->discount_amount / 100)),
                'customer_group_id' => 2,
                'catalog_rule_id'   => $catalogRule->id,
                'product_id'        => $product->id,
            ],
        ],
    ]);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});

it('should check discount price if catalog rule applied for percentage price for simple product for wholesaler customer', function () {
    // Arrange.
    $customer = Customer::factory()->create(['customer_group_id' => 3]);

    $catalogRule = CatalogRule::factory()->afterCreating(function (CatalogRule $catalogRule) {
        $catalogRule->channels()->sync([1]);

        $catalogRule->customer_groups()->sync([3]);
    })->create([
        'status'      => 1,
        'sort_order'  => 1,
    ]);

    $product = (new ProductFaker([
        'attributes' => [
            5  => 'new',
            6  => 'featured',
            11 => 'price',
        ],
        'attribute_value' => [
            'new' => [
                'boolean_value' => true,
            ],
            'featured' => [
                'boolean_value' => true,
            ],
            'price' => [
                'float_value' => rand(1000, 5000),
            ],
        ],
    ]))->getSimpleProductFactory()->create();

    // Act and Assert.
    $this->loginAsCustomer($customer);

    $this->assertModelWise([
        CatalogRuleProductPrice::class => [
            [
                'price'             => $product->price - ($product->price * ($catalogRule->discount_amount / 100)),
                'customer_group_id' => 3,
                'catalog_rule_id'   => $catalogRule->id,
                'product_id'        => $product->id,
            ],
        ],
    ]);

    $catalogRule->refresh();

    $this->prepareCatalogRuleCustomerGroup($catalogRule);

    $this->prepareCatalogRuleCoupon($catalogRule);

    $this->prepareCatalogRuleChannel($catalogRule);

    $this->assertModelWise([
        CatalogRule::class => [
            $this->prepareCatalogRule($catalogRule),
        ],
    ]);
});
