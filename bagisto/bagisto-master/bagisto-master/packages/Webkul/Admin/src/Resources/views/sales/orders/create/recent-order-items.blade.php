{!! view_render_event('bagisto.admin.sales.order.create.recent_order_items.before') !!}

<!-- Vue JS Component -->
<v-recent-order-items
    :cart="cart"
    @add-to-cart="configureAddToCart($event); stepReset()"
>
    <!-- Items Shimmer Effect -->
    <x-admin::shimmer.sales.orders.create.items />
</v-recent-order-items>

{!! view_render_event('bagisto.admin.sales.order.create.recent_order_items.after') !!}

@pushOnce('scripts')
    <script
        type="text/x-template"
        id="v-recent-order-items-template"
    >
        <template v-if="isLoading">
            <!-- Items Shimmer Effect -->
            <x-admin::shimmer.sales.orders.create.items />
        </template>

        <template v-else>
            <div class="box-shadow rounded bg-white dark:bg-gray-900">
                <div class="flex items-center justify-between p-4">
                    <p class="text-base font-semibold text-gray-800 dark:text-white">
                        @lang('admin::app.sales.orders.create.recent-order-items.title')
                    </p>
                </div>

                <!-- recent-order items -->
                <div
                    class="grid"
                    v-if="items.length"
                >
                    <div
                        class="row flex gap-2.5 border-b bg-white p-4 transition-all hover:bg-gray-50 dark:border-gray-800 dark:bg-gray-900 dark:hover:bg-gray-950"
                        v-for="item in items"
                    >
                        <!-- Image -->
                        <div
                            class="relative h-[60px] max-h-[60px] w-full max-w-[60px] overflow-hidden rounded"
                            :class="{'overflow-hidden rounded border border-dashed border-gray-300 dark:border-gray-800 dark:mix-blend-exclusion dark:invert': ! item.product.images.length}"
                        >
                            <template v-if="! item.product.images.length">
                                <img src="{{ bagisto_asset('images/product-placeholders/front.svg') }}">
                            
                                <p class="absolute bottom-1.5 w-full text-center text-[6px] font-semibold text-gray-400">
                                    @lang('admin::app.catalog.products.edit.types.grouped.image-placeholder')
                                </p>
                            </template>

                            <template v-else>
                                <img :src="item.product.images[0].url">
                            </template>
                        </div>

                        <!-- Item Information -->
                        <div class="grid gap-1.5">
                            <!-- Item Name -->
                            <p class="text-base font-semibold text-gray-800 dark:text-white">
                                @{{ item.product.name }}
                            </p>

                            <!-- Item SKU -->
                            <p class="text-gray-600 dark:text-gray-300">
                                @{{ "@lang('admin::app.sales.orders.create.recent-order-items.sku', ['sku' => ':replace'])".replace(':replace', item.product.sku) }}
                            </p>

                            <!-- Price -->
                            <p class="text-base font-semibold text-gray-800 dark:text-white">
                                @{{ item.product.formatted_price }}
                            </p>

                            <!-- Item Options -->
                            <div
                                class="grid select-none gap-x-2.5 gap-y-1.5"
                                v-if="item.additional?.attributes && item.additional.attributes.length"
                            >
                                <!-- Details Toggler -->
                                <p
                                    class="flex cursor-pointer items-center gap-1 text-sm text-gray-800 dark:text-white"
                                    @click="item.option_show = ! item.option_show"
                                >
                                    @lang('admin::app.sales.orders.create.recent-order-items.see-details')

                                    <span
                                        class="text-2xl"
                                        :class="{'icon-arrow-up': item.option_show, 'icon-arrow-down': ! item.option_show}"
                                    ></span>
                                </p>

                                <div
                                    class="grid w-full gap-2"
                                    v-show="item.option_show"
                                >
                                    <div v-for="option in item.additional.attributes">
                                        <p class="text-sm text-gray-600 dark:text-white">
                                            @{{ option.attribute_name + ':' }}
                                        </p>

                                        <p class="text-sm font-medium text-gray-800 dark:text-white">
                                            @{{ option.option_label }}
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Item Actions -->
                            <div class="mt-2 flex items-center gap-2.5">
                                <a
                                    :href="'{{ route('admin.sales.orders.view', '') }}/' + item.order_id"
                                    class="cursor-pointer text-sm text-blue-600 transition-all hover:underline"
                                    target="_blank"
                                >
                                    @lang('admin::app.sales.orders.create.recent-order-items.view')
                                </a>

                                <button
                                    class="cursor-pointer text-sm text-emerald-600 transition-all hover:underline"
                                    :disabled="! item.product.is_saleable"
                                    @click="moveToCart(item)"
                                >
                                    @lang('admin::app.sales.orders.create.recent-order-items.add-to-cart')
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Empty Items Box -->
                <div
                    class="grid justify-center justify-items-center gap-3.5 px-2.5 py-10"
                    v-else
                >
                    <img src="{{ bagisto_asset('images/icon-add-product.svg') }}" class="h-20 w-20 dark:mix-blend-exclusion dark:invert">
                    
                    <div class="flex flex-col items-center gap-1.5">
                        <p class="text-base font-semibold text-gray-400">
                            @lang('admin::app.sales.orders.create.recent-order-items.empty-title')
                        </p>
    
                        <p class="text-gray-400">
                            @lang('admin::app.sales.orders.create.recent-order-items.empty-description')
                        </p>
                    </div>
                </div>
            </div>
        </template>
    </script>

    <script type="module">
        app.component('v-recent-order-items', {
            template: '#v-recent-order-items-template',

            props: ['cart'],

            emits: ['add-to-cart'],

            data() {
                return {
                    isLoading: false,

                    items: [],
                };
            },

            mounted() {
                this.get();
            },

            methods: {
                get() {
                    this.isLoading = true;

                    this.$axios.get("{{ route('admin.customers.customers.orders.recent_items', $cart->customer_id) }}")
                        .then(response => {
                            this.items = response.data.data;

                            this.isLoading = false;
                        })
                        .catch(error => {});
                },

                moveToCart(item) {
                    this.$emitter.emit('open-confirm-modal', {
                        agree: () => {
                            this.$emit('add-to-cart', {
                                product: item.product,
                                qty: 1,
                            });
                        }
                    });
                },
            }
        });
    </script>
@endPushOnce