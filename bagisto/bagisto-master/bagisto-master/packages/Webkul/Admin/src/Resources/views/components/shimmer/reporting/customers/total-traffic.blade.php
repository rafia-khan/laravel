<!-- Total Traffic Shimmer -->
<div class="box-shadow relative rounded bg-white p-4 dark:bg-gray-900">
    <!-- Header -->
    <div class="mb-4 flex items-center justify-between">
        <div class="shimmer h-[17px] w-[150px]"></div>

        <div class="shimmer h-[21px] w-[79px]"></div>
    </div>

    <div class="grid gap-4">
        <div class="flex place-content-start gap-4">
            <div class="flex items-center gap-4">
                <div class="shimmer h-9 w-[120px]"></div>
                <div class="shimmer h-[17px] w-[75px]"></div>
            </div>
        </div>

        <div class="shimmer h-5 w-[120px]"></div>

        <!-- Graph Shimmer -->
        <x-admin::shimmer.reporting.graph />

        <!-- Date Range -->
        <div class="flex justify-center gap-5">
            <div class="flex items-center gap-1">
                <div class="shimmer h-3.5 w-3.5 rounded-md"></div>
                <div class="shimmer h-[17px] w-[143px]"></div>
            </div>
            
            <div class="flex items-center gap-1">
                <div class="shimmer h-3.5 w-3.5 rounded-md"></div>
                <div class="shimmer h-[17px] w-[143px]"></div>
            </div>
        </div>
    </div>
</div>